//
//  TutorialStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/01.
//

import Foundation

final public class TutorialStore: ObservableObject {
    
    @Published var state = State()
    struct State {
        fileprivate(set) var currentStep: TutorialType.Step = .one
    }
    
    enum Action {
        case onChangeTutorialStep(TutorialType.Step)
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .onChangeTutorialStep(let step):
            state.currentStep = step
        }
    }
}
