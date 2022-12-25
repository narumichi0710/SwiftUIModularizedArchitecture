//
//  ApiClient.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import Foundation
import Combine

// MARK: API共通処理を継承するためのプロトコル
protocol ApiClient {
    /// ボディ
    associatedtype Body: Encodable
    /// レスポンス
    associatedtype Response: Decodable
    /// URL
    var baseURL: String { get }
    /// APIパス
    var path: String { get }
    /// HTTPメソッド
    var method: HTTPMethodType { get }
    /// ヘッダーフィールド
    var headerFields: [String: String] { get }
    /// パブリッシャー
    var publisher: AnyPublisher<Response, APIError> { get }
    /// スケジューラー
    var scheduler: DispatchQueue { get }
}

extension ApiClient {
    var baseURL: String {
        return "https://api.github.com"
    }
    var headerFields: [String: String] {
        return ["Accept": "application/json"]
    }
    var scheduler: DispatchQueue {
        .main
    }
}


extension ApiClient {

    /// API呼び出し処理
    func request(body: Body? = nil) -> AnyPublisher<Response, APIError> {
        let urlRequest = try! getUrlRequest(body: body)

        return URLSession.shared
            // タスクの発行
            .dataTaskPublisher(for: urlRequest)
            // エラーハンドリング
            .tryMap { element -> Data in
                // URLResponse→HTTPURLResponseにキャスト
                guard let response = element.response as? HTTPURLResponse else {
                    throw APIError.noResponse
                }
                // responseからStatusコードを取得
                guard 200 ..< 300 ~= response.statusCode else {
                    // responseからエラーログの取得
                    let errorResponse = try? JSONDecoder().decode(APIError.Message.self, from: element.data)
                    print("API Error: \(String(describing: errorResponse?.message)) ErrorCode: \(response.statusCode)")
                    throw APIError.serverError
                }
                return element.data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { error in
                error as? APIError ?? .serverError
            }
            // publisherの型を抽象化（型消去）
            .eraseToAnyPublisher()
    }

    /// urlRequestの生成処理
    /// - Returns: URLRequest
    func getUrlRequest(body: Body? = nil) throws -> URLRequest {
        // Pathの追加, URLの生成
        let url = try baseURL.appending(path).asURL()

        // urlComponentの生成
        guard var component = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print(url, "URLComponents Create Error: \(url)")
            throw APIError.serverError
        }
        // ボディの追加
        if let body = body, let data = JsonUtil.encode(body) {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            component.queryItems = jsonObject?.compactMap {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
        }
        // urlRequestの生成
        guard var urlRequest = component.url.map({ URLRequest(url: $0) }) else {
            print(url, "URLRequest Create Error: \(component)")
            throw APIError.serverError
        }
        urlRequest.httpMethod = method.localize

        return urlRequest
    }
}

// MARK: HTTPメソッドタイプ
enum HTTPMethodType: String {
    case get
    case post
    case put
    case delete
    case paych

    var localize: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        case .paych:
            return "PATCH"
        }
    }
}

// MARK: APIError Localize
enum APIError: Error, Equatable {
    case invalidUrl
    case serverError
    case noResponse
    case other(String)

    var localize: String? {
        switch self {
        case .invalidUrl:
            return "無効なUrlです。少し時間を置いてからアクセスしてください。"
        case .serverError:
            return "サーバーエラーが発生しました。少し時間を置いてからアクセスしてください。"
        case .noResponse:
            return "サーバーからの応答がありません。少し時間を置いてからアクセスしてください。"
        default:
            return nil
        }
    }
}

// MARK: APIError ログ取得用モデル
extension APIError {
    struct Message: Decodable, Equatable {
        let documentationURL: URL
        let errors: Errors
        let message: String

        struct Errors: Decodable, Equatable {
            let resource: String
            let field: String
            let code: String

            private enum CodingKeys: String, CodingKey {
                case resource, field, code
            }
        }
        private enum CodingKeys: String, CodingKey {
            case documentationURL = "documentation_url"
            case errors, message
        }
    }
}

private extension String {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw APIError.invalidUrl
        }
        return url
    }
}
