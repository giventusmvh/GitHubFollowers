//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 01/01/25.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(username: username, page: 1) { followers, errorMessage in
            guard let followers = followers else{
                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: errorMessage!, buttonTitle: "OK")
                return
            }
            
            print("\(followers.count)")
        }
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    


}
