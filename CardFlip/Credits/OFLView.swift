//
//  OFLView.swift
//  CardFlip
//
//  Created by Furkan Eken on 16.04.2023.
//

import SwiftUI

struct OFLView: View {
    @State var fileContents = "bosh"
    
    var body: some View {
        ScrollView{
            Text(oflCheck())
                .padding()
        }.background(Color.gray)
    }
    
    func oflCheck() -> String {
        guard let oflPath = Bundle.main.path(forResource: "OFL", ofType: "txt") else {
            print("OFL.txt not found in main bundle")
            return "Failed to the file."
        }

        guard let oflContent = try? String(contentsOfFile: oflPath, encoding: .utf8) else {
            print("Unable to read contents of OFL.txt")
            return "Failed to convert the file."
        }
        
        return oflContent
    }
}

struct OFLView_Previews: PreviewProvider {
    static var previews: some View {
        OFLView()
    }
}
