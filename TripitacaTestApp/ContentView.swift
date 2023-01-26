//
//  ContentView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @State var isActive: Bool = false
    
    private var isInitial: Bool  {
        get {
            return SessionManager().userAuthCompleted()
        }
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                if isActive {
                    if !SessionManager().userAuthCompleted() {
                        LoginView()
                    } else {
                        CustomTabView()
                    }
                } else {
                    if !self.isInitial {
                        initialScreen
                    } else {
                        Image("tripitacalogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 50)

                    }
                }
            }
            .onAppear {
                validateAuthorisedUser()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    var initialScreen: some View {
        Text("Welcome screen")
    }
    
    func validateAuthorisedUser() {
        self.authManager.validateUser()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
