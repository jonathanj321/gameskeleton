//
//  JoyStickView.swift
//  gameskeleton
//
//  Created by Moritz Kohlenz on 2/27/25.
//
import SwiftUI

struct JoystickView: View {
    private let defaultLocation = CGPoint(x: 100, y: 50)
    @State private var outerCircleLocation: CGPoint = CGPoint(x: 100, y: 50)
    @State private var innerCircleLocation: CGPoint = CGPoint(x: 100, y: 50)
    private let bigCircleRadius: CGFloat = 50
    @Binding var joyStickAngle: Double
    @Binding var isActive: Bool
    @Binding var joyDistance: Double

    var fingerDrag: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                isActive = true
                let distance = sqrt(pow(value.location.x - outerCircleLocation.x, 2) +
                                    pow(value.location.y - outerCircleLocation.y, 2))
                
                if outerCircleLocation == defaultLocation && innerCircleLocation == defaultLocation && distance > bigCircleRadius {
                    outerCircleLocation = value.location
                    innerCircleLocation = value.location
                    return
                }
                
                let angle = atan2(value.location.y - outerCircleLocation.y, value.location.x - outerCircleLocation.x)
                let newX = outerCircleLocation.x + max(0, (distance - bigCircleRadius)) * cos(angle)
                let newY = outerCircleLocation.y + max(0, (distance - bigCircleRadius)) * sin(angle)
                
                outerCircleLocation = CGPoint(x: newX, y: newY)
                innerCircleLocation = value.location
                joyStickAngle = angle
                joyDistance = distance
                
            }
            .onEnded { _ in
                outerCircleLocation = defaultLocation
                innerCircleLocation = defaultLocation
                joyStickAngle = 0
                isActive = false
                joyDistance = 0;
            }
    }
    
    var angleText: String {
        let angle = atan2(innerCircleLocation.y - outerCircleLocation.y,
                          innerCircleLocation.x - outerCircleLocation.x)
        var degrees = Int(-angle * 180 / .pi)
        if degrees < 0 {
            degrees += 360
        }
        return "\(degrees)°"
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .simultaneousGesture(fingerDrag)
            
            // Outer joystick circle
            Circle()
                .foregroundColor(.gray).opacity(0.5)
                .frame(width: bigCircleRadius * 2, height: bigCircleRadius * 2)
                .position(outerCircleLocation)
                .gesture(fingerDrag)

            
            // Inner joystick circle
            Circle()
                .foregroundColor(Color(white: 0.4745)).opacity(0.5)
                .frame(width: bigCircleRadius / 1.25, height: bigCircleRadius / 1.25)
                .position(innerCircleLocation)
                .gesture(fingerDrag)

            
            // Angle text overlay
            Text(angleText)
                .font(.title)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .position(x: UIScreen.main.bounds.width / 2, y: 50)
        }
    }
}
