//
//  SearchStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/03.
//

import Foundation

final public class SearchStore: ObservableObject {
    
    @Published var state = State()
    struct State {
        fileprivate(set) var searchText = ""
    }
    
    enum Action {
        case onChangedText(String)
        case onSubmitted
    }
    
    
    func dispatch(_ action: Action) {
        switch action {
        case .onChangedText(let text):
            state.searchText = text
        case .onSubmitted:
            break
        }
    }
}
