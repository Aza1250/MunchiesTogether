//
//  ContentView.swift
//  MunchiesTogether
//
//  Created by Aziz on 2020-09-14.
//  Copyright © 2020 Aziz Zaynutdinov. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}

//  var mainColor: Color = Color(Color.RGBColorSpace.sRGB, red: 255.0, green: 255.0, blue: 0.0, opacity: 1)

// Make a SwiftUI view
struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Match", subTitle: "Match the gradients by moving the Red, Green and Blue sliders for the left and right colors.", imageName: "slider.horizontal.below.rectangle")
            
            InformationDetailView(title: "Precise", subTitle: "More precision with the steppers to get that 100 score.", imageName: "minus.slash.plus")
            
            InformationDetailView(title: "Score", subTitle: "A detailed score and comparsion of your gradient and the target gradient.", imageName: "checkmark.square")
        }
        .padding(.horizontal)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Image(systemName: "music.note.list")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, alignment: .center)
                .accessibility(hidden: true)
            
            Text("Welcome to")
                .bold()
                .font(.largeTitle)
            
            Text("Gradients Game")
                .foregroundColor(.mainColor)
            .font(.largeTitle)
            .bold()
            
        }
    }
}

struct IntroductionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                Spacer()
                
                TitleView()
                
                InformationContainerView()
                
                Spacer(minLength: 30)
                
                Button(action: {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }) {
                    Text("Continue")
                        .customButton()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor = Color(UIColor.systemIndigo)
}

