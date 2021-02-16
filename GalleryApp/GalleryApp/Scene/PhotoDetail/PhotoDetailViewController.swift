//
//  PhotoDetailViewController.swift
//  GalleryApp
//
//  Created by Barbara Souza on 16/02/21.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    private let presenter: PhotoDetailPresenterProtocol
    private let contentView: PhotoDetailView

    init(presenter: PhotoDetailPresenterProtocol,
         contentView: PhotoDetailView = PhotoDetailView()) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidiLoad()
    }
}

extension PhotoDetailViewController: PhotoDetailViewControllerProtocol {
    func show(viewModel: PhotoDetailViewModel) {
        contentView.show(viewModel: viewModel)
    }
}
