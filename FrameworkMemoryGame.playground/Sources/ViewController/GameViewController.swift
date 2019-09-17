//
//  GameViewController.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

public class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GameDelegate {
  
  // View elements
  var backgroundView: SKView!
  var cardsCollectionView: UICollectionView!
  var activeCell: CardCollectionViewCell!
  var foregroundView: UIView!
  
  // Counts how many cards were selected
  var counter = 0
  
  var game: Game!
  public var cardsMatched = 0
  
  // Audio Players
  var rightCardSoundEffect: AVAudioPlayer!
  var wrongCardSoundEffect: AVAudioPlayer!
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    public override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
        view.backgroundColor = .white
        self.view = view
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        foregroundView = UIView(frame: view.frame)
        foregroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
        
        initPlayers()
        
        // Twelve cards
        game = Game(numberOfCombinations: 2)
        
        backgroundView = SKView(frame: view.frame)
        let gameScene = BackgroundScene(size: CGSize(width: view.frame.width, height: view.frame.height))
        backgroundView.presentScene(gameScene)
        
        setUpCollectionView()
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(cardsCollectionView)
        showCards()
    }
  
  private func showCards() {
    cardsCollectionView.isUserInteractionEnabled = false
    
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
      for i in 0...11 {
        let indexPath = IndexPath(row: i, section: 0)
        
        let cell = self.cardsCollectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        cell?.rotateCard()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
          cell?.rotateCard()
          self.cardsCollectionView.isUserInteractionEnabled = true
        })
        
      }
    })

    
  }
  
  func initPlayers() {
    do {
      var path = Bundle.main.path(forResource: "right", ofType: "mp3")
      rightCardSoundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
      
      path = Bundle.main.path(forResource: "wrong", ofType: "mp3")
      wrongCardSoundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
    } catch {
      fatalError("Could not load the sound")
    }
  }

  func setUpCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset.left = 40.0
    layout.sectionInset.right = 40.0
    layout.sectionInset.bottom = 20.0
    layout.sectionInset.top = 20.0
    layout.minimumLineSpacing = 30
    layout.itemSize = CGSize(width: 100, height: 100)
    
    cardsCollectionView = UICollectionView(frame: CGRect(x: 100, y: 100, width: 600, height: 400), collectionViewLayout: layout)
    cardsCollectionView.backgroundColor = .clear;
    
    cardsCollectionView.delegate = self
    cardsCollectionView.dataSource = self
    cardsCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "cardCell")
  }
  
  
  public func showViewOnForeGround(_ aView: UIView) {

    view.addSubview(foregroundView)
    
    UIView.animate(withDuration: 1) {
      self.foregroundView.alpha = 0
      self.foregroundView.alpha = 1
    }
    
    foregroundView.addSubview(aView)
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell {
      
      cell.configure(card: game.cards[indexPath.row])
      
      return cell
    } else {
      
      return UICollectionViewCell()
    }
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return game.cards.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
    
    if cell.card.isActive {
      
      collectionView.isUserInteractionEnabled = false
      cell.rotateCard()
      
      counter += 1

      if counter >= 2 {
        
        if cell == activeCell {
          collectionView.isUserInteractionEnabled = true
        } else if cell.card.frameworkID == activeCell.card.frameworkID {
         
          self.rightCardSoundEffect.play()
          
          let frameworkView = FrameworkInfoView(frame: CGRect(x: 100, y: 50, width: 600, height: 500), framework: game.frameworks[cell.card.frameworkID], gameDelegate: self)
          
          cell.card.isActive = false
          activeCell.card.isActive = false
          
          cardsMatched += 1
          
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.showViewOnForeGround(frameworkView)
            collectionView.isUserInteractionEnabled = true
          })
      
        } else {
          self.wrongCardSoundEffect.play()
          
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            cell.rotateCard()
            self.activeCell.rotateCard()
            collectionView.isUserInteractionEnabled = true
          })
        }
        counter = 0
      } else {
        activeCell = cell
        collectionView.isUserInteractionEnabled = true
      }
      
    }
    
  }
  
  public func gameOver() {
    if cardsMatched == 6 {
      showViewOnForeGround(GameOverView(frame: CGRect(x: 100, y: 50, width: 600, height: 500), frameworks: game.frameworks, gameDelegate: self))
    }
    
  }
  
  public func showFramework(framework:Framework) {
    let frameworkView = FrameworkInfoView(frame: CGRect(x: 100, y: 50, width: 600, height: 500), framework: framework, gameDelegate: self)
    showViewOnForeGround(frameworkView)
  }
}

public protocol GameDelegate {
  func gameOver()
  func showFramework(framework: Framework)
}
