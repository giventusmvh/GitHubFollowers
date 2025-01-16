//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 12/01/25.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject{
    func didRequestFollowers(username: String)
}

class UserInfoVC: GFDataLoadingVC {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    
    var itemViews: [UIView] = []
    
    weak var delegate: UserInfoVCDelegate!
    
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        configureViewController()
        layoutUI()
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(username: username) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async{
                    self.configureUIElements(user: user)
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    

    func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector (dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC(){
            dismiss(animated: true)
    }
    
    func configureUIElements(user:User){
        
        let repoItemVC = GFRepoItemVC(user: user, delegate: self)
       // repoItemVC.delegate = self
        
        let followerItemVC = GFFollowersItemVC(user: user, delegate: self)
        //followerItemVC.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), containerView: self.headerView)
        self.add(childVC: repoItemVC, containerView: self.itemViewOne)
        self.add(childVC: followerItemVC, containerView: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(String(describing: user.createdAt.convertToMonthYearFormat()))"
    }

    func layoutUI(){
        let padding:CGFloat = 20
        let itemHeight:CGFloat = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemViews{
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        headerView.backgroundColor = .systemBackground
        
       
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func add(childVC: UIViewController, containerView:UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }

}

extension UserInfoVC: GFRepoItemVCDelegate{
    func didTapGithubProfile(user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "URL attached to this user is invalid.", buttonTitle: "OK")
            return
        }
        
        presentSafariVC(url: url)
        
    }
    
    
}

extension UserInfoVC: GFFollowersItemVCDelegate{
    func didTapGetFollowers(user: User) {
        
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers.", buttonTitle: "OK")
            return
        }
        
        delegate.didRequestFollowers(username: user.login)
        dismissVC()
    }
    
    
}


//extension UserInfoVC: ItemInfoVCDelegate{
//    func didTapGithubProfile(user: User) {
//        guard let url = URL(string: user.htmlUrl) else {
//            presentGFAlertOnMainThread(title: "Invalid URL", message: "URL attached to this user is invalid.", buttonTitle: "OK")
//            return
//        }
//        
//        presentSafariVC(url: url)
//        
//    }
//    
//    func didTapGetFollowers(user: User) {
//        
//        guard user.followers != 0 else {
//            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers.", buttonTitle: "OK")
//            return
//        }
//        
//        delegate.didRequestFollowers(username: user.login)
//        dismissVC()
//    }
//    
//    
//    
//}
