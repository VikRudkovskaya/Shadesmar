//
//  GamesListViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 02/07/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class GamesListViewController: UIViewController {
    
    @IBOutlet weak var hallOfFameButton: UIButton!
    @IBOutlet weak var nextButton: NavigationWithBottomImageButton!
    @IBOutlet weak var previousButton: NavigationWithBottomImageButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previousButton.setTitleColor(custom_bloodred, for: .normal)
        nextButton.bottomUnderlineImage = UIImage(named: "arrow-archery-right")!
        previousButton.bottomUnderlineImage = UIImage(named: "arrow-archery-left")!
        
        
        hallOfFameButton.titleLabel?.numberOfLines = 0
        hallOfFameButton.titleLabel?.textAlignment = .center
        hallOfFameButton.setTitle("Зал\nСлавы", for: .normal)
    }
    
    
    @IBAction func backTouchUpImaside(_ sender: NavigationWithBottomImageButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
