//
//  ImageMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import UIKit

final class ImageMock {
    static func createImage(with color: UIColor, width: Int = 10, height: Int = 10) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
