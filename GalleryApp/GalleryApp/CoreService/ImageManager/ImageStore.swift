//
//  ImageStore.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

class ImageStore {
    static let shared = NSCache<NSString, UIImage>()
}

class ImageStoreManager {
    func save(_ image: UIImage, _ key: NSString) {
        ImageStore.shared.setObject(image, forKey: key)
    }

    func getImage(_ key: NSString) -> UIImage? {
        return ImageStore.shared.object(forKey: key)
    }
}
