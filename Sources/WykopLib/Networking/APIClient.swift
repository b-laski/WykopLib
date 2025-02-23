import Foundation
import Combine

protocol APIClientProtocol {
    func send<R: RequestType>(_ request: R) async -> AnyPublisher<R.Response, Error> where R.Response: Codable
}

enum APIClientError: Error {
    case invalidURL
    case networkError(Error)
    case decodingFailed(String)
}

class APIClient: APIClientProtocol {

    let baseUrl: BaseURL
    let session: URLSession

    init(baseUrl: BaseURL = .v3, session: URLSession = .shared) {
        self.baseUrl = baseUrl
        self.session = session
    }

    func send<R: RequestType>(_ request: R) -> AnyPublisher<R.Response, Error> where R.Response: Codable {
        let urlRequest: URLRequest
        do {
            urlRequest = try createURLRequest(for: request)
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIClientError.networkError(URLError(.badServerResponse))
                }
                return data
            }
            .decode(type: ApiResponse<R.Response>.self, decoder: JSONDecoder())
            .tryMap { apiResponse -> R.Response in
                switch apiResponse {
                case .success(let response):
                    return response
                case .error(let error):
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }
}

private extension APIClient {

    private func createURLRequest<R: RequestType>(for request: R) throws -> URLRequest {
        var builder = URLRequestBuilder(baseURL: baseUrl.url)
            .setPath(request.path)
            .setQueryItems(request.queryItems)
            .setMethod(request.method)

        if let body = request.body {
            builder = try builder.setBody(body)
        }

        return try builder.build()
    }
}
