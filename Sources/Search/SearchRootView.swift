//
//  SearchRootView.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import SwiftUI

public struct SearchRootView: View {
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

public struct SearchRootView_Previews: PreviewProvider {
    public init() {}

    public static var previews: some View {
        SearchRootView()
    }
}

