//
//  ImageEndpoint.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

struct ImageEndpoint: Endpoint {
    init(url: String) {
        self.url = url
    }

    var url: String

    var method: RequestMethod {
        return .get
    }

    var body: Data? {
        return nil
    }

    var headers: [String : String] = [:]

    var queries: [String : String] = [:]
}
