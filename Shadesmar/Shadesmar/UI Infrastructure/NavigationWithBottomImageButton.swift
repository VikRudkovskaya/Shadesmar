//
//  BottomUnderlineImageButton.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/07/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class NavigationWithBottomImageButton: UIButton {
    
    var bottomUnderlineImage: UIImage! {
        didSet {
            if bottomImageView != nil {
                bottomImageView.removeFromSuperview()
            }
           
            bottomImageView = UIImageView(image: bottomUnderlineImage)
            bottomImageView.frame.size = CGSize(width: 32, height: 6)
            bottomImageView.tintColor = self.titleLabel?.textColor
            self.addSubview(bottomImageView)
        }
    }
    var bottomImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLb = self.titleLabel else {
            return
        }
        
        let x = titleLb.center.x - bottomImageView.frame.size.width / 2
        let y = titleLb.frame.origin.y + titleLb.frame.size.height / 2 + 12
        bottomImageView?.frame.origin = CGPoint(x: x, y: y)
        
        titleLb.frame.origin = CGPoint(x: titleLb.frame.origin.x, y: titleLb.frame.origin.y - 8)
    }
}
