import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/jj/Desktop/gameskeleton/gameskeleton/CharacterView.swift", line: 1)
//
//  CharacterView.swift
//  gameskeleton
//
//  Created by Moritz Kohlenz on 3/2/25.
//

import SwiftUI

struct CharacterView: View {
    @Binding var circleLocation: CGPoint

    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: __designTimeInteger("#8179_0", fallback: 100), height: __designTimeInteger("#8179_1", fallback: 100))
                .position(circleLocation)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    @State static var previewLocation = CGPoint(x: 100, y: 100)
    
    static var previews: some View {
        CharacterView(circleLocation: $previewLocation)
    }
}
