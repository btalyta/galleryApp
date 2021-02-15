//
//  ImageDownloader.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import NetworkingModule
import UIKit

protocol ImageDownloaderProtocol {
    func getPhoto(from id: String, completion: @escaping ((UIImage?) -> Void))
}

class ImageDownloader: ImageDownloaderProtocol {
    private let network: HttpRequestProtocol
    private let imageStore: ImageStoreManager
    private let imageManager: ImageManagerProtocol

    init(network: HttpRequestProtocol = HttpRequest.shared,
         imageStore: ImageStoreManager = ImageStoreManager(),
         imageManager: ImageManagerProtocol = ImageManager()) {
        self.network = network
        self.imageStore = imageStore
        self.imageManager = imageManager
    }

    func getPhoto(from id: String, completion: @escaping ((UIImage?) -> Void)) {
        if let image = getImage(key: id) {
            completion(image)
            return
        }

        let apiKey = KeyManager.shared.getKey()
        let endpoint = GetSizesEndpoint(apiKey: apiKey, photoId: id)
        network.request(SizeResponse.self, from: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                self?.loadImage(from: id, sizes: data.sizes.size, completion: completion)
            case .failure:
                completion(nil)
            }
        }
    }

    private func getImage(key: String) -> UIImage? {
        let path = NSString(string: key)
        return imageStore.getImage(path)
    }

    private func loadImage(from id: String, sizes: [Size], completion: @escaping ((UIImage?) -> Void)) {
        let largeSquare = sizes.first {
            $0.label == .largeSquare
        }

        guard let url = largeSquare?.source else {
            completion(nil)
            return
        }

        imageManager.download(id, imageUrl: url, completion: completion)
    }
}
