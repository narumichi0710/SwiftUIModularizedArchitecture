//
//  SearchStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/03.
//

import Foundation
import SearchClient

final public class SearchStore: ObservableObject {
    
    @Published var state = State()
    struct State {
        fileprivate(set) var searchText = ""
        fileprivate(set) var contents: SearchEntity.Response.Users?
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
            SearchClient().fetchUsers(
                body: .init(q: state.searchText)
            ) { [weak self] response in
                self?.state.contents = response
            } onFailure: { error in
            }
        }
    }
}
