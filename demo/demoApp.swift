//
//  demoApp.swift
//  demo
//
//  Created by 32 Technologies on 04/07/23.
//

import SwiftUI

@main
struct demoApp: App {
    @StateObject var audioManager  = AudioManager()
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(audioManager)
        }
    }
}
