//
//  AppStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/01.
//

import Foundation

final public class AppStore: ObservableObject {

    @Published var state = State()
    struct State {
        fileprivate(set) var isPresentedHome: Bool = false
        fileprivate(set) var selectedTab: AppType.Tab = .search
    }
    
    enum Action {
        case onFinish
        case onChangeTab(AppType.Tab)
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .onFinish:
            state.isPresentedHome.toggle()
        case .onChangeTab(let type):
            state.selectedTab = type
        }
    }
}
