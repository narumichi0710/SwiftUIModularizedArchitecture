//
//  SearchRootView.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import SwiftUI
import SearchClient

public struct SearchRootView: View {
    @StateObject private var store: SearchStore = .init()
    
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
            TextField("user name", text: Binding(
                get: { store.state.searchText },
                set: { store.dispatch(.onChangedText($0))})
            )
            .onSubmit { store.dispatch(.onSubmitted) }
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
                if let items = store.state.contents?.items {
                    ScrollView {
                        VStack {
                            ForEach(items) { user in
                                cell(user: user)
                                Divider()
                            }
                        }
                    }
                } else {
                    Text("検索ワードに一致するユーザーが存在しません。")
                }
            }
        }
    }
    
    private func cell(user: SearchEntity.Response.User) -> some View {
        HStack {
            if let avatarUrl = user.avatarUrl {
                AsyncImage(url: URL(string: avatarUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .padding()
            }
            Spacer()
            if let login = user.login {
                Text(login)
                    .padding()
            }
            Spacer()
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

