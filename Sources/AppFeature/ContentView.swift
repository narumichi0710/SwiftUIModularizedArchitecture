//
//  ContentView.swift
//  App
//
//  Created by Narumichi Kubo on 2022/12/21.
//

import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

public struct ContentView_Previews: PreviewProvider {
    public init() {}

    public static var previews: some View {
        ContentView()
    }
}
