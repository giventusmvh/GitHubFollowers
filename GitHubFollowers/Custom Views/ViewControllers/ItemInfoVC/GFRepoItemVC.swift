//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 13/01/25.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTap() {
        delegate.didTapGithubProfile(user: user)
    }
}
