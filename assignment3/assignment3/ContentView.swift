//
//  ContentView.swift
//  assignment3
//
//  Created by Jerry Lo on 10/5/2024.
//


import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 50)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: MenuView(username: username),
                    isActive: $isLoggedIn,
                    label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                            .opacity(username.isEmpty || password.isEmpty ? 0.5 : 1.0) // Disable the button if username or password is empty
                    })
                    .disabled(username.isEmpty || password.isEmpty) // Disable the button if username or password is empty
                
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}
