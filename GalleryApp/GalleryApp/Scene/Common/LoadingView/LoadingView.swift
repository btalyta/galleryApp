//
//  LoadingView.swift
//  GalleryApp
//
//  Created by Barbara Souza on 15/02/21.
//

import UIKit

class LoadingView: UIView {
    private let loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        return view
    }()

    private let loadingLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        view.text = GalleryStrings.loadingMessage
        return view
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }

    private func setupView() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(loadingLabel)
        addSubview(loadingIndicator)

        backgroundColor = GalleryColors.loadColor
    }

    private func addConstraints() {
        let indicatorConstraints = [
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]

        NSLayoutConstraint.activate(indicatorConstraints)

        let labelConstraints = [
            loadingLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 16),
            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]

        NSLayoutConstraint.activate(labelConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func show(startAnimating: Bool) {
        if startAnimating {
            loadingIndicator.startAnimating()
            return
        }

        loadingIndicator.stopAnimating()
    }
}
