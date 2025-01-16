//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 11/01/25.
//

import UIKit

class GFEmptyStateView: UIView {
    
    var messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message:String){
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure(){
        configureMessageLabel()
        configureLogoImageView()
    }
    
    private func configureMessageLabel(){
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        let labelCenteredYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
        
        let messageLabelCenteredYConstraint =  messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: labelCenteredYConstant)
        messageLabelCenteredYConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            //messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureLogoImageView(){
        addSubview(logoImageView)
        logoImageView.image = Images.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
        let logoImageViewBottomConstraint = logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: logoBottomConstant)
        logoImageViewBottomConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            //logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
            
        ])
    }
    
}
