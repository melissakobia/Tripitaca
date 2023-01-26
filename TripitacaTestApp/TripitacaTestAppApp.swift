//
//  TripitacaTestAppApp.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 23/01/2023.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct TripitacaTestAppApp: App {
    @StateObject var authManager: AuthManager = AuthManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    init() {
//       setupAuthentication()
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authManager)
//                .onOpenURL { url in
//                GIDSignIn.sharedInstance.handle(url)
//              }
        }
    }
}


extension TripitacaTestAppApp {
//    private func setupAuthentication() {
//        FirebaseApp.configure()
//      }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        FirebaseApp.configure()

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        return GIDSignIn.sharedInstance.handle(url)
    }
}


