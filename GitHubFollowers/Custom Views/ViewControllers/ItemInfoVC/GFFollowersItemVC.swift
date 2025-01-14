//
//  GFFollowersItemVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 13/01/25.
//

import UIKit


class GFFollowersItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, count: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, count: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTap() {
        delegate.didTapGetFollowers(user: user)
    }
    
}
