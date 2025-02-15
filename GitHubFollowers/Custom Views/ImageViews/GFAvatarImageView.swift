//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 11/01/25.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    
    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func downloadImage(urlString:String){
//        
//        let cacheKey = NSString(string: urlString)
//        let stringUrl = cacheKey as String
//        
//        if let image = cache.object(forKey: cacheKey) {
//            self.image = image
//            return
//        }
//        
//        guard let url = URL(string: urlString) else { return }
//        
//        let task =  URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self else { return }
//            
//            if error != nil { return }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
//            
//            guard let data else { return }
//            
//            guard let image = UIImage(data: data) else { return }
//            
//            cache.setObject(image, forKey: stringUrl as NSString)
//            
//            DispatchQueue.main.async {
//                self.image = image
//            }
//            
//        }
//        
//        task.resume()
//    }
    
}
