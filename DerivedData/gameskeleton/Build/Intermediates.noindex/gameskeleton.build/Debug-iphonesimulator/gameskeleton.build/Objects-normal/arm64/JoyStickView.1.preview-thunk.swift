import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jj/Desktop/gameskeleton/gameskeleton/JoyStickView.swift", line: 1)
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

    var fingerDrag: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                let distance = sqrt(pow(value.location.x - outerCircleLocation.x, 2) + pow(value.location.y - outerCircleLocation.y, 2))
                
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
            }
            .onEnded { _ in
                outerCircleLocation = defaultLocation
                innerCircleLocation = defaultLocation
            }
    }
    
    var angleText: String {
        let angle = atan2(innerCircleLocation.y - outerCircleLocation.y,
                          innerCircleLocation.x - outerCircleLocation.x)
        var degrees = Int(-angle * __designTimeInteger("#44187_0", fallback: 180) / .pi)
        if degrees < __designTimeInteger("#44187_1", fallback: 0) {
            degrees += __designTimeInteger("#44187_2", fallback: 360)
        }
        return "\(degrees)°"
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .contentShape(Rectangle()) // Entire screen tappable
                .simultaneousGesture(fingerDrag)
            
            // Outer joystick circle
            Circle()
                .foregroundColor(.gray)
                .frame(width: bigCircleRadius * __designTimeInteger("#44187_3", fallback: 2), height: bigCircleRadius * __designTimeInteger("#44187_4", fallback: 2))
                .position(outerCircleLocation)
                .gesture(fingerDrag)
            
            // Inner joystick circle
            Circle()
                .foregroundColor(Color(white: __designTimeFloat("#44187_5", fallback: 0.4745)))
                .frame(width: bigCircleRadius/__designTimeFloat("#44187_6", fallback: 1.25), height: bigCircleRadius/__designTimeFloat("#44187_7", fallback: 1.25))
                .position(innerCircleLocation)
                .gesture(fingerDrag)
            
            // Angle text overlay
            Text(angleText)
                .font(.title)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(Color.black.opacity(__designTimeFloat("#44187_8", fallback: 0.7)))
                .cornerRadius(__designTimeInteger("#44187_9", fallback: 10))
                .position(x: UIScreen.main.bounds.width / __designTimeInteger("#44187_10", fallback: 2), y: __designTimeInteger("#44187_11", fallback: 50))
        }
    }
}

struct JoystickView_Previews: PreviewProvider {
    static var previews: some View {
        JoystickView()
    }
}
