import Foundation
import Combine

protocol APIClientProtocol {
    func fetch<T: Decodable>(_ request: URLRequest) async -> AnyPublisher<T, Error>
}

enum APIClientError: Error {
    case invalidURL
    case networkError(Error)
    case decodingFailed(String)
}

class APIClient: APIClientProtocol {

    let session: URLSession
    let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }

    func fetch<T: Decodable>(_ request: URLRequest) async -> AnyPublisher<T, Error> {

        return session.dataTaskPublisher(for: request)
                .map(\.data)
                .decode(type: T.self, decoder: decoder)
                .mapError({ error -> APIClientError in
                    switch error {
                    case let urlError as URLError:
                        switch urlError.code {
                        case .badServerResponse, .timedOut:
                            return .networkError(urlError)
                        default:
                            return .invalidURL
                        }
                    case let jsonDecodingError as DecodingError:
                        return .decodingFailed(jsonDecodingError.localizedDescription)
                    default:
                        return .networkError(error)
                    }
                })
                .eraseToAnyPublisher()
    }
}
