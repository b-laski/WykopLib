//
//  Entries.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 16/02/2025.
//

import Combine

final class EntriesApi {

    let apiClient: APIClient

    public init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    public func fetchHotEntries(filter: EntriesFilter = .sixHours) -> AnyPublisher<[Entry], Error> {

        let params = EntriesRequestParameters.hot(filter: filter)
        let request = Entries.fetchEntries(params: params)

        return apiClient.send(request).eraseToAnyPublisher()
    }
}
