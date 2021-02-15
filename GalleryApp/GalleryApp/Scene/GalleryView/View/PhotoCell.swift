//
//  PhotoCell.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    private (set) static var identifier = "PhotoCell"
    private let photoImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
    }

    private func setupView() {
        contentView.addSubview(photoImage)
    }

    private func addConstraints() {
        photoImage.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            photoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            photoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            photoImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            photoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func show(_ image: UIImage?) {
        photoImage.image = image
    }
}
