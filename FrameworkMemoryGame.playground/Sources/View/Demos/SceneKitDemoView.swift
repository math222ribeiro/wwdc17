//
//  SceneKitDemoView.swift
//  DeveloperMemoryGame
//
//  Created by Matheus Ribeiro D'Azevedo Lopes.
//  Copyright © 2017 Matheus Ribeiro D'Azevedo Lopes. All rights reserved.
//

import UIKit
import SceneKit

public class SceneKitDemoView: SCNView {
  var scnScene: SCNScene!
  var cameraNode: SCNNode!
  var earth: SCNNode!
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.clear
    setupScene()
    setupCamera()
    createEarth()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public override init(frame: CGRect, options: [String : Any]? = nil) {
    super.init(frame: frame, options: options)
  }
  
  func setupCamera() {
    cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
    scnScene.rootNode.addChildNode(cameraNode)
  }
  
  public override func didMoveToSuperview() {

  }
  
  private func setupScene() {
    scnScene = SCNScene()
    self.scene = scnScene
    
    self.autoenablesDefaultLighting = true
  }
  
  private func createEarth() {
    earth = SCNNode()
    earth.geometry = SCNSphere(radius: 1)
    earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth/map.jpg")
    earth.geometry?.firstMaterial?.specular.contents = UIImage(named: "earth/spec.jpg")
    earth.geometry?.firstMaterial?.emission.contents = UIImage(named: "earth/lights.jpg")

    earth.geometry?.firstMaterial?.transparency = 1
    earth.geometry?.firstMaterial?.shininess = 50
    scnScene.rootNode.addChildNode(earth)
    let action = SCNAction.rotate(by: 360 * CGFloat(3.14159 / 180.0), around: SCNVector3(x:1, y:1, z:0), duration: 14)
    
    let repeatAction = SCNAction.repeatForever(action)
    
    earth.runAction(repeatAction)
  }
  
}
