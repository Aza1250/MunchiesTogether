//
//  LoginView.swift
//  MunchiesTogether
//
//  Created by Aziz on 2020-09-16.
//  Copyright © 2020 Aziz Zaynutdinov. All rights reserved.
//

import SwiftUI
import UIKit

struct LoginView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            LogoView()
        }
    }
}

struct LogoView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            HStack {
                Button(action: {
                    
                    self.index = 0
                    
                }) {

                    Text("Register")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .frame(width: (UIScreen.main.bounds.width - 50)/2)
                    
                }.background(self.index == 0 ? Color.white : Color.clear)
                 .clipShape(Capsule())
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {

                    Text("Login")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .frame(width: (UIScreen.main.bounds.width - 50)/2)
                    
                }.background(self.index == 1 ? Color.white : Color.clear)
                 .clipShape(Capsule())
                
            }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
        }
    }
}
