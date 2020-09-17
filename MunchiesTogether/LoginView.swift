//
//  LoginView.swift
//  MunchiesTogether
//
//  Created by Aziz on 2020-09-16.
//  Copyright © 2020 Aziz Zaynutdinov. All rights reserved.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            if UIScreen.main.bounds.height > 800 {
                LogoView()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    LogoView()
                }
            }
            
            
        }
    }
}

struct LogoView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack() {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            
            HStack {
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 0
                    }
                }) {

                    Text("Register")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .frame(width: (UIScreen.main.bounds.width - 50)/2)
                    
                }.background(self.index == 0 ? Color.white : Color.clear)
                 .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 1
                    }
                    
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
            .padding(.top, 20)
            
            if self.index == 1 {
                LoginView()
            } else {
                RegisterView()
            }
            
            Button(action: {
                
            }) {
                
                Text("Forget Password?")
                    .foregroundColor(.white)
                
            }
            .padding(.top, 15)
            
            HStack(spacing: 10) {
                
                Color.white.opacity(0.7)
                    .frame(width: 20, height: 1)
                
                Text("Or")
                    .foregroundColor(.white)
                
                Color.white.opacity(0.7)
                    .frame(width: 20, height: 1)
                
            }
            .padding(.top, 5)
            
            HStack {
                
                Button(action: {
                    
                }) {
                    
                    Image("Google")
                        .renderingMode(.original)
                        .padding()
                }.background(Color.white)
                .clipShape(Circle())
                
                Button(action: {
                    
                }) {
                    
                    Image("Google")
                        .renderingMode(.original)
                        .padding()
                }.background(Color.white)
                .clipShape(Circle())
                .padding(.leading, 25)
                
            }
            .padding(.top, 5)
            
        }
        .padding()
    }
}

struct LoginView : View {
    
    @State var email = ""
    @State var password = ""
    @State var secured = true
    
    var body : some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                ZStack(alignment: .leading) {
                    if email.isEmpty { Text("Enter Your Email").foregroundColor(.black).opacity(0.1) }
                        TextField("", text: $email)
                }.foregroundColor(.black)
            }.padding(.vertical, 10)
            
            
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                    .offset(y: -15)
                ZStack(alignment: .leading) {
                    
                    if self.secured {
                    
                    if password.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                        SecureField("", text: $password)
                    } else {
                        if password.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                            TextField("", text: $password)
                    }
                }
                    .foregroundColor(.black)
                    .frame(height: 65)
                    .offset(y: -15)
                    
                
                
                Button(action: {
                    
                    if secured {
                        secured = false
                    } else {
                        secured = true
                    }
                    
                }) {
                    
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                        .offset(y: -15)
                    
                }

                
                
            }
            
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        //.background(Color.black.opacity(0.1))
        .background(Color.white)
        .cornerRadius(10)
        .padding(.top, 25)
        
        Button(action: {
            
        }) {
            Text("LOGIN")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .frame(height: 50)
        .font(.system(size: 20))
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color1"), Color("Color")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
        .offset(y: -35)
        .padding(.bottom, -40)
        .shadow(radius: 25)
        
        
    }
}

struct RegisterView : View {
    
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @State var secured = true
    @State var resecured = true

    
    var body : some View {
        VStack {
            
            HStack(spacing: 15) {
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                ZStack(alignment: .leading) {
                    if email.isEmpty { Text("Enter Your Email").foregroundColor(.black).opacity(0.1) }
                        TextField("", text: $email)
                }.foregroundColor(.black)
            }.padding(.vertical, 10)
            
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                ZStack(alignment: .leading) {
                    if self.secured {
                    
                    if password.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                        SecureField("", text: $password)
                    } else {
                        if password.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                            TextField("", text: $password)
                    }
                }
                    .foregroundColor(.black)
                    .frame(height: 5)
                
                Button(action: {
                    if secured {
                        secured = false
                    } else {
                        secured = true
                    }
                }) {
                    
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                    
                }

                
                
            }.padding(.vertical, 10)
           
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                    .offset(y: -20)
                ZStack(alignment: .leading) {
                    if self.resecured {
                    
                    if repassword.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                        SecureField("", text: $repassword)
                    } else {
                        if repassword.isEmpty { Text("Enter Your Password").foregroundColor(.black).opacity(0.1) }
                            TextField("", text: $repassword)
                    }
                }
                    .foregroundColor(.black)
                    .frame(height: 35)
                    .offset(y: -20)
                
                Button(action: {
                    if resecured {
                        resecured = false
                    } else {
                        resecured = true
                    }
                }) {
                    
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                        .offset(y: -20)
                    
                }

                
                
            }.padding(.vertical, 20)
            
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        //.background(Color.black.opacity(0.1))
        .background(Color.white)
        .cornerRadius(10)
        .padding(.top, 25)
        
        Button(action: {
            
        }) {
            Text("REGISTER")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .frame(height: 60)
        .font(.system(size: 20))
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color1"), Color("Color")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
        .offset(y: -45)
        .padding(.bottom, -40)
        .shadow(radius: 25)
        
        
    }
}
