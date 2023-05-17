//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by iOS Development Lab FI UNAM on 25/01/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
