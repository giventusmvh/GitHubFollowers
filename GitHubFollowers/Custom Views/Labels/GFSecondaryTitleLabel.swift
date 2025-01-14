//
//  GFSecondaryTitleLabel.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 12/01/25.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size: CGFloat){
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: size, weight: .medium)
        configure()
    }
    
    private func configure(){
        textColor = .secondaryLabel
       // font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
