//
//  ContentView.swift
//  SaneForceTask
//
//  Created by APPLE on 02/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var alertViewModel = AlertViewModel()
    var body: some View {
        LoginView()
            .environmentObject(alertViewModel)
    }
}

#Preview {
    ContentView()
}
