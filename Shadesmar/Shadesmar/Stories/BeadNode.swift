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
        name = viewModel.bead.id
        physicsBody = SKPhysicsBody(circleOfRadius: 66)
        physicsBody?.mass = 0.1
        physicsBody?.friction = 0.01

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = BeadViewModel(bead: Bead())
        super.init(coder: aDecoder)
    }
    
    // MARK: Responder override
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Поиск нода, на который нажали
        guard let location = touches.first?.location(in: self) else {
            return
        }
        let node = atPoint(location)
        if node.name! == viewModel.bead.id {
            physicsBody?.applyImpulse(CGVector(dx: 10 * location.x, dy: 10 * location.y))
            beadDidTouch?(self.viewModel)
        }
    }
}
