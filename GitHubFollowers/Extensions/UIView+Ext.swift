//
//  UIView+Ext.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 15/01/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
}
