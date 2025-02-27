//
//  ContentView.swift
//  gameskeleton
//
//  Created by Jonathan Jiang on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .fill(.blue)
        Text("hello")
        var x = 1
        Button("press") {
            print(x)
            x += 1
        }
    }
    
}

#Preview {
    ContentView()
}
