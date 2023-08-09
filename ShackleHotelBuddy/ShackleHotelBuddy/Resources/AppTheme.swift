//
//  AppTheme.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//
import SwiftUI

protocol AppLayout {
    var padding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var secondaryCornerRadius: CGFloat { get }
    var buttonSize: CGFloat { get }
    var callToActionSize: CGFloat { get }
    var stackViewSpacing: CGFloat { get }
}

protocol AppColors {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

protocol AppImages {
    var background: String { get }
    var logo: String { get }
}

struct AppTheme {
    
    struct ViewLayout: AppLayout {
        var padding: CGFloat = 16.0
        var cornerRadius: CGFloat = 10.0
        var secondaryCornerRadius: CGFloat = 20.0
        var buttonSize: CGFloat = 36.0
        var callToActionSize: CGFloat = 44.0
        var stackViewSpacing: CGFloat = 5.0
    }
    
    struct Colors: AppColors {
        let primary = Color("color/darkCyan")
        let secondary = Color("color/grey")
        let tertiary = Color("color/veryLightGrey")
    }
    
    struct Images: AppImages {
        var background = "images/background"
        var logo = "images/logo"
    }
    
    init(_ colors: AppColors = Colors(),
         _ padding: AppLayout = ViewLayout(),
         _ images: AppImages = Images()) {
        self.colors = colors
        self.layout = padding
        self.images = images
    }
    
    let colors: AppColors
    let layout: AppLayout
    let images: AppImages
}

struct AppThemeKey: EnvironmentKey {
    static var defaultValue: AppTheme = AppTheme()
}

extension EnvironmentValues {
    var appTheme: AppTheme {
        get {
            self[AppThemeKey.self]
        }
        set {
            self[AppThemeKey.self] = newValue
        }
    }
}
