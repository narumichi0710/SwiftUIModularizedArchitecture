//
//  SearchEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/03.
//

import Foundation

public enum SearchEntity {
    
    public struct Request: Encodable, Equatable {
        var q: String
        
        public init(q: String) {
            self.q = q
        }
    }
    
    public enum Response {
        public struct Users: Decodable, Equatable {
            public var totalCount: Int
            public var incompleteResults: Bool
            public var items: [User]
            
            public init(
                totalCount: Int,
                incompleteResults: Bool,
                items: [User]
            ) {
                self.totalCount = totalCount
                self.incompleteResults = incompleteResults
                self.items = items
            }
            
            public static let mockUsers = Users(
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
        
        public struct User: Decodable, Equatable, Identifiable {
            public var id = UUID()
            public var login: String
            public var avatarUrl: String
            public var reposUrl: String
            
            public init(
                id: UUID = UUID(),
                login: String,
                avatarUrl: String,
                reposUrl: String
            ) {
                self.id = id
                self.login = login
                self.avatarUrl = avatarUrl
                self.reposUrl = reposUrl
            }
            
            private enum CodingKeys: String, CodingKey {
                case login
                case avatarUrl = "avatar_url"
                case reposUrl = "repos_url"
            }
        }
    }
}
