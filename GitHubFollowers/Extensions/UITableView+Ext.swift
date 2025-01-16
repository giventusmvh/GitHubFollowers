//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 16/01/25.
//

import UIKit

extension UITableView{
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
