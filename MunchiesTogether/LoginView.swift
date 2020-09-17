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
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}
