//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 8/7/25.
//

import UIKit

enum ItemInfoType {
    case repos, gist, followers, following
}

class GFItemInfoView: UIView {

    let symboleImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(symboleImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symboleImageView.translatesAutoresizingMaskIntoConstraints = false
        symboleImageView.contentMode = .scaleAspectFit
        symboleImageView.tintColor = .label
        
        
        NSLayoutConstraint.activate([
            symboleImageView.topAnchor.constraint(equalTo: topAnchor),
            symboleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            symboleImageView.widthAnchor.constraint(equalToConstant: 20),
            symboleImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symboleImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symboleImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symboleImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            
        ])
        
        func set(itemInfoType: ItemInfoType, withCount count: Int){
            switch itemInfoType {
            case .repos:
                symboleImageView.image = UIImage(systemName: SFSymbols.repos)
                titleLabel.text = "Public Repos"
            case .gist:
                symboleImageView.image = UIImage(systemName: SFSymbols.gist)
                titleLabel.text = "Public gist"
            case .followers:
                symboleImageView.image = UIImage(systemName: SFSymbols.follwers)
                titleLabel.text = "Followers"
            case .following:
                symboleImageView.image = UIImage(systemName: SFSymbols.following)
                titleLabel.text = "Following"
            }
            countLabel.text = String(count)
        }
        
    }
    


}
