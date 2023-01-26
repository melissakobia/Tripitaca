//
//  LoginView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 23/01/2023.
//

import SwiftUI

let width = UIScreen.main.bounds.width

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var username: String = ""
    @State private var password: String = ""
    @State var showHome: Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 10) {
                    
                    header
                        .padding(.top)
                    
                    emailField
                    
                    passwordField
                    
                    recoveryPasswordButton
                    
                    loginButton
                    
                    Button {
                        authManager.signInWithGoogle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.primary)
                            
                            HStack(alignment: .center, spacing: 20) {
                                Image("google")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                
                                Text("Continue with Google")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(height: 45)
                    }
                    NavigationLink(isActive: $showHome) { CustomTabView() } label: { }.hidden()
                    
                }
                .padding()
               
            }
            .navigationBarHidden(true)
        }
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Spacer()
                
                Image("tripitacalogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 50)
                
                Spacer()
                
            }
            .padding(.bottom, 50)
            
            
            Text("Welcome to Tripitaca,")
                .font(.title3)
                .fontWeight(.semibold)
        }
        .padding(.top)
        .padding(.bottom, 10)
    }
    
    var emailField: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Email")
                .font(.footnote)
                .fontWeight(.semibold)
            
            HStack {
                TextField(text: $username, prompt: Text("Enter email").foregroundColor(.gray).font(.footnote)) {
                    EmptyView()
                }
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 6))
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .fill(Color(uiColor: .systemGray5))
            }
        }
        .padding(.bottom, 10)
    }
    
    var passwordField: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Password")
                .font(.footnote)
                .fontWeight(.semibold)
            
            HStack {
                PasswordField(password: $password)
                
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 6))
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .fill(Color(uiColor: .systemGray5))
            }
        }
        
    }
    
    var recoveryPasswordButton: some View {
        HStack(alignment: .center, spacing: 10) {
            Spacer()
            
            Button {} label: {
                Text("Forgot Password")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            
        }
        .padding(.vertical, 5)
    }
    
    var loginButton: some View {
        VStack {
            
            Button {
                showHome = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("primaryColor"))
                    
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.medium)
                }
                .frame(height: 45)
            }
            
        }
        .padding(.vertical)
    }
    
    func login() {
        self.showHome = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

fileprivate struct PasswordField: View {
    @State var showPassword: Bool = false
    @Binding var password: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if showPassword {
                    TextField(text: $password, prompt: Text("Enter password").foregroundColor(.gray).font(.footnote)) {
                        
                        Text("Password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                } else {
                    SecureField(text: $password, prompt: Text("Enter password").foregroundColor(.gray).font(.footnote)) {
                        
                        Text("Password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
                    .imageScale(.medium)
            }
            
        }
        
    }
}
