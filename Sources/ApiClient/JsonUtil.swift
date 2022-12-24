//
//  File.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/24.
//

import Foundation

/// JSON関連のユーティリティ
struct JsonUtil {
    // エンコーダー.
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        return encoder
    }()

    // デコーダー.
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()

    /// エンコード.
    /// - Parameter value: エンコードするデータ
    /// - Returns: Data or nil
    static func encode<T>(_ value: T) -> Data? where T: Encodable {
        do {
            let result = try encoder.encode(value)
            return result
        } catch {
            print("encode() error:", error)
            return nil
        }
    }

    /// デコード.
    /// - Parameters:
    ///   - type: デコードする型
    ///   - data: Data
    /// - Returns: T or nil
    static func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        do {
            let result = try decoder.decode(type, from: data)
            return result
        } catch {
            print("decode() error:", error)
            return nil
        }
    }
}
