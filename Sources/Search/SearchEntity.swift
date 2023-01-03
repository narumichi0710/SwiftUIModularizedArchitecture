//
//  SearchEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/03.
//

import Foundation

enum SearchEntity {
    
    struct Request: Encodable, Equatable {
        var q: String
    }
    
    enum Response {
        struct Users: Decodable, Equatable {
            var totalCount: Int
            var incompleteResults: Bool
            var items: [User]
            
            static let mockUsers = Users(
                totalCount: 2,
                incompleteResults: false,
                items: [
                    User(
                        login: "narumichi0710",
                        avatarUrl: "https://avatars.githubusercontent.com/u/65114797?v=4",
                        reposUrl: "https://api.github.com/users/narumichi0710/repos"
                    ),
                    User(
                        login: "narumichi0710",
                        avatarUrl: "https://avatars.githubusercontent.com/u/65114797?v=4",
                        reposUrl: "https://api.github.com/users/narumichi0710/repos"
                    )
                ]
            )
            
            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case incompleteResults = "incomplete_results"
                case items
            }
        }
        
        struct User: Decodable, Equatable, Identifiable {
            var id = UUID()
            var login: String
            var avatarUrl: String
            var reposUrl: String
            
            private enum CodingKeys: String, CodingKey {
                case login
                case avatarUrl = "avatar_url"
                case reposUrl = "repos_url"
            }
        }
    }
}
