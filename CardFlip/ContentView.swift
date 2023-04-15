//
//  ContentView.swift
//  CardFlip
//
//  Created by ali cihan on 23.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var decks = Decks()
    @State var currentTab = ""
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        if UIDevice.isIPhone {
            NavigationView{
                VStack {
                    TabView(selection: $currentTab) {
                        ForEach(decks.decks, id: \.id) { deste in
                            DeckView(deck: deste)
                                .tag(deste.characterClass)
                            //                            .tabItem {
                            //                                Image(deste.characterClass+"TabIcon")
                            //                                    .renderingMode(.template)
                            //                                Text(deste.characterName)
                            //                            }
                                .environmentObject(decks)
                                .background(
                                    Image("backgroundimage")
                                        .resizable()
                                        .ignoresSafeArea()
                                )
                        }
                    }
                    HStack(spacing: 0){
                        ForEach(decks.decks, id: \.id) { deste in
                            TabButton(image: deste.characterClass)
                        }
                    }
                }
                .frame(width: getRect().width)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .frame(width: UIScreen.screenWidth)
            
        } else {
            NavigationView{
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button{
            withAnimation{currentTab = image}
        } label: {
            Image(image+"TabIcon")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 12)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
