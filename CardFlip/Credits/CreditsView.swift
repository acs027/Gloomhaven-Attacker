//
//  CreditsView.swift
//  CardFlip
//
//  Created by Furkan Eken on 16.04.2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
            }
            Text("Developed by Furkan Eken and Ali Cihan Saraç.")
            HStack{
                Text("The code is available on")
                Link(destination: URL(string: "https://github.com/acs027/Gloomhaven-Attacker")!) {
                    Text("Github")
                        .foregroundColor(.blue)
                        .underline()
                }
            }
            NavigationLink(destination: OFLView()){
                Text("Font Licence")
            }.padding()
            
            Text("All Gloomhaven images and content are trademarks and copyrights of Cephalofair Games®.")
                .padding()
            Image("cgameslogo")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Spacer()
        }.background(Color.gray)
    }
}




struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
