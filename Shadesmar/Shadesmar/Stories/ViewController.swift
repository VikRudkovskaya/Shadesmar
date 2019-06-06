//
//  ViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 03/04/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView!
    
    @IBOutlet weak var about: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = Base2DScene()
        sceneView.presentScene(scene)
    }

    @IBAction func aboutTouchUpInside(_ sender: UIButton) {
        let vc = AboutShadesmarViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}

