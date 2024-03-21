//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Roman on 16.03.2024.
//

import SwiftUI

struct UserProfile: View {
    let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "First Name"
    let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "Lase Name"
    let email: String = UserDefaults.standard.string(forKey: kEmail) ?? "Email"
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack {
                Header()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Personal Information")
                            .padding(.top, 20).padding(.leading, 10)
                            .font(.custom("Karla-bold", fixedSize: 22))
                        
                        Text("Avatar")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        
                        HStack {
                            Image("profile-image-placeholder").resizable()
                                .scaledToFit()
                                .frame(maxWidth: 80, maxHeight: 80)
                            
                            Button("Change") {}
                                .buttonStyle(.borderedProminent)
                                .controlSize(.regular)
                                .fontWeight(.bold)
                                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .cornerRadius(10).padding(.horizontal, 5)
                            
                            Button("Remove") {}
                                .buttonStyle(.borderedProminent)
                                .controlSize(.regular)
                                .tint(Color.white)
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
                                .padding(.horizontal, 5)
                        }
                        
                        Text("First Name")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(firstName)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)
                        
                        Text("Last Name")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(lastName).padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)
                        
                        Text("Email")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(email)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)
                        
                        Text("Email notifications")
                            .padding(.top, 20).padding(.leading, 10)
                            .font(.custom("Karla-bold", fixedSize: 18))
                        
                        HStack {
                            Image(systemName: "square")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                            Text("Order statuses")
                        }.padding(.leading, 10)
                        
                        HStack {
                            Image(systemName: "square")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                            Text("Password Changes")
                        }.padding(.leading, 10)
                        
                        HStack {
                            Image(systemName: "square")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                            Text("Special offers")
                        }.padding(.leading, 10)
                        
                        HStack {
                            Image(systemName: "square")
                                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                            Text("Newsletter")
                        }.padding(.leading, 10)
                        
                        Button("Logout") {
                            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                            UserDefaults.standard.set("", forKey: kFirstName)
                            UserDefaults.standard.set("", forKey: kLastName)
                            UserDefaults.standard.set("", forKey: kEmail)
                            self.presentation.wrappedValue.dismiss()
                            
                        }.buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .fontWeight(.bold)
                            .tint(Color(red: 244/255, green: 206/255, blue: 20/255))
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(8)
                            .padding(.horizontal, 10)
                            .padding(.top, 20)
                        
                        HStack {
                            Button {} label: {
                                Text("Discard Changes")
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.regular)
                            .tint(Color.white)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
                            .padding(.horizontal, 5)
                            
                            Button {} label: {
                                Text("Save Changes")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.regular)
                            .fontWeight(.bold)
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(10).padding(.horizontal, 5)
                            
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    UserProfile()
}
