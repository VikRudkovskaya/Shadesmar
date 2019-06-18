//
//  AliveNotAliveQuestionPopUp.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 08/06/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class AliveNotAliveQuestionPopUp: UIViewController {
    
    var viewModel: BeadViewModel!
    
    @IBOutlet weak var tooltipButton: UIButton!
    @IBOutlet weak var beadImageView: UIImageView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var tooltipLabel: UILabel!
    
    var aliveDidChose: ((BeadViewModel, Bool) -> ())?
    
    convenience init(viewModel: BeadViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beadImageView.image = UIImage(named: viewModel.textureName)
        
        self.tooltipLabel.text = viewModel.title
        self.tooltipLabel.alpha = 0.0
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aliveTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.aliveDidChose?(self.viewModel, true)
        })
        
    }
    
    @IBAction func notAliveTouchUpInside(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {
            self.aliveDidChose?(self.viewModel, false)
        })
    }
    
    @IBAction func tooltipTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.tooltipLabel.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 5.0, delay: 0.3, options: .curveEaseIn, animations: {
            self.tooltipLabel.alpha = 0.0
        }, completion: nil)
    }
    
}
