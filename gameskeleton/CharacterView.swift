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
                .frame(width: 100, height: 100)
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
