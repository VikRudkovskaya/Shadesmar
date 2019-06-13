//
//  MainViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 03/04/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView!
    @IBOutlet weak var about: UIButton!
    
    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomContainer.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        bottomContainer.layer.borderWidth = 1
        bottomContainer.layer.borderColor = UIColor(red: 161 / 255.0, green: 184 / 255.0, blue: 192 / 255.0, alpha: 1.0).cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if sceneView.scene != nil {
            return
        }
        
        let service = BeadsService()
        service.bucket(successHandler: { (bucket) in
            
            let scene = AliveNotAlive2DScene(size: self.sceneView.frame.size)
            scene.beadDidTouch = {(viewModel) in
                let vc = AliveNotAliveQuestionPopUp(viewModel: viewModel)
                vc.aliveDidChose = { (viewModel) in
                    if viewModel.isAlive == true {
                        
                    }
                }
                vc.notAliveDidChose = { (viewModel) in
                    if viewModel.isAlive == false {
                        
                    }
                }
                self.present(vc, animated: true, completion: nil)
            }
            scene.service = service
            self.sceneView.presentScene(scene)
            
        }) { (message) in
            
        }
    }

    @IBAction func aboutTouchUpInside(_ sender: UIButton) {
        let newScene = SKScene()
        sceneView.presentScene(nil)
        sceneView.presentScene(newScene)
        
//        let vc = AboutShadesmarViewController()
//        self.present(vc, animated: true, completion: nil)
    }
    
}

