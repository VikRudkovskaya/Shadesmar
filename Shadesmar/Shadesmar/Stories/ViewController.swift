//
//  ViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 03/04/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView!
    
    @IBOutlet weak var about: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        let service = BeadsService()
        service.bucket(successHandler: { (bucket) in
            
            let scene = Base2DScene(size: self.sceneView.frame.size)
            scene.service = service
            self.sceneView.presentScene(scene)
            let vm = BeadViewModel(bead: (bucket.beads?.first)!)
            let bead = BeadNode(viewModel: vm)

            bead.position = self.sceneView.center
            self.sceneView.scene?.addChild(bead)
        }) { (message) in
            
        }

        
    }

    @IBAction func aboutTouchUpInside(_ sender: UIButton) {
        let vc = AboutShadesmarViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}

