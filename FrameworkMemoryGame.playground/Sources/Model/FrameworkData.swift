//
//  FrameworkData.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit.UIImage

// Holds the info of all frameworks
public class FrameworkData {
  
  public static let sharedInstance = FrameworkData()
  
  private let imageNames = ["spritekit",
                            "cloudkit",
                            "replaykit",
                            "scenekit",
                            "sirikit",
                            "homekit"]
  
  // Information from developer.apple.com
  private let texts = [
    "\tThe SpriteKit framework adds new features to make it easier to create high-performance, battery-efficient 2D games. With support for custom OpenGL ES shaders and lighting, integration with SceneKit, and advanced new physics effects and animations, you can add force fields, detect collisions, and generate new lighting effects in your games.",
    
    "\tCloudKit provides authentication, a private and a public database, and structured asset storage services—so you can focus on client-side development.",
    
    "\tReplayKit is an easy-to-use framework that enables players to share gameplay recordings or broadcast live games to players and viewers online.",
    
    "\tSceneKit is a high-level 3D graphics framework that helps you create 3D animated scenes and effects in your apps. It incorporates a physics engine, a particle generator, and easy ways to script the actions of 3D objects so you can describe your scene in terms of its content — geometry, materials, lights, and cameras — then animate it by describing changes to those objects.",
    
    "\tSiriKit enables your iOS 10 apps to work with Siri, so users can get things done with your content and services using just their voice. In addition to extending Siri’s support for messaging, photo search and phone calls to more apps, SiriKit also adds support for new services, including ride booking and personal payments.",
    
    "\tHomeKit is a framework for communicating with and controlling connected accessories in a user’s home. You can enable users to discover HomeKit accessories in their home and configure them, or you can create actions to control those devices. Users can group actions together and trigger them using Siri."
  ]
  
  private let names = ["SpriteKit",
                       "CloudKit",
                       "ReplayKit",
                       "SceneKit",
                       "SiriKit",
                       "HomeKit"]
  
  public func getFrameworksData() -> [Framework] {
    var frameworks = [Framework]()
    
    for i in 0...5 {
      
      if let image = UIImage(named: "Assets/\(imageNames[i])") {
        frameworks.append(Framework(image: image, name: names[i], text: texts[i], view: getDemoView(index: i)))
      } else {
        fatalError("Missing card image")
      }
      
    }
    
    return frameworks
  }
  
  private func getDemoView(index: Int) -> UIView {
    let frame = CGRect(x: 340, y: 42, width: 252, height: 388)
    let view: UIView
    
    if let frameworkName = Framework.Name(rawValue: index) {
      switch frameworkName {
      case .spritekit:
        view = SpriteKitDemoView(frame: frame)
      case .cloudkit:
        view = AnimatedDemoView(frame: frame, imagePath: "cloud/0", duration: 3, numberOfFrames: 9)
      case .replaykit:
        view = AnimatedDemoView(frame: frame, imagePath: "replay/0", duration: 1, numberOfFrames: 5)
      case .scenekit:
        view = SceneKitDemoView(frame: frame)
      case .sirikit:
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "siri")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        view = imageView
      case .homekit:
        view = AnimatedDemoView(frame: frame, imagePath: "home/0", duration: 2, numberOfFrames: 8)
      }
      
    } else {
      fatalError("Wrong index")
    }
    
    return view
  }
  
}

