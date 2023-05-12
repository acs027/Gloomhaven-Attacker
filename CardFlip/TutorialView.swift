//
//  TutorialView.swift
//  CardFlip
//
//  Created by Furkan Eken on 12.05.2023.
//

import SwiftUI

struct TutorialView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("tutorialOn") var tutorialOn: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(.black)
                .opacity(0.65)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                Group{
                    Text("Welcome to Gloomhaven Attacker")
                        .font(.largeTitle)
                    Text("You can access the options by sliding to the right, have fun!")
                        .font(.title2)
                }
                .foregroundColor(.white)
                .padding(10)
                .multilineTextAlignment(.center)
                
                Button{
                        tutorialOn = true
                } label: {
                    Text("I Understand")
                }
            }
        }
    }
}
