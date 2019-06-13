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
                    
                }
                vc.notAliveDidChose = { (viewModel) in
                    
                }
                self.present(vc, animated: true, completion: nil)
            }
            scene.service = service
            self.sceneView.presentScene(scene)
            let vm = BeadViewModel(bead: (bucket.beads?.first)!)
            let bead = BeadNode(viewModel: vm)
            bead.beadDidTouch = { (viewModel) in
                let vc = AliveNotAliveQuestionPopUp(viewModel: viewModel)
                vc.aliveDidChose = { (viewModel) in
                    
                }
                vc.notAliveDidChose = { (viewModel) in
                    
                }
                self.present(vc, animated: true, completion: nil)
            }
            bead.position = self.sceneView.center
            self.sceneView.scene?.addChild(bead)
            
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

