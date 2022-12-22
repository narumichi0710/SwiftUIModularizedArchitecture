//
//  ContentView.swift
//  App
//
//  Created by Narumichi Kubo on 2022/12/21.
//

import SwiftUI
import Search
import Explore
import Setting

public struct AppView: View {
    @State private var selectedTab: AppType.Tab = .search
    public init () {}

    public var body: some View {
        TabView(selection: $selectedTab) {
            SearchRootView()
                .tag(AppType.Tab.search.rawValue)
            ExploreRootView()
                .tag(AppType.Tab.explore.rawValue)
            SettingRootView()
                .tag(AppType.Tab.setting.rawValue)
        }
        .tabViewStyle(.page)
    }
}

public struct AppView_Previews: PreviewProvider {
    public init() {}

    public static var previews: some View {
        AppView()
    }
}
