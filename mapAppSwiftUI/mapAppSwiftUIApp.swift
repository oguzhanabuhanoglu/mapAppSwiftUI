//
//  mapAppSwiftUIApp.swift
//  mapAppSwiftUI
//
//  Created by Oğuzhan Abuhanoğlu on 6.05.2024.
//

import SwiftUI

@main
struct mapAppSwiftUIApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
