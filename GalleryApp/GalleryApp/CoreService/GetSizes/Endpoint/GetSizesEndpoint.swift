//
//  GetSizesEndpoint.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

struct GetSizesEndpoint: Endpoint {
    let apiKey: String
    let photoId: String

    init(apiKey: String, photoId: String) {
        self.apiKey = apiKey
        self.photoId = photoId
    }
    var url: String {
        return "https://api.flickr.com/services/rest/"
    }

    var method: RequestMethod {
        return .get
    }

    var body: Data? {
        return nil
    }

    var headers: [String : String] =  [:]

    var queries: [String : String] {
        return  [
            "method": "flickr.photos.getSizes",
            "api_key": apiKey,
            "photo_id": photoId,
            "format": "json",
            "nojsoncallback": "1"
        ]
    }
}
