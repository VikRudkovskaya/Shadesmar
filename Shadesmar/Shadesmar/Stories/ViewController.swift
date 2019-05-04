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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = Base2DScene()
        sceneView.presentScene(scene)
    }


}

