//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 6/2/25.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
        
    }
    
    func addSubviews() {
        // Stack views will handle adding subviews
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No Bio"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        // Location stack (icon + label)
        let locationStack = UIStackView(arrangedSubviews: [locationImageView, locationLabel])
        locationStack.axis = .horizontal
        locationStack.spacing = 5
        locationStack.alignment = .center
        
        // Right side stack (username, name, location)
        let rightStack = UIStackView(arrangedSubviews: [usernameLabel, nameLabel, locationStack])
        rightStack.axis = .vertical
        rightStack.spacing = 8
        rightStack.alignment = .leading
        rightStack.distribution = .fillProportionally
        
        // Top horizontal stack (avatar + right content)
        let topStack = UIStackView(arrangedSubviews: [avatarImageView, rightStack])
        topStack.axis = .horizontal
        topStack.spacing = textImagePadding
        topStack.alignment = .top
        
        // Main vertical stack (top content + bio)
        let mainStack = UIStackView(arrangedSubviews: [topStack, bioLabel])
        mainStack.axis = .vertical
        mainStack.spacing = textImagePadding
        mainStack.alignment = .fill
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Set fixed size constraints
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: rightStack.heightAnchor),
            
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
}
