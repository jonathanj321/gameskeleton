//
//  ContentView.swift
//  gameskeleton
//
//  Created by Jonathan Jiang on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAngle: Double = 0.0

    var body: some View {
        JoystickView(joyStickAngle: $currentAngle)
            .onChange(of: currentAngle) {
                print("Current Joystick Angle: \(currentAngle) rad")
            }
    }
}

#Preview {
    ContentView()
}
