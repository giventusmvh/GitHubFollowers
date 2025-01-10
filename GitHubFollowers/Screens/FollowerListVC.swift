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
        NetworkManager.shared.getFollowers(username: username, page: 1) { result in
            switch result{
            case .success(let followers):
                print("\(followers.count)")
            case . failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    


}
