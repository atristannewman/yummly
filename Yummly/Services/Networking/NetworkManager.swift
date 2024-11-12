//
//  NetworkManager.swift
//  Yummly
//
//  Created by Tristan Newman on 11/12/24.
//

import SwiftUI
import Network

class NetworkManager: ObservableObject {
    
    @Published var isConnected: Bool = true
        
    private let monitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        setupReachability()
    }
    
    private func setupReachability() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: monitorQueue)
    }
    
    deinit {
        monitor.cancel()
    }
}

extension NetworkManager {
    func reachable() async -> Bool {
        return isConnected
    }
}
