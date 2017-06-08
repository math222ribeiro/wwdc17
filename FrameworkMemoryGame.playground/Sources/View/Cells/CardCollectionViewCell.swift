//
//  CardCollectionViewCell.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit
import CoreGraphics

public class CardCollectionViewCell: UICollectionViewCell {
  
  var cardImageView: UIImageView!
  var hiddenCardImageView: UIImageView!
  
  public var card: Card!
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public func configure(card: Card) {
    self.card = card
    
    backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
    layer.cornerRadius = 5
    layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    layer.shadowRadius = 5
    layer.shadowOpacity = 1
    
    createUIElements()
  }
  
  private func createUIElements() {
    cardImageView = UIImageView(frame:CGRect(x: 18, y: 18, width: 64, height: 64))
    cardImageView.image = card.image;
    cardImageView.isHidden = true

    hiddenCardImageView = UIImageView(frame:CGRect(x: 18, y: 18, width: 64, height: 64))
    hiddenCardImageView.image = UIImage(named: "Assets/apple")
    hiddenCardImageView.contentMode = .scaleAspectFit
    
    addSubview(cardImageView)
    addSubview(hiddenCardImageView)
  }
  
  public func rotateCard() {
    if card.isActive {
      if card.isHidden {
        UIView.transition(from: hiddenCardImageView,
                          to: cardImageView,
                          duration: 0.75,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
      } else {
        UIView.transition(from: cardImageView,
                          to: hiddenCardImageView,
                          duration: 0.75,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
      }
    }
    
    card.isHidden = !card.isHidden
  }
}
