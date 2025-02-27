//
//  ContentView.swift
//  gameskeleton
//
//  Created by Jonathan Jiang on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            var x = 1
            Button("Hello") {
                x += 1
                print(x)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
