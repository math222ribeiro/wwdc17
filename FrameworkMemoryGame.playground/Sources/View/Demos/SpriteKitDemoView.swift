//
//  SpriteKitDemoView.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import SpriteKit

public class SpriteKitDemoView: SKView {
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func didMoveToSuperview() {
    self.presentScene(SpriteKitDemoScene(size: self.frame.size))
  }
}
