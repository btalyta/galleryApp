//
//  PhotoView.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

class PhotosView: UIView {
    var didTapItem: ((_ index: Int) -> Void)?
    var loadMore: (() -> Void)?

    private let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collection.alwaysBounceVertical = true
        collection.backgroundColor = .white
        return collection
    }()
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.isHidden = true
        return view
    }()

    private var dataSource: PhotosDataSource

    init(frame: CGRect = .zero,
         imageDownloader: ImageDownloaderProtocol = ImageDownloader()) {
        self.dataSource = PhotosDataSource(imageDownloader: imageDownloader)
        super.init(frame: frame)
        
        setupView()
        addConstraints()
        addActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(collectionView)
        addSubview(loadingView)
    }

    private func addConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        let loadingViewConstraints = [
            loadingView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            loadingView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(loadingViewConstraints)
    }

    private func addActions() {
        dataSource.didTapItem = { [weak self] index in
            self?.didTapItem?(index)
        }

        dataSource.loadMore = { [weak self] in
            self?.loadMore?()
        }
    }

    private func setupDataSource() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    func show(viewModel: PhotosViewModel) {
        loadingView.show(startAnimating: viewModel.isLoading)
        loadingView.isHidden = !viewModel.isLoading

        dataSource.update(items: viewModel.photos,
                          hasMore: viewModel.hasMore,
                          isLoading: viewModel.isLoading)
        setupDataSource()
    }
}

