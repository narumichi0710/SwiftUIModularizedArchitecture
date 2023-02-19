//
//  AppStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/01.
//

import Foundation
import Tutorial

final public class AppStore: ObservableObject {
    @Published var state = State()
   
    struct State {
        fileprivate(set) var selectedTab: AppType.Tab = .chat
        fileprivate(set) var routeStore: RouteStore.State = .init()
        fileprivate(set) var tutorialStore: TutorialStore.State = .init()
    }
    
    enum Action {
        case onChangeTab(AppType.Tab)
        case routeAction(RouteStore.Action)
        case tutorialAction(TutorialStore.Action)
    }
    
    public enum Enviroment {}

    public init() {}
    
    func dispatch(_ action: Action) {
        switch action {
        case .onChangeTab(let tab):
            state.selectedTab = tab
        case .routeAction(_):
            break
        case .tutorialAction(_):
            break
        }
    }
}



