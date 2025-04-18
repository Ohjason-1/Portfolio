//
//  LoginView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LoginViewModel
    
    @Environment(\.dismiss) var dismiss
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authManager: authManager))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.airbnbIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(PrimaryTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(PrimaryTextFieldModifier())
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task {
                        await viewModel.login(withEmail: email, password: password)
                        dismiss()
                    }
                } label: {
                    Text("Login")
                        .modifier(PrimaryButtondModifier())
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty
    }
}

#Preview {
    LoginView(authManager: AuthManager(service: MockAuthService()))
}
