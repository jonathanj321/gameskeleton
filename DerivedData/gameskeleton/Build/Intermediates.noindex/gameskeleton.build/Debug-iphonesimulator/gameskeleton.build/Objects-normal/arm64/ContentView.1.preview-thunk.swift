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
    var body: some View {
        Circle()
            .fill(.blue)
        Text(__designTimeString("#6492_0", fallback: "hello"))
    }
    
}

#Preview {
    ContentView()
}
