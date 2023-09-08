//
//  BoundsVisualizer.swift
//
//
//  Created by Ivan Mathy on 9/7/23.
//
//
//  BoundsVisualizer.swift
//  Guesstimates
//
//  Created by Ivan Mathy on 9/7/23.
//

import Foundation
import RealityKit

class BoundsVisualizer: Entity {
  
  let bounds: SIMD3<Float>
  let size: Float
  let length: Float
  let material: Material
  
  @MainActor init(bounds: SIMD3<Float>, size: Float = 0.025, length: Float = 0.1, material: Material = SimpleMaterial()) {
    self.bounds = bounds
    self.size = size
    self.length = length
    self.material = material
    
    super.init()
    
    let dimensions: [Float] = [-1, 1]
    
    for x in dimensions {
      for y in dimensions {
        for z in dimensions {
          generateCorner(position: [x, y, z])
        }
      }
    }
  }
  
  func generateCorner(position: SIMD3<Float>) {
    generateBox(position: position, axis: [1, 0, 0]) // X
    generateBox(position: position, axis: [0, 1, 0]) // Y
    generateBox(position: position, axis: [0, 0, 1]) // Z
  }
  
  func generateBox(position: SIMD3<Float>, axis: SIMD3<Float>) {
    
    let size = [size, size, size] * ([1, 1, 1] - axis) + [length, length, length] * axis
    
    let box = ModelEntity(mesh: .generateBox(width: size.x, height: size.y, depth: size.z, cornerRadius: 0.001), materials: [material])
    
    box.position = position * bounds / 2 - size / 2  * position

    self.addChild(box)
  }
  
  
  
  @MainActor required convenience init() {
    self.init(bounds: [1,1,1])
  }
}
