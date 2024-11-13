//
//  OfflineAlertView.swift
//  Yummly
//
//  Created by Tristan Newman on 11/13/24.
//

import SwiftUI

struct OfflineAlertView: ViewModifier {
    @EnvironmentObject var monitor: NetworkMonitor

    func body(content: Content) -> some View {
        ZStack {
            content

            if !self.monitor.hasNetworkConnection {
                ZStack {
                    HStack {
                        Image(systemName: "network.slash")
                            .foregroundStyle(.white.opacity(0.8))
                        Text("No connection")
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding()
                    .background(.black.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .transition(.move(edge: .leading))
            }
        }
    }
}
