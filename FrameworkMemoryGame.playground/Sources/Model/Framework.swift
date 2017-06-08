//
//  Framework.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit.UIImage

public struct Framework {
  public var image: UIImage
  public var name: String
  public var text: String
  public var view: UIView
  

  enum Name: Int {
    case spritekit = 0
    case cloudkit
    case replaykit
    case scenekit
    case sirikit
    case homekit
  }
}
