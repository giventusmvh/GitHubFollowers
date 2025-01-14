//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 14/01/25.
//

import Foundation

enum PersistenceActionType{
    case add,remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum keys{
        static let favourites = "favourites"
    }
    
    static func update(favourite:Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void){
        retrieveFavourites { result in
            switch result{
            case .success(let favourites):
                var retrievedFavourites = favourites
                switch actionType{
                case .add:
                    
                    guard !retrievedFavourites.contains(favourite) else {
                        completed(.alreadyFavorite)
                        return
                    }
                    
                    retrievedFavourites.append(favourite)
                    
                case .remove:
                    retrievedFavourites.removeAll(where: { $0.login == favourite.login })
                }
                
                completed(saveFavourites(favourites: retrievedFavourites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavourites(completed: @escaping (Result<[Follower], GFError>) -> Void){
        guard let favouritesData = defaults.object(forKey: keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouritesData)
            completed(.success(favourites))
        }catch{
            completed(.failure(.unableToFavourites))
        }
    }
    
    static func saveFavourites(favourites: [Follower])->GFError?{
        
        do {
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.set(encodedFavourites, forKey: keys.favourites)
            return nil

        } catch {
            return .unableToFavourites
        }
        
    }
}
