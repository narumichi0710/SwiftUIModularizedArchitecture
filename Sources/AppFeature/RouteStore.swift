//
//  RouteStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/02/19.
//

import SwiftUI

/// 画面遷移管理Store
final public class RouteStore: ObservableObject {
    
    @Published var state = State()

    enum Route {
        case a
        case b
        case c
    }
    
    struct State {
        fileprivate(set) var routes: [Route] = []
    }
    
    enum Action {
        case onBind([RouteStore.Route])
        case onForward(RouteStore.Route)
        case onBack
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .onBind(let routes):
            state.routes = routes
        case .onForward(let route):
            state.routes.append(route)
        case .onBack:
            state.routes.removeLast()
        }
    }
}
