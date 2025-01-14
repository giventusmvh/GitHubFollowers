//
//  FavoriteListVC.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 25/12/24.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    let tableView = UITableView()
    var favourites: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavourites()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        title = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.reuseID)
    }
    
    func getFavourites(){
        
        
        PersistenceManager.retrieveFavourites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favourites):
                
                if favourites.isEmpty{
                    showEmptyStateView(message: "No favourites yet.", view: self.view)
                }else{
                    self.favourites = favourites
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
               
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    


}

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.reuseID) as! FavouriteCell
        let favourite = favourites[indexPath.row]
        
        cell.set(favourite: favourite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favourite = favourites[indexPath.row]
        let desVC = FollowerListVC()
        desVC.username = favourite.login
        desVC.title = favourite.login
        navigationController?.pushViewController(desVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let favouriteToRemove = favourites[indexPath.row]
                
                // Remove from the data source
                favourites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                // Remove from persistence
                PersistenceManager.update(favourite: favouriteToRemove, actionType: .remove) { [weak self] error in
                    guard let self = self else { return }
                    if let error = error {
                        self.presentGFAlertOnMainThread(title: "Unable to Remove", message: error.rawValue, buttonTitle: "OK")
                    }
                }
            }
        }
    
    
}
