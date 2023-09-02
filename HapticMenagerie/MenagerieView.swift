//
//  MenagerieView.swift
//  HapticMenagerie
//
//  Created by Jacob Bartlett on 02/09/2023.
//

import SwiftUI

struct MenagerieView: View {
    
    @State private var menagerie: [Animal] = [Bee(), Tiger(), Hummingbird(), Dolphin()]
    
    var body: some View {
        VStack {
            ForEach(menagerie, id: \.haptic.rawValue) { animal in
                Button(animal.name) {
                    animal.makeSound()
                }
                .padding()
            }
        }
        .padding()
    }
}

struct MenagerieView_Previews: PreviewProvider {
    static var previews: some View {
        MenagerieView()
    }
}
