import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jj/Desktop/gameskeleton/gameskeleton/ContentView.swift", line: 1)
//
//  ContentView.swift
//  gameskeleton
//
//  Created by Jonathan Jiang on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var characterLocation: CGPoint = CGPoint(x: 100, y: 100)
    @State private var currentAngle: Double = 0.0
    @State private var joystickActive: Bool = false
    @State private var currentDistance: Double = 0.0
    let movementSpeed: CGFloat = 5.0

    var body: some View {
        ZStack {
            CharacterView(circleLocation: $characterLocation)
            JoystickView(joyStickAngle: $currentAngle, isActive: $joystickActive, joyDistance: $currentDistance)
        }
        .onReceive(Timer.publish(every: __designTimeFloat("#7805_0", fallback: 0.02), on: .main, in: .common).autoconnect()) { _ in
            if joystickActive {
                if currentDistance <= __designTimeInteger("#7805_1", fallback: 5) {
                    return
                }
                characterLocation.x += cos(currentAngle) * movementSpeed
                characterLocation.y += sin(currentAngle) * movementSpeed
            }
        }
    }
}

#Preview {
    ContentView()
}
