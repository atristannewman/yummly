//
//  View+OfflineAlert.swift
//  Yummly
//
//  Created by Tristan Newman on 11/13/24.
//

import SwiftUI

extension View {
    func offlineAlert() -> some View {
        self.modifier(OfflineAlertView())
    }
}
