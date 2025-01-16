//
//  Constants.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 12/01/25.
//

import UIKit

enum SFSymbols {
    
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName:"heart")
    static let following = UIImage(systemName:"person.2")
    
}

enum Images{
    static let ghLogo = UIImage(named: "gh-logo")
    static let placeholder = UIImage(named: "avatar-placeholder")
    static let emptyState = UIImage(named: "empty-state-logo")
}


enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale

    // iPhone SE
    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    
    // iPhone 8 and variants
    static let isiPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale

    // iPhone X, XR, XS, XS Max
    static let isiPhoneX = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr = idiom == .phone && ScreenSize.maxLength == 896.0

    // iPhone 11, 12, 13 variants
    static let isiPhone11Pro = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhone11ProMaxAndXsMax = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPhone12And13Mini = idiom == .phone && ScreenSize.maxLength == 780.0
    static let isiPhone12And13 = idiom == .phone && ScreenSize.maxLength == 844.0
    static let isiPhone12ProMaxAnd13ProMax = idiom == .phone && ScreenSize.maxLength == 926.0

    // iPhone 14 and 14 Pro variants
    static let isiPhone14 = idiom == .phone && ScreenSize.maxLength == 844.0 && nativeScale == scale
    static let isiPhone14Pro = idiom == .phone && ScreenSize.maxLength == 844.0 && nativeScale > scale
    static let isiPhone14Plus = idiom == .phone && ScreenSize.maxLength == 926.0 && nativeScale == scale
    static let isiPhone14ProMax = idiom == .phone && ScreenSize.maxLength == 926.0 && nativeScale > scale

    // iPhone 15 and 15 Pro variants
    static let isiPhone15 = idiom == .phone && ScreenSize.maxLength == 844.0 && nativeScale == scale
    static let isiPhone15Plus = idiom == .phone && ScreenSize.maxLength == 926.0 && nativeScale == scale
    static let isiPhone15Pro = idiom == .phone && ScreenSize.maxLength == 844.0 && nativeScale > scale
    static let isiPhone15ProMax = idiom == .phone && ScreenSize.maxLength == 926.0 && nativeScale > scale

    // iPad
    static let isiPad = idiom == .pad && ScreenSize.maxLength >= 1024.0

    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr || isiPhone11Pro || isiPhone12And13Mini
    }
}

