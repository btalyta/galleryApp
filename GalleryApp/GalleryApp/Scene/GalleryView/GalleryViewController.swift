//
//  ViewController.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

class GalleryViewController: UIViewController {

    private let presenter: GalleryPresenterProtocol
    private let searchController: UISearchController
    private let contentView: PhotosView

    init(presenter: GalleryPresenterProtocol,
         searchController: UISearchController = UISearchController(searchResultsController: nil),
         contentView: PhotosView = PhotosView()) {
        self.presenter = presenter
        self.searchController = searchController
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

        title = GalleryStrings.appName
        view.backgroundColor = .white
        configureSearchController()
        bindActions()
    }

    private func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = GalleryStrings.search
        searchController.searchBar.barStyle = .default
        searchController.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func bindActions() {
        contentView.didTapItem = { item in
            // TODO: Call next controller
        }

        contentView.loadMore = { [weak self] in
            self?.presenter.loadMore()
        }
    }
}

extension GalleryViewController: GalleryViewControllerProtocol {
    func show(viewModel: PhotosViewModel) {
        contentView.show(viewModel: viewModel)
    }

    func showError(message: String) {
        let alert = UIAlertController(title: GalleryStrings.errorTitle,
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: GalleryStrings.confirm, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: GalleryStrings.tryAgain,
                                                  style: .default,
                                                  handler: { [weak self]  _ in
                                                    self?.presenter.loadMore()
                                                  }))
        present(alert, animated: true)
    }

}

extension GalleryViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            presenter.wantsToSearch(text: text)
        }
    }
}
