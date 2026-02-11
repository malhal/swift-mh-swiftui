//
//  MainMenu.swift
//  swift-mh-swiftui
//
//  Created by Malcolm Hall on 11/02/2026.
//
import Foundation
import SwiftUI

extension Text {
    enum MainMenu {
        private static let bundle = Bundle(identifier: "com.apple.SwiftUI")!
        private static let table = "MainMenu"

        /// Helper to fetch the App Name from your project's Info.plist
        private static var appName: String {
            Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
            ?? "App"
        }

        /// Usage: Text.MainMenu.about() -> "About ActorStream"
        /// Usage: Text.MainMenu.about("Custom Name") -> "About Custom Name"
        static func about(_ name: String = appName) -> Text {
            // Using interpolation here ensures SwiftUI looks for the "About %@" key
            Text("About \(name)", tableName: table, bundle: bundle)
        }
        
        /// Simple static property for keys without arguments
        static var edit: Text {
            Text("Edit", tableName: table, bundle: bundle)
        }
    }
}
