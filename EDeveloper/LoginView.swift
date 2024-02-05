//
//  ContentView.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import SwiftUI
import CoreData

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isSecureTextVisible = false
    
    var body: some View{
        let _ = Self._printChanges()
        ScrollView {
       
            VStack(alignment: .center, spacing:10) {
                Spacer()
                Text("WelCome SwiftUI")
                    .font(.title)
                    .padding()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .padding()
                
                VStack(spacing:20) {
                    TextField("UserName", text: $userName)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green)
                        )
                        .padding(.horizontal,10)
                    
                    SecureField("password", text: $password)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green)
                        )
                        .padding(.horizontal,10)
                    
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // Action for Forgot Password
                        }) {
                            Text("Forgot Password")
                                .font(.title3)
                                .foregroundStyle(.green)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding()
                    }
                }
                Button {
                  print("do login action")
                } label: {
                  Text("Sign In")
                  .font(.title2)
                  .bold()
                  .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(
                   LinearGradient(colors: [.blue, .red], startPoint: .topLeading,                endPoint: .bottomTrailing) // how to add a gradient to a button in SwiftUI
                )
                .cornerRadius(20)
                .padding()
               
                Spacer()
            }.padding()
        }.background(Color.secondary.opacity(0.1))
            .ignoresSafeArea(.all)
    }
    
}

#Preview {
    LoginView()
}
