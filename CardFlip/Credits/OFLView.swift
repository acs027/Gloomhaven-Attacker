//
//  OFLView.swift
//  CardFlip
//
//  Created by Furkan Eken on 16.04.2023.
//

import SwiftUI

struct OFLView: View {
    @State var fileContents = "bosh"
    
    @State var data: String = "sd"
    init() { self.load(file: "OFL") }
    func load(file: String) {
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                DispatchQueue.main.async {
                    self.data = contents
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
    var body: some View {
        Text(data).onAppear{
            fileContents = printLine()
        }
    }
    func printLine() -> String {
        let filename = "OFL.txt"
        var str1: String
        var myCounter: Int
        do {
            let contents = try String(contentsOfFile: filename)
            let lines = contents.split(separator:"\n")
            myCounter = lines.count
            str1 = String(myCounter)
            } catch {
                return (error.localizedDescription)
            }
            return str1
    }
}

struct OFLView_Previews: PreviewProvider {
    static var previews: some View {
        OFLView()
    }
}
