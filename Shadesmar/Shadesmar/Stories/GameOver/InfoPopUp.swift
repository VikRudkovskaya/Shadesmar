//
//  GameOverPopUp.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 08/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

enum PopUpType: String {
    case Correct = "CorrectPopUp"
    case Incorrect = "IncorrectPopUp"
    case GameOver = "GameOverPopUp"
    case YouWin = "YouWinPopUp"
    case YouLose = "YouLosePopUp"
}

class InfoPopUp: UIViewController {
    
    convenience init(type: PopUpType, message: String) {

        self.init(nibName: type.rawValue, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
