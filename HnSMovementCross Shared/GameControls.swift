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

extension GameViewController: KeyboardAndMouseEventsDelegate {
}

#endif
