//
//  Localizable.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

// MARK: - Strings

internal enum Localized {

    internal enum Home {

        internal enum SearchCriteria {
            
            internal static let text = Localized.tr("Localizable", "Home.SearchCriteria.TITLE")
            
            internal enum Adults {
                internal static let text = Localized.tr("Localizable", "Home.SearchCriteria.Adults.TITLE")
            }
            
            internal enum Children {
                internal static let text = Localized.tr("Localizable", "Home.SearchCriteria.Children.TITLE")
            }
            
            internal enum CheckInDate {
                internal static let text = Localized.tr("Localizable", "Home.SearchCriteria.CheckInDate.TITLE")
            }
            
            internal enum CheckOutDate {
                internal static let text = Localized.tr("Localizable", "Home.SearchCriteria.CheckOutDate.TITLE")
            }
            
        }
        
        internal enum Button {
            internal static let text = Localized.tr("Localizable", "Home.Button.Title")
        }
    }
}

extension Localized {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
      }
}

// MARK: - Implementation Details

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
