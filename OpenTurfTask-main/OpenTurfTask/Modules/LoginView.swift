//
//  LoginView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var ToHomePage: Bool = false
    @State var isPasswordVisible: Bool = false
    @StateObject var viewModel = MainViewModel()
    @EnvironmentObject var alertViewModel: AlertViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 25) {
                    /// Email Text field
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(Color(hex: "1E2022"))
                            .padding(.horizontal, 22)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "6C7278").opacity(0.5), lineWidth: 1)
                            )
                            .padding(.horizontal, 20)
                            .submitLabel(.next)
                    }
                    
                    /// Password Text field
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(Color(hex: "1E2022"))
                            .padding(.horizontal, 22)
                        
                        ZStack {
                            HStack {
                                
                                if isPasswordVisible {
                                    TextField("Password", text: $password)
                                        .submitLabel(.done)
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: $password)
                                        .submitLabel(.done)
                                }
                                
                                Spacer()
                                
                                Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash")
                                    .foregroundColor(Color(hex: "ACB5BB"))
                                    .onTapGesture {
                                        isPasswordVisible.toggle()
                                    }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.leading, 15)
                        .padding(.trailing, 9)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "6C7278").opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal, 20)
                    }
                    
                    /// Log In Button
                    Button(action: {
                        validateFields()
                    }) {
                        Text("Log In")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "457AFE"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 8)
                } /// End Of VStack
                .padding(.vertical, 30)
                .background(Color(hex: "FFFFFF"))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.bottom, 40)
                
                Spacer()
            }
            .background(Color(hex: "0B99FF"))
            .navigationBarHidden(true)
            .background(
                NavigationLink(
                    destination:     HomeView()
                        .environmentObject(alertViewModel)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true),
                    isActive: $ToHomePage
                ) { EmptyView() }
            )
            .alert(isPresented: $alertViewModel.showAlert) {
                Alert(title: Text(alertViewModel.alertTitle),
                      message: Text(alertViewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func validateFields() {
        if email.isEmpty {
            alertViewModel.displayAlert(message: "Email field is empty." )
        } else if !isValidEmail(email) {
            alertViewModel.displayAlert(message: "Please enter a valid email address.")
        } else if password.isEmpty {
            alertViewModel.displayAlert(message: "Password field is empty." )
        } else {
            ToHomePage = true
        }
    }
}

