//
//  Card.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit.UIImage

public struct Card {
  
  // Defines if the card can have user interaction
  public var isActive: Bool
  
  public var frameworkID: Int
  public var isHidden: Bool
  public var image: UIImage
  
  init(image: UIImage, id: Int) {
    self.isActive = true
    self.isHidden = true
    self.frameworkID = id
    self.image = image
  }
  
}
