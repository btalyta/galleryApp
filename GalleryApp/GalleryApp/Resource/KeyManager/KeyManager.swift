//
//  KeyManager.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

protocol KeyManagerProtocol {
    func getKey() -> String
}

class KeyManager: KeyManagerProtocol {
    static var shared: KeyManagerProtocol = KeyManager()
    private let apiKey: String

    init() {
        guard let filePath = Bundle.main.path(forResource: "Flickr-Info", ofType: "plist") else {
            apiKey = ""
            return
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            apiKey = ""
            return
        }
        apiKey = value
    }

    func getKey() -> String {
        return apiKey
    }
}
