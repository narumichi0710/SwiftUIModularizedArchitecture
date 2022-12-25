//
//  SearchRootView.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import SwiftUI

public struct SearchRootView: View {
    @State var text: String = ""
    
    public init () {}
    
    public var body: some View {
        VStack {
            header
            content
            Spacer()
        }
    }
    
    // ヘッダー
    private var header: some View {
        VStack {
            HStack {
                Text("Github User Search")
                    .font(.title)
                Spacer()
            }
            // 検索項目
            TextField("user name", text: $text)
                .onSubmit(onSubmitText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.asciiCapable)
        }
        .padding()

    }
    
    /// コンテント
    private var content: some View {
        ScrollView {
            VStack {
                // 検索結果リスト
                Text("検索ワードに一致するユーザーが存在しません。")
            }
        }
    }
}


/// UI Events
extension SearchRootView {
    func onSubmitText() {}
    
}

public struct SearchRootView_Previews: PreviewProvider {
    public static var previews: some View {
        SearchRootView()
    }
}

