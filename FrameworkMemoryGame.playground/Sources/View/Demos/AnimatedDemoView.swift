//
//  AnimatedDemoView.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit

public class AnimatedDemoView: UIView {

  var imageView: UIImageView!
  
  public init(frame: CGRect, imagePath: String, duration: TimeInterval, numberOfFrames: Int) {
    super.init(frame: frame)
    backgroundColor = .clear
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    
    imageView.animationImages = loadImages(imagePath, numberOfFrames)
    
    imageView.animationDuration = duration
    
    imageView.animationRepeatCount = 0
    imageView.startAnimating()
    self.addSubview(imageView)
  }
  
  private func loadImages(_ imagesPath: String,_ numberOfFrames: Int) -> [UIImage] {
    var images = [UIImage]()
    
    for i in 1...numberOfFrames {
      images.append(UIImage(named: "\(imagesPath)\(i)")!)
    }
    return images
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  
}
