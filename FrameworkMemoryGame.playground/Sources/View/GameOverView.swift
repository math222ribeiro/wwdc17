//
//  GameOverView.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit

public class GameOverView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var thanksMessageLabel: UILabel!
  var gameNameLabel: UILabel!
  var frameworks: [Framework]!
  var footerLabel: UILabel!
  var infoLabel: UILabel!
  var frameworkCollectionView: UICollectionView!
  var foregroundView: UIView!
  var gameDelegate: GameDelegate!
  
  let fontName = "HelveticaNeue-Bold"
  
  public override init(frame: CGRect) {
    super.init(frame: frame)  
  }
  
  public init(frame: CGRect, frameworks: [Framework], gameDelegate: GameDelegate) {
    super.init(frame: frame)
    self.frameworks = frameworks
    self.gameDelegate = gameDelegate
    createUIElements()
    setUpCollectionView()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public override func didMoveToSuperview() {
    addSubview(frameworkCollectionView)
  }

 
  func setUpCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset.left = 50.0
    layout.sectionInset.right = 50.0
    layout.minimumLineSpacing = 22
    layout.itemSize = CGSize(width: 128, height: 148)
    
    frameworkCollectionView = UICollectionView(frame: CGRect(x: 8, y: 156, width: 584, height: 320), collectionViewLayout: layout)
    frameworkCollectionView.backgroundColor = .clear
    
    frameworkCollectionView.delegate = self
    frameworkCollectionView.dataSource = self
    frameworkCollectionView.register(FrameworkCollectionViewCell.self, forCellWithReuseIdentifier: "frameworkCell")
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return frameworks.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    UIView.animate(withDuration: 1, animations: {
      self.alpha = 1
      self.alpha = 0
    }) { (value: Bool) in
      self.removeFromSuperview()
      self.gameDelegate.showFramework(framework: self.frameworks[indexPath.row])
    }
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "frameworkCell", for: indexPath) as? FrameworkCollectionViewCell {
      
      cell.configure(framework: frameworks[indexPath.row])
      
      return cell
    } else {
      return UICollectionViewCell()
    }
  }
  
  private func createUIElements() {
    gameNameLabel = UILabel(frame: CGRect(x: 13, y: 8, width: 587, height: 32))
    gameNameLabel.font = UIFont(name: fontName, size: 28)
    gameNameLabel.text = "Developer Memory Game"
    gameNameLabel.textAlignment = .center
    gameNameLabel.textColor = .white
    addSubview(gameNameLabel)
    
    thanksMessageLabel = UILabel(frame: CGRect(x: 13, y: 48, width: 587, height: 32))
    thanksMessageLabel.text = "Thank you for playing"
    thanksMessageLabel.font = UIFont(name: fontName, size: 28)
    thanksMessageLabel.textAlignment = .center
    thanksMessageLabel.textColor = .white
    addSubview(thanksMessageLabel)
    
    infoLabel = UILabel(frame: CGRect(x: 203, y: 104, width: 193, height: 21))
    infoLabel.font = UIFont(name: "HelveticaNeue", size: 16)
    infoLabel.textColor = .white
    infoLabel.textAlignment = .center
    infoLabel.text = "See again any framework"
    addSubview(infoLabel)
    
    footerLabel = UILabel(frame: CGRect(x: 0, y: 484, width: 430, height: 16))
    footerLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
    footerLabel.textColor = .white
    footerLabel.textAlignment = .left
    footerLabel.text = "Created by Matheus Ribeiro D'Azevedo Lopes for WWDC Scholarships 2017."
    addSubview(footerLabel)

  }

  
}
