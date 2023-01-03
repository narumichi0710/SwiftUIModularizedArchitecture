//
//  SwiftUIView.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import SwiftUI

public struct TutorialRootView: View {
    private var onFinish: () -> Void
    @StateObject private var store: TutorialStore = .init()
    
    public init (onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            header
            content
        }
        .padding(16)
    }
    
    private var header: some View {
        Group {
            HStack {
                Spacer()
                Button {
                    onFinish()
                } label: {
                    Text("Skip")
                }
            }
            Gauge(value: store.state.currentStep.toProgress) {}
                .animation(.default, value: store.state.currentStep)
        }
        .padding(.bottom, 8)
    }
    
    private var content: some View {
        TabView(selection: Binding(
            get: { store.state.currentStep },
            set: { store.dispatch(.onChangeTutorialStep($0)) }
        )) {
            stepOneContent
                .tag(TutorialType.Step.one)
            stepTwoContent
                .tag(TutorialType.Step.two)
            stepThreeContent
                .tag(TutorialType.Step.three)
        }
        .tabViewStyle(.page)
    }
}

extension TutorialRootView {
    private var stepOneContent: some View {
        VStack {
            title
            Spacer()
        }
    }
    private var stepTwoContent: some View {
        VStack {
            title
            Spacer()
        }
    }
    private var stepThreeContent: some View {
        VStack {
            title
            Spacer()
            Button {
                onFinish()
            } label: {
                Text("チュートリアルを終了する")
            }
            .padding(16)
        }
    }
    
    private var title: some View {
        HStack {
            Divider()
                .frame(width: 4)
            Text("Step \(store.state.currentStep.rawValue + 1)")
                .font(.title)
            Spacer()
        }
    }
    
}


public struct TutorialRootView_Previews: PreviewProvider {
    public static var previews: some View {
        TutorialRootView{}
    }
}
