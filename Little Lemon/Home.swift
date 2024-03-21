//
//  Home.swift
//  Little Lemon
//
//  Created by Roman on 15.03.2024.
//

import SwiftUI

struct Home: View {
    static let persistence = PersistenceController.shared
    
    @State var isLoggedIn = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedIn) {
                EmptyView()
            }
            
            TabView {
                Menu().tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                
                UserProfile().tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                

            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Home()
}
