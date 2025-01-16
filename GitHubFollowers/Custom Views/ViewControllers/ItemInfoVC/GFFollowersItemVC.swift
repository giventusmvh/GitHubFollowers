//
//  GFFollowersItemVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 13/01/25.
//

import UIKit

protocol GFFollowersItemVCDelegate: AnyObject{
    func didTapGetFollowers(user: User)
}

class GFFollowersItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowersItemVCDelegate!
    
    init(user:User, delegate: GFFollowersItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
