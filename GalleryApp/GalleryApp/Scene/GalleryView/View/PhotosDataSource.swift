//
//  PhotosDataSource.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

class PhotosDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    var didTapItem: ((_ index: Int) -> Void)?
    var loadMore: (() -> Void)?
    private var items: [Photo]
    private var imageDownloader: ImageDownloaderProtocol
    private var hasMore: Bool = true
    private var isLoading: Bool = false

    init(imageDownloader: ImageDownloaderProtocol = ImageDownloader(),
         items: [Photo] = []) {
        self.items = items
        self.imageDownloader = imageDownloader
    }

    func update(items: [Photo], hasMore: Bool, isLoading: Bool) {
        self.items = items
        self.hasMore = hasMore
        self.isLoading = isLoading
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }

        imageDownloader.getPhoto(from: items[indexPath.row].id) { imageResult in
            cell.show(imageResult)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapItem?(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row >= items.count - 4 && hasMore  && !isLoading{
            loadMore?()
        }
    }
}

extension PhotosDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width/2 - 16
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
