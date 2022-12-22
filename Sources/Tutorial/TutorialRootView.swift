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
        VStack {
            TabView {
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
    
    private var stepOneContent: some View {
        VStack {
            HStack {
                Text("Step 1")
                    .font(.title2)
                Spacer()
            }
            Spacer()
        }
    }
    private var stepTwoContent: some View {
        VStack {
            HStack {
                Text("Step 2")
                    .font(.title2)
                Spacer()
            }
            Spacer()
        }
    }
    private var stepThreeContent: some View {
        VStack {
            HStack {
                Text("Step 3")
                    .font(.title2)
                Spacer()
            }
            Spacer()
            Button {
                isPresentedHome.toggle()
            } label: {
                Text("Close")
            }
        }
    }
}




public struct TutorialRootView_Previews: PreviewProvider {
    public static var previews: some View {
        TutorialRootView(isPresentedHome: .constant(true))
    }
}
