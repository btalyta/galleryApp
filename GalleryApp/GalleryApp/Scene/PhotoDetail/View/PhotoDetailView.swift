//
//  PhotoDetailView.swift
//  GalleryApp
//
//  Created by Barbara Souza on 16/02/21.
//

import UIKit

class PhotoDetailView: UIView {
    private let photoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let photoTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.translatesAutoresizingMaskIntoConstraints = false

        addSubview(photoView)
        addSubview(photoTitle)

        backgroundColor = .white
    }

    private func addConstraints() {
        let photoViewConstraints = [
            photoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            photoView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            photoView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            photoView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8)
        ]

        NSLayoutConstraint.activate(photoViewConstraints)

        let photoTitleConstraints = [
            photoTitle.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 8),
            photoTitle.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            photoTitle.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            photoTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(photoTitleConstraints)
    }

    func show(viewModel: PhotoDetailViewModel) {
        photoView.image = viewModel.image
        photoTitle.text = viewModel.title
    }
}
