//
//  SpriteKitDemoScene.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import SpriteKit

public class SpriteKitDemoScene : SKScene {
  
  var dancer: SKSpriteNode!
  var background: SKSpriteNode!
  
  public override init(size: CGSize) {
    super.init(size: size)
    
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    background = SKSpriteNode(imageNamed: "Assets/citybg")
    background.setScale(2.1)
    
    dancer = SKSpriteNode(imageNamed: "dancer/breathing/dancer1")
    dancer.setScale(0.5)
    dancer.position = CGPoint(x: 0, y: -100)
    
    let dancerAnimation = animateDancer(name: "breathing")
    dancer.run(SKAction.repeatForever(dancerAnimation))
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    addChild(self.background!)
    addChild(self.dancer)
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
  func animateDancer(name: String) -> SKAction {
    let imagePath = "dancer/"
    var imagePrefix: String
    var numberOfFrames: Int
    var textures = [SKTexture]()
    
    switch name {
    case "breathing":
      imagePrefix = "breathing/dancer"
      numberOfFrames = 3
    case "attack":
      imagePrefix = "attacks/dancerattack"
      numberOfFrames = 5
    default:
      fatalError("Option does not exists")
    }
    
    for i in 1...numberOfFrames {
      
      if let image = UIImage(named: "\(imagePath)\(imagePrefix)\(i)") {
        textures.append(SKTexture(image: image))
      } else {
        fatalError("Error loading frames. index: \(i)")
      }
    }
    
    
    return SKAction.animate(with: textures, timePerFrame: 0.2)
    
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    dancer.run(animateDancer(name: "attack"))
  }
}
