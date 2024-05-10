//
//  LoginView.swift
//  assignment3login
//
//  Created by Dannii Huynh on 6/5/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false // You can use this state to manage login status
    
    var body: some View {
        VStack {
            Image("your_logo")
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
            
            Button(action: {
                // Handle login logic here
                // For simplicity, let's just print username and password
                print("Username: \(username), Password: \(password)")
                
                // Set isLoggedIn to true if login is successful
                isLoggedIn = true
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
