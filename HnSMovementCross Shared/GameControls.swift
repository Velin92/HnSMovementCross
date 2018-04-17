//
//  GameControls.swift
//  HnSMovementCross
//
//  Created by Mauro Romito on 17/04/18.
//  Copyright © 2018 lollibus. All rights reserved.
//

import Foundation
import simd
import GameController
import GameplayKit
import SpriteKit

#if os(OSX)

protocol KeyboardAndMouseEventsDelegate {
    func mouseDown(in view: NSView, with event: NSEvent) -> Bool
    func mouseDragged(in view: NSView, with event: NSEvent) -> Bool
    func mouseUp(in view: NSView, with event: NSEvent) -> Bool
    func keyDown(in view: NSView, with event: NSEvent) -> Bool
    func keyUp(in view: NSView, with event: NSEvent) -> Bool
}

private enum KeyboardDirection : UInt16 {
    case left   = 123
    case right  = 124
    case down   = 125
    case up     = 126
    
    var vector : float2 {
        switch self {
        case .up:    return float2( 0, -1)
        case .down:  return float2( 0,  1)
        case .left:  return float2(-1,  0)
        case .right: return float2( 1,  0)
        }
    }
}

extension GameScene: KeyboardAndMouseEventsDelegate {
    func mouseDown(in view: NSView, with event: NSEvent) -> Bool {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        return true
    }
    
    func mouseDragged(in view: NSView, with event: NSEvent) -> Bool {
        return true
    }
    
    func mouseUp(in view: NSView, with event: NSEvent) -> Bool {
        return true
    }
    
    func keyDown(in view: NSView, with event: NSEvent) -> Bool {
        return true
    }
    
    func keyUp(in view: NSView, with event: NSEvent) -> Bool {
        return true
    }
    
}

#endif

extension GameScene {
    
    // MARK: Controller orientation
    
    private static let controllerAcceleration = Float(1.0 / 10.0)
    private static let controllerDirectionLimit = float2(1.0)
    
    internal func controllerDirection() -> float2 {
        // Poll when using a game controller
        if let dpad = self.controllerDPad {
            if dpad.xAxis.value == 0.0 && dpad.yAxis.value == 0.0 {
                self.controllerStoredDirection = float2(0.0)
            } else {
                self.controllerStoredDirection = clamp(controllerStoredDirection + float2(dpad.xAxis.value, -dpad.yAxis.value) * GameScene.controllerAcceleration, min: -GameScene.controllerDirectionLimit, max: GameScene.controllerDirectionLimit)
            }
        }
        
        return controllerStoredDirection
    }
}
