//
//  ProfileView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            Text("Profile")
                .font(.title)
            Spacer()
            
            Button {
                authManager.signOut()
            } label: {
                Text("Sign Out")
                    .foregroundColor(.red)
                    .font(.callout)
                    .fontWeight(.medium)
            }

        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
