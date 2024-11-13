//
//  NetworkManager.swift
//  Yummly
//
//  Created by Tristan Newman on 11/12/24.
//

import Network
import SwiftUI

class NetworkMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    @Published var hasNetworkConnection = true
    let queue = DispatchQueue(label: "network monitor")
    
    init() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            self.setNetworkConnection(connection: path.status == .satisfied)
            print("connection ", path.status)
        }
        
        networkMonitor.start(queue: queue)
    }
    
    private func setNetworkConnection(connection: Bool) {
        Task { @MainActor in
            withAnimation {
                hasNetworkConnection = connection
            }
        }
    }
    
    deinit {
        networkMonitor.cancel()
    }
}

