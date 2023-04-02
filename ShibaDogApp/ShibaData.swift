//
//  ShibaData.swift
//  ShibaDogApp
//
//  Created by 渡邊魁優 on 2023/04/02.
//

import Foundation

class ShibaData: ObservableObject {
    @Published var dogImages: [URL] = []
    let shibaAPIClient = APIClient()
    
    func onApper() {
        Task {
            await loadShiba()
        }
    }
    
    @MainActor
    private func loadShiba() async {
        do {
            let results = try await shibaAPIClient.fetch()
            dogImages = results
        } catch {
            let error = error as? APIError ?? APIError.unknown
            print(error.title)
        }
    }
}
