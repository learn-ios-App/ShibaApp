//
//  APIClient.swift
//  ShibaDogApp
//
//  Created by 渡邊魁優 on 2023/04/02.
//

import Foundation

class APIClient {
    func fetch() async throws -> [URL] {
        
        guard let url = URL(string: "https://shibe.online/api/shibes?count=5&urls=true&httpsUrls=true") else {
            throw APIError.invalidURL
        }
        print("URL作成成功\(url)")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("データ取得成功\(data)")
            let result = try JSONDecoder().decode([URL].self, from: data)
            print("デコード成功")
            return result
        } catch {
            throw APIError.networkError
        }
    }
}
