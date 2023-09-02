//
//  Animal.swift
//  HapticMenagerie
//
//  Created by Jacob Bartlett on 02/09/2023.
//

import Foundation

protocol Animal {
    var haptic: Haptics.Haptic { get }
    var name: String { get }
    func makeSound()
}

extension Animal {
    
    func makeSound() {
        Haptics.shared.play(haptic: haptic)
    }
}

struct Bee: Animal {
    let name: String = "Bee"
    let haptic: Haptics.Haptic = .bee
}

struct Tiger: Animal {
    let name: String = "Tiger"
    let haptic: Haptics.Haptic = .tiger
}

struct Hummingbird: Animal {
    let name: String = "Hummingbird"
    let haptic: Haptics.Haptic = .hummingbird
}

struct Dolphin: Animal {
    let name: String = "Dolphin"
    let haptic: Haptics.Haptic = .dolphin
}
