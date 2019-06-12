//
//  SKNode+Utility.swift
//  Core
//
//  Created by Viktoria Rudkovskaya on 04/12/2018.
//  Copyright © 2018 VR/RN. All rights reserved.
//

import SpriteKit

extension SKNode {
    
    var positionInScene: CGPoint? {
        if let scene = scene, let parent = parent {
            return parent.convert(position, to:scene)
        } else {
            return nil
        }
    }
    
    /* @parameter action - что нужно сделать при посещении нода */
    func visit(action: (SKNode) -> ()) {
        action(self)
        for subnode in self.children {
            subnode.visit(action: action)
        }
    }
    
    /**
     * Разархивировать сцену как нод
     */
    class func unarchiveFromFile(file: String) -> SKNode? {
        guard let path = Bundle.main.path(forResource: file, ofType: "sks") else {
            return nil
        }
            
        guard let sceneData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else{
            return nil
        }
        
        let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
        
        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
        let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey)
        archiver.finishDecoding()
        return scene as? SKNode

    }
 
}

extension SKNode {
    func drawBorder(color: UIColor) {
        let shapeNode = SKShapeNode(rect: frame)
        shapeNode.fillColor = .clear
        shapeNode.strokeColor = color
        shapeNode.lineWidth = 2.0
        addChild(shapeNode)
    }
}



