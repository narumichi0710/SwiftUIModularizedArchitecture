//
//  ContentView.swift
//  App
//
//  Created by Narumichi Kubo on 2022/12/21.
//

import SwiftUI
import Search

public struct AppView: View {
    @State private var selectedTab: AppType.Tab = .search
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            SearchRootView()
                .tag(AppType.Tab.search.rawValue)
            
        }
    }
}

public struct AppView_Previews: PreviewProvider {
    public init() {}

    public static var previews: some View {
        AppView()
    }
}
