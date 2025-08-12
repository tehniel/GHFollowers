//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 8/11/25.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backGroundCOlor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped(){
        delegate.didTapGetFollowers(for: user)
    }
    
}
