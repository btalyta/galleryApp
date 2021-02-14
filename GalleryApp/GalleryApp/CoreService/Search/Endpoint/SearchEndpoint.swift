//
//  SearchEndpoint.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

struct SearchEndpoint: Endpoint {
    let apiKey: String
    let tags: String
    let page: Int

    init(apiKey: String, tags: String, page: Int) {
        self.apiKey = apiKey
        self.tags = tags
        self.page = page
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
            "method": "flickr.photos.search",
            "api_key": apiKey,
            "tags": tags,
            "page": "\(page)",
            "format": "json",
            "nojsoncallback": "1"
        ]
    }
}
