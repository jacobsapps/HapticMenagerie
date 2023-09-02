//
//  HapticEngine.swift
//  HapticMenagerie
//
//  Created by Jacob Bartlett on 02/09/2023.
//

import Foundation

import CoreHaptics

public final class Haptics {
    
    public enum Haptic: String {
        
        case bee
        case tiger
        case hummingbird
        case dolphin
        
        var intensity: CHHapticEventParameter {
            switch self {
            default: return CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
            }
        }
        
        var sharpness: CHHapticEventParameter {
            switch self {
            default: return CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
            }
        }
        
        var duration: TimeInterval {
            switch self {
            default: return 2
            }
        }
        
        var events: [CHHapticEvent] {
            [CHHapticEvent(eventType: .hapticContinuous,
                           parameters: [intensity, sharpness],
                           relativeTime: 0,
                           duration: duration)]
        }
    }
    
    public static let shared = Haptics()
    
    private var engine: CHHapticEngine?
    
    private init() {
        prepareHaptics()
    }
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    public func play(haptic: Haptic) {
        guard let engine = engine else { return }
        
        do {
            let pattern = try CHHapticPattern(events: haptic.events, parameters: [])
            let player = try engine.makePlayer(with: pattern)
            try player.start(atTime: 0)
            
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}
