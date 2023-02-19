//
//  TutorialStore.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/01.
//

import Foundation

final public class TutorialStore: ObservableObject {
    
    @Published var state: State
    public struct State {
        fileprivate(set) var currentStep: TutorialType.Step
        fileprivate(set) var isFinish: Bool
        
        public init(
            currentStep: TutorialType.Step = .one,
            isFinish: Bool = false
        ) {
            self.currentStep = currentStep
            self.isFinish = isFinish
        }
    }
    
    public enum Action {
        case update(TutorialType.Step)
        case toggle
    }
    
    public enum Enviroment {}
    
    public init(state: State = State()) {
        self.state = state
    }
    
    public func dispatch(_ action: Action) {
        switch action {
        case .update(let step):
            state.currentStep = step
        case .toggle:
            state.isFinish.toggle()
        }
    }
}
