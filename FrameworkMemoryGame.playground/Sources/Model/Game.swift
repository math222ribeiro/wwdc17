//
//  Game.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import Foundation

public class Game {
  
  public var cards = [Card]()
  public let frameworks: [Framework]
  
  
  // Init with the number of how many times a card needs to be found
  public init(numberOfCombinations: Int) {
    frameworks = FrameworkData.sharedInstance.getFrameworksData()
    generateCards(numberOfCombinations)
    
  }
  
  private func generateCards(_ numberOfCombinations: Int) {
    for _ in 1...numberOfCombinations {
      for i in 0..<frameworks.count {
        cards.append(Card(image: frameworks[i].image, id: i))
      }
    }
    
   shuffleCards()
  }
  
  
  private func shuffleCards() {
    for _ in 1...cards.count {
      cards.sort { (_, _) -> Bool in
        return arc4random() > arc4random()
      }
    }
  }
  
}
