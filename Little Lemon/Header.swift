//
//  Header.swift
//  Little Lemon
//
//  Created by Roman on 19.03.2024.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Logo")
                    
                    HStack {
                        Spacer()
                        if isLoggedIn {
                            NavigationLink(destination: UserProfile()) {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 45)
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 50)
        .padding(.bottom)
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    Header()
}
