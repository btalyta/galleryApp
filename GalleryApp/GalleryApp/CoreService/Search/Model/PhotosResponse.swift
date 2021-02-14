//
//  SearchResponse.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

struct Photos: Decodable, Equatable {
    let page, pages, perpage: Int
    let photo: [Photo]
}

struct Photo: Decodable, Equatable {
    let id: String
    let title: String
}
