//
//  GalleryStrings.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

import Foundation

class GalleryStrings {
    private static var tableName = "GalleryStrings"
    
    static func localized(for key: String) -> String {
        let bundle = Bundle(for: GalleryStrings.self)
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
    
    static let loadingMessage = localized(for: "loadingMessage")
    static let appName = localized(for: "appName")
    static let search = localized(for: "search")
    static let tryAgain = localized(for: "tryAgain")
    static let errorTitle = localized(for: "errorTitle")
    static let confirm = localized(for: "confirm")
}
