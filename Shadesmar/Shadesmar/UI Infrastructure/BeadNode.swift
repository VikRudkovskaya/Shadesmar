//
//  BeadNode.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import SpriteKit

class BeadNode: SKSpriteNode {
    
    var beadDidTouch: ((BeadViewModel)->())?
    let viewModel: BeadViewModel
    
     init(viewModel: BeadViewModel) {
        self.viewModel = viewModel
        let size = CGSize(width: 160, height: 160)
        let texture = SKTexture(imageNamed: viewModel.textureName)
        
        super.init(texture: texture, color: .clear, size: size)
        isUserInteractionEnabled = true
        name = viewModel.bead.textureName
        physicsBody = SKPhysicsBody(circleOfRadius: 66)
        physicsBody?.mass = 0.1
        physicsBody?.friction = 0.01
        alpha = 0
        
        apearenceAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = BeadViewModel(bead: Bead())
        super.init(coder: aDecoder)
    }
    
    func apearenceAnimation() {
        self.run(SKAction.fadeIn(withDuration: 1))
        
        if viewModel.isAlive {
            let action = SKAction.repeatForever(pulsar(percent: 0.98, duration: 0.5))
            self.run(action)
        }
    }
    
    func disapearenceAnimation() {
        physicsBody?.mass = 100
        
        let action = SKAction.scale(to: CGSize(width: 10, height: 10), duration: 0.3)
        run(action)
        removeFromParent()
    }
    
    // MARK: Responder override

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Поиск нода, на который нажали
        guard let location = touches.first?.location(in: self) else {
            return
        }
        let node = atPoint(location)
        if node.name! == viewModel.bead.textureName {
//            physicsBody?.applyImpulse(CGVector(dx: 10 * location.x, dy: 10 * location.y))
//            let action = SKAction.repeat(pulsar(percent: 0.96, duration: 0.5), count: 100)
//            self.run(action)
            beadDidTouch?(self.viewModel)
        }
    }
}
