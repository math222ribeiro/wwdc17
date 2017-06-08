//
//  FrameworkCollectionViewCell.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit

public class FrameworkCollectionViewCell: UICollectionViewCell {
  
  var imageView: UIImageView!
  var nameLabel: UILabel!
  var framework: Framework!
  
  public func configure(framework: Framework) {
    self.framework = framework
    self.backgroundColor = .clear
    createUIElements()
  }
  
  public func createUIElements() {
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
    imageView.image = framework.image
    addSubview(imageView)
    
    nameLabel = UILabel(frame: CGRect(x: 0, y: 128, width: 128, height: 20))
    nameLabel.text = framework.name
    nameLabel.font = UIFont(name: "HelveticaNeue", size: 15)
    nameLabel.textAlignment = .center
    nameLabel.textColor = .white
    addSubview(nameLabel)
  }
}

