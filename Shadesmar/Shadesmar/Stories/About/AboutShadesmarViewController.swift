//
//  AboutShadesmarViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 05/06/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class AboutShadesmarViewController: UIViewController {
    
    @IBOutlet weak var topCenterBgImageView: UIImageView!
    
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topLeftYellowImageView: UIImageView!
    
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var topRightToImageView: UIImageView!
    
    @IBOutlet weak var rightToImageView: UIImageView!
    @IBOutlet weak var rightFromImageView: UIImageView!
    
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomLeftFromImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 10, delay: 0.5, options: .curveEaseOut, animations: {
            self.bottomLeftFromImageView.alpha = 0.0
            self.bottomLeftImageView.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 10, delay: 0.5, options: .curveEaseOut, animations: {
            self.topRightImageView.alpha = 0.0
            self.topRightToImageView.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.topLeftImageView.alpha = 0.0
            self.topLeftYellowImageView.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 3.0, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.rightToImageView.alpha = 0.0
            self.rightFromImageView.alpha = 1.0
        }, completion: nil)
    }

}
