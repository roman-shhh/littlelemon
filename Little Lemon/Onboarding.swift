//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Roman on 14.03.2024.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "is logged in key"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(isLoggedIn: isLoggedIn)
                
                Hero()
                
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Text("First name *")
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .font(.custom("Karla-Regular", size: 20))
                
                TextField("First Name",
                          text: $firstName)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
                    .padding([.horizontal])
                
                Text("Last name *")
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .font(.custom("Karla-Regular", size: 20))
                
                TextField("Last Name",
                      text: $lastName)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
                    .padding(.horizontal)
                
                Text("Email *")
                    .padding([.horizontal, .top])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .font(.custom("Karla-Regular", size: 20))
                
                TextField("Email",
                      text: $email)
                .keyboardType(.emailAddress)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
                    .padding(.horizontal)
                
                let formValid = !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
                
                Button("Register") {
                    if (formValid) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                }
                .disabled(!formValid)
                .padding()
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(Color(red: 73/255, green: 94/255, blue: 87/255))
                .cornerRadius(8)
                
                Spacer()
            }.onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
