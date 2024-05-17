//
//  ContentView.swift
//  assignment3
//
//  Created by Jerry Lo on 6/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo") // image on login screen
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 50)
                
                TextField("Username", text: $username) // username field
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password) // password field -- securefield is used to hide input
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                NavigationLink( // transfer username information over to MenuView to display welcome message
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
                            .opacity(username.isEmpty || password.isEmpty ? 0.5 : 1.0) // disable button if the username or password field are empty
                    })
                    .disabled(username.isEmpty || password.isEmpty) // disable the button if the username or password fields are empty
                
                Spacer()
            }
            .padding()
            .navigationTitle("CineBook Login") // heading
        }
    }
}

