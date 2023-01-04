//
//  SearchClient.swift
//  
//
//  Created by Narumichi Kubo on 2023/01/03.
//

import Foundation
import Combine
import ApiClient

// TODO: あとで修正
public var cancelable = Set<AnyCancellable>()

public struct SearchClient: ApiClient {
    /// ボディ
    public typealias Body = SearchEntity.Request
    /// レスポンス
    public typealias Response = SearchEntity.Response.Users
    /// メソッド
    public var method: HTTPMethodType { .get }
    /// パス
    public var path: String { "/search/users" }

    public init() {}

    public func fetchUsers(
        body: SearchEntity.Request,
        onSuccess: @escaping (SearchEntity.Response.Users) -> Void,
        onFailure: @escaping (APIError) -> Void,
        completion: @escaping () -> Void = {}
    ) {
        request(
            body: body,
            success: onSuccess,
            failure: onFailure,
            completion: completion
        )
        .store(in: &cancelable)
    }
}
