//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 10/01/25.
//

import Foundation


class NetworkManager{
    
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    
    private init(){}
    
    func getFollowers(username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void){
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else{
            completed(nil,"This username created an invalid request. Please try again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(nil,"An error occured while fetching followers")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(nil,"Invalid response from the server. Please try again")
                return
            }
            
            guard let data = data else{
                completed(nil, "The data received from the server is invalid. Please try again")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }catch{
                completed(nil,"An error occured while decoding the data. Please try again")
            }
            
        }
        task.resume()
    }
}
