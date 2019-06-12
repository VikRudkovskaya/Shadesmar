//
//  Base2DScene.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/12/2018.
//  Copyright © 2018 VR/RN. All rights reserved.
//

import ARKit

class Base2DScene: SKScene {
    
    var beadDidTouch: ((BeadViewModel)->())?
    
    var service: BeadsService?
    
    var backgroundNode: SKSpriteNode?

    override init(size: CGSize) {
        super.init(size: size)
                
        let bgNode = SKSpriteNode(texture: SKTexture(imageNamed: "bg-main"), size: size)
        bgNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bgNode.name = "bg-main"
        backgroundNode = bgNode
        self.addChild(backgroundNode!)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -4.8)
        
        let physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 92, width: size.width, height: size.height - 92))
        self.physicsBody = physicsBody
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func update(_ currentTime: TimeInterval) {

    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecogniser)
    }

    @objc func handleTap(_ tap: UITapGestureRecognizer) {
        // Поиск нода, на который нажали
        let locationInView = tap.location(in: self.view)
        let locationInScene = convertPoint(fromView: locationInView)
        let hitNodes = nodes(at: locationInScene) // все ноды, которые попали в координату тача
        
        for node in hitNodes {
            if ((node as? BeadNode) != nil) {
                return
            }
        }
        guard let beads = service?.bucket?.beads else {
            return
        }
        
        let vm = BeadViewModel(bead: beads[Utils.random(beads.count)])
        let bead = BeadNode(viewModel: vm)
        bead.beadDidTouch = {(viewModel) in
            self.beadDidTouch?(viewModel)
        }
        
        bead.position = locationInScene
        addChild(bead)
        
        
    }
    
}
