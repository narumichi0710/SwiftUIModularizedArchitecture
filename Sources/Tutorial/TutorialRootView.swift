//
//  SwiftUIView.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import SwiftUI

public struct TutorialRootView: View {
    @Binding private var isPresentedHome: Bool
    @State private var currentStep: TutorialType.Step = .one
    
    public init (
        isPresentedHome: Binding<Bool>
    ) {
        self._isPresentedHome = isPresentedHome
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
                    isPresentedHome.toggle()
                } label: {
                    Text("Skip")
                }
            }
            Gauge(value: currentStep.toProgress) {}
                .animation(.default, value: currentStep)
        }
        .padding(.bottom, 8)
    }
    
    private var content: some View {
        TabView(selection: $currentStep) {
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
                isPresentedHome.toggle()
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
            Text("Step \(currentStep.rawValue + 1)")
                .font(.title)
            Spacer()
        }
    }
    
}


public struct TutorialRootView_Previews: PreviewProvider {
    public static var previews: some View {
        TutorialRootView(isPresentedHome: .constant(true))
    }
}
