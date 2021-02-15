//
//  PhotoViewModel.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

struct PhotosViewModel: Equatable {
    var photos: [Photo] = []
    var hasMore: Bool = true
    var isLoading: Bool = false
}
