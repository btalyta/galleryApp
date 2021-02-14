//
//  GalleryRepository.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

class GalleryRepository: GalleryRepositoryProtocol {
    private let network: HttpRequestProtocol

    init(network: HttpRequestProtocol = HttpRequest.shared) {
        self.network = network
    }

    func resquestPhotos(tags: String, page: Int, completion: @escaping ((Result<Photos, APIError>) -> Void)) {
        let apiKey = KeyManager.shared.getKey()
        let endpoint = SearchEndpoint(apiKey: apiKey, tags: tags, page: page)
        network.request(SearchResponse.self, from: endpoint) { result in
            switch result {
            case.success(let data):
                completion(.success(data.photos))
            case .failure(let serviceError):
                guard let error = serviceError as? APIError else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                completion(.failure(error))
            }
        }
    }
}
