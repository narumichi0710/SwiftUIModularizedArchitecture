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
import Tutorial

public struct AppView: View {
    @StateObject private var appStore: AppStore = .init()
    @State private var isPresentedHome = false
    public init () {}

    public var body: some View {
        if isPresentedHome {
            TabView(
                selection: Binding(
                    get: { appStore.state.selectedTab },
                    set: { appStore.dispatch(.onChangeTab($0)) }
                )
            ) {
                SearchRootView()
                    .tag(AppType.Tab.search)
                ExploreRootView()
                    .tag(AppType.Tab.explore)
                SettingRootView()
                    .tag(AppType.Tab.setting)
            }
            .tabViewStyle(.page)
        } else {
            TutorialRootView(isPresentedHome: $isPresentedHome)
        }
    }
}

public struct AppView_Previews: PreviewProvider {
    public init() {}

    public static var previews: some View {
        AppView()
    }
}
