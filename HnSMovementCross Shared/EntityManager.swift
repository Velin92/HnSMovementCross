//
//  EntityManager.swift
//  HnSMovementCross
//
//  Created by Mauro Romito on 17/04/18.
//  Copyright © 2018 lollibus. All rights reserved.
//

import Foundation
import SpriteKit
import  GameplayKit

class EntityManager {
    
    var entities = Set<GKEntity>()
    var scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func addEntity (_ entity: GKEntity){
        
        entities.insert(entity)
        
        if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
            scene.addChild(spriteComponent.sprite)
        }
        
    }
    
    
    
}
