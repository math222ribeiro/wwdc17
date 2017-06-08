//
//  FrameworkInfoView.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit

public class FrameworkInfoView: UIView {
  
  var nameLabel: UILabel!
  var imageView: UIImageView!
  var infoLabel: UILabel!
  var presentationView: UIView!
  var dismissButton: UIButton!
  var framework: Framework!
  
  var gameDelegate: GameDelegate?
  
  let fontName = "HelveticaNeue-Bold"
  
  public init(frame: CGRect, framework: Framework, gameDelegate: GameDelegate?) {
    super.init(frame: frame)
    self.framework = framework
    self.gameDelegate = gameDelegate
    createUIElements()
    updateUI()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func createUIElements() {
    nameLabel = UILabel(frame: CGRect(x: 38, y: 42, width: 177, height: 66))
    nameLabel.font = UIFont(name: fontName, size: 31)
    nameLabel.textAlignment = .center
    nameLabel.textColor = .white
    addSubview(nameLabel)
    
    imageView = UIImageView(frame: CGRect(x: 223, y: 42, width: 104, height: 111))
    addSubview(imageView)
    
    infoLabel = UILabel(frame: CGRect(x: 38, y: 166, width: 289, height: 264))
    infoLabel.font = UIFont(name: fontName, size: 17)
    infoLabel.textColor = .white
    infoLabel.textAlignment = .left
    infoLabel.numberOfLines = 15
    addSubview(infoLabel)
    
    presentationView = framework.view
    presentationView.layer.cornerRadius = 5
    addSubview(presentationView)
    
    dismissButton = UIButton(type: .system)
    dismissButton.frame = CGRect(x: 246, y: 462, width: 108, height: 30)
    dismissButton.setTitle("Continue", for: UIControlState.normal)
    dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    addSubview(dismissButton)
  }
  
  private func updateUI() {
    nameLabel.text = framework.name
    imageView.image = framework.image
    infoLabel.text = framework.text
  }
  
  public func dismissView() {
    UIView.animate(withDuration: 1.6, animations: {
      self.superview?.alpha = 1
      self.superview?.alpha = 0
    }) { (value: Bool) in
      self.removeFromSuperview()
      self.superview?.removeFromSuperview()
      self.gameDelegate?.gameOver()
    }
  }
  
}
