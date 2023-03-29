//
//  ContentView.swift
//  CardFlip
//
//  Created by ali cihan saraç on 23.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var decks = Decks()
    
    var body: some View {
        if UIDevice.isIPhone {
            NavigationView{
                TabView {
                    ForEach(decks.decks, id: \.id) { deste in
                        DeckView(deck: deste)
                            .tabItem {
                                Label(deste.characterClass, systemImage: "minus")
                                    .foregroundColor(.white)
                            }
                            .toolbar(decks.decks.count == 1 ? .hidden : .visible, for: .tabBar)
                            .environmentObject(decks)
                            .background(
                                Image("backgroundimage")
                                    .resizable()
                                    .ignoresSafeArea()
                                    
                            )
                    }
                }
//                DeckView()
//                    .environmentObject(decks)
//                    .background(
//                        Image("backgroundimage")
//                            .resizable()
//                            .ignoresSafeArea()
//                    )
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .frame(width: UIScreen.screenWidth)
        } else {
            NavigationView{
                VStack{
                    Button{
                        AppDelegate.orientationLock = UIInterfaceOrientationMask.landscapeRight
                        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                        UIViewController.attemptRotationToDeviceOrientation()
                    } label: {
                        Text("mode")
                    }
//                    HStack{
//                        Divider()
//                        DeckView()
//                            .frame(width: UIScreen.screenWidth / 4 * 0.96)
//                        Divider()
//                        DeckView()
//                            .frame(width: UIScreen.screenWidth / 4 * 0.96)
//                        Divider()
//                        DeckView()
//                            .frame(width: UIScreen.screenWidth / 4 * 0.96)
//                        Divider()
//                        DeckView()
//                            .frame(width: UIScreen.screenWidth / 4 * 0.96)
//                        Divider()
//                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

extension UIDevice {
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
