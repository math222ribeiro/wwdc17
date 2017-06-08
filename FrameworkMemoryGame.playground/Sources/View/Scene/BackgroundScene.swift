//
//  BackgroundScene.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import SpriteKit

public class BackgroundScene: SKScene {
  
  var background: SKSpriteNode!
  var emitterNode: SKEmitterNode!
  
  override public init(size: CGSize) {
    super.init(size: size)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func didMove(to view: SKView) {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    background = SKSpriteNode(imageNamed: "Assets/bg")
    emitterNode = SKEmitterNode(fileNamed: "SnowParticle")
    emitterNode.targetNode = self
    
    addChild(background)
    addChild(emitterNode)
  }
  
}
