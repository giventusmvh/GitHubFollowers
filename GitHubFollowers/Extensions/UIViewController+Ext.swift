//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 10/01/25.
//

import Foundation
import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title:String, message:String, buttonTitle:String) {
        DispatchQueue.main.async {
            //self.present(GFAlertVC(title: title, message: message, buttonTitle: buttonTitle), animated: true)
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
