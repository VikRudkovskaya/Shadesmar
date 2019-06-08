//
//  SKNode+Utility.swift
//  Core
//
//  Created by Viktoria Rudkovskaya on 04/12/2018.
//  Copyright © 2018 Viktoria Rudkovskaya. All rights reserved.
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
    

        
    // MARK: Actions
    /**
     * Action, меняющий размер нода и возвращающий к исходному [Пульсация]
     * @param percent - интенсивность пульсации (на какой размер от исходного произойдет уменьшение)
     */
    func pulsar(percent: CGFloat, duration: TimeInterval) -> SKAction {
        
        self.isPaused = false
        let originX = self.xScale
        let originY = self.yScale
        let action = SKAction.sequence([
            .scaleX(to: originX * percent, y: originY * percent, duration: duration),
            .scaleX(to: originX, y: originY, duration: duration)])
        
        return action
    }
    
    func lineTelescopic() -> SKAction {
        self.alpha = 0
        let originX = self.xScale
        let originY = self.yScale
        //        let action1 = SKAction.scaleX(to: 0, duration: 0.01)
        let action11 = SKAction.scaleY(to: 0, duration: 0.01)
        let action2 = SKAction.scaleX(to: originX, y: originY, duration: 1.8)
        let action3 = SKAction.fadeIn(withDuration: 0.1)
        return SKAction.sequence([action11, action3, action2])
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



