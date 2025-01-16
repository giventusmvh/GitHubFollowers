//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 13/01/25.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject{
    func didTapGithubProfile(user: User)
    
}

class GFRepoItemVC: GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate!
    
    init(user:User, delegate: GFRepoItemVCDelegate){
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
        itemInfoViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTap() {
        delegate.didTapGithubProfile(user: user)
    }
}
