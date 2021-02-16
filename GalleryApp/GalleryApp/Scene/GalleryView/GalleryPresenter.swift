//
//  GalleryViewPresenter.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

class GalleryPresenter: GalleryPresenterProtocol {
    private let repository: GalleryRepositoryProtocol
    private var currentPage: Int
    private var isLast: Bool
    private var tag: String
    private var model: PhotosViewModel
    weak var viewController: GalleryViewControllerProtocol?

    init(repository: GalleryRepositoryProtocol) {
        self.repository = repository
        self.currentPage = 0
        self.isLast = false
        self.tag = ""
        self.model = PhotosViewModel()
    }

    func wantsToSearch(text: String) {
        handlerTag(text)
        currentPage = 0
        model.photos = []
        makeRequest()
    }

    func loadMore() {
        if tag.isEmpty {
            return
        }
        makeRequest()
    }

    func didSelectItem(row: Int) {
        viewController?.wantsToShow(model.photos[row])
    }

    private func makeRequest() {
        if isLast {
            return
        }

        updateModel(isLoading: true)

        currentPage += 1
        repository.resquestPhotos(tags: tag, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let response):
                self.handlerResponse(response)
            case .failure(let error):
                self.currentPage -= 1
                self.updateModel(isLoading: false)
                self.viewController?.showError(message: self.handlerError(error))
            }
        }
    }

    private func handlerTag(_ text: String) {
        tag = text.lowercased()
    }

    private func handlerResponse(_ data: Photos) {
        isLast = data.pages == currentPage
        model.photos.append(contentsOf: data.photo)
        updateModel(isLoading: false)
    }

    private func handlerError(_ error: APIError) -> String {
        switch error {
        case .timeout:
            return GalleryStrings.timeoutError
        case .unauthorized:
            return GalleryStrings.unauthorized
        case .service, .request:
            return GalleryStrings.serviceError
        case .decode, .jsonConversionFailure, .invalidData:
            return GalleryStrings.decodeError
        }
    }

    private func updateModel(isLoading: Bool) {
        model.hasMore = !isLast
        model.isLoading = isLoading

        viewController?.show(viewModel: model)
    }
}
