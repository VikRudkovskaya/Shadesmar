//
//  AboutShadesmarViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 05/06/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class AboutShadesmarViewController: UIViewController {
    
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var leftImaheView: UIImageView!
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
