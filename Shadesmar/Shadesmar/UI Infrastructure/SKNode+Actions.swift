//
//  SKNode+Actions.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 12/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import SpriteKit

extension SKNode {
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
    
    func shown(duration: TimeInterval) -> SKAction {
        
        self.isPaused = false
        let originX = self.xScale
        let originY = self.yScale
        let action = SKAction.sequence([
            .scale(by: 0.1, duration: duration),
            .scale(by: 1, duration: duration)])
        
        return action
    }
}
