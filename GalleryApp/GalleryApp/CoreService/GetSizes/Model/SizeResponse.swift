//
//  SizeResponse.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

struct SizeResponse: Decodable, Equatable {
    let value: Sizes
}

struct Sizes: Decodable, Equatable {
    let size: [Size]
}

struct Size: Decodable, Equatable {
    let label: Label
    let width, height: Int
    let source: String
    let url: String
}

extension Size {
    enum Label: String, Equatable {
        case largeSquare = "Large Square"
        case other
    }
}

extension Size.Label: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(String.self)
        guard let status = Size.Label(rawValue: data.lowercased()) else {
            self = .other
            return
        }
        self = status
    }
}
