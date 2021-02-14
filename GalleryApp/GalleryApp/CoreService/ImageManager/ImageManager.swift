//
//  ImageManager.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import NetworkingModule
import UIKit

protocol ImageManagerProtocol {
    func download(_ key: String, imageUrl: String, completion: @escaping ((UIImage?) -> Void))
}

class ImageManager: ImageManagerProtocol {
    private let imageStore: ImageStoreManager
    private let network: HttpRequestProtocol

    init(imageStore: ImageStoreManager = ImageStoreManager(),
         network: HttpRequestProtocol = HttpRequest.shared) {
        self.imageStore = imageStore
        self.network = network
    }

    func download(_ key: String, imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        let endpoint = ImageEndpoint(url: imageUrl)

        network.request(from: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let imageResult = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self?.saveImage(imageResult, key)
                completion(imageResult)
            case .failure:
                completion(nil)
            }
        }
    }

    private func saveImage(_ image: UIImage, _ key: String) {
        let path = NSString(string: key)
        imageStore.save(image, path)
    }
}
