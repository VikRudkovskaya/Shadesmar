//
//  AliveNotAliveQuestionPopUp.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 08/06/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class AliveNotAliveQuestionPopUp: UIViewController {
    
    @IBOutlet weak var beadImageView: UIImageView!
    @IBOutlet weak var questionText: UILabel!
    
    var aliveDidChose: (() -> ())?
    var notAliveDidChose: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aliveTouchUpInside(_ sender: Any) {
        aliveDidChose?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func notAliveTouchUpInside(_ sender: Any) {
        notAliveDidChose?()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
