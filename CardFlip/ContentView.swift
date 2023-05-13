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
    @State var showMenu: Bool = false
    
    @AppStorage("tutorialOn") var tutorialOn: Bool = false
    
    @State private var offset: CGSize = CGSize(width: -UIScreen.screenWidth / 1.5, height: 0)
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        if UIDevice.isIPhone {
            NavigationView{
                ZStack{
                    VStack {
                        TabView(selection: $currentTab) {
                            ForEach(decks.decks, id: \.id) { deste in
                                DeckView(deck: deste, showMenu: $showMenu)
                                    .tag(deste.characterClass)
                                    .environmentObject(decks)
                                    .background(
                                        Image("backgroundimage")
                                            .resizable()
                                            .ignoresSafeArea()
                                    )
                            }
                        }
                        if showMenu == false && tabCheck() {
                            HStack(spacing: 0){
                                ForEach(decks.decks, id: \.id) { deste in
                                    TabButton(image: deste.characterClass)
                                }
                            }
                        }
                    }
                    .frame(width: getRect().width)
                    
                    if !tutorialOn {
                        TutorialView()
                            .ignoresSafeArea()
                    }
                }
            }
            .preferredColorScheme(.light)
            .navigationViewStyle(StackNavigationViewStyle())
            .frame(width: UIScreen.screenWidth)
            
        } else if UIDevice.isIPad {
            NavigationView{
                ZStack{
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.gray)
                        .opacity(0.001)
                        .onTapGesture {
                            if showMenu {
                                ipadMenu()
                            }
                        }
                    HStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 40)
                        ForEach(decks.decks, id: \.id) { deste in
                            iPadDeckView(deck: deste)
                                .environmentObject(decks)
                                .tag(deste.characterClass)
                                .frame(width: UIScreen.screenWidth / 4 - 20)
                        }
                    }
                    .onTapGesture {
                        if showMenu {
                            ipadMenu()
                        }
                    }
                    VStack(alignment: .leading){
                        Button{
                            ipadMenu()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 20, height: 15)
                        }
                        .contentShape(Rectangle().inset(by: -40))
                        .padding(.top, 20)
                        .padding(.leading, 5)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment.topLeading)
                    .padding(.horizontal, 20)
                    
                    iPadSideMenu()
                        .environmentObject(decks)
                        .frame(width: UIScreen.screenWidth / 4)
                        .offset(offset)
                }
                .statusBarHidden(true)
                .background(
                    Image("backgroundimage")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                    )
            }
            .preferredColorScheme(.light)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    func ipadMenu(){
        if showMenu == true {
            withAnimation{
                offset = CGSize(width: -UIScreen.screenWidth / 1.5, height: 0)
            }
        } else {
            withAnimation{
                offset = CGSize(width: -UIScreen.screenWidth / 2.7, height: 0)
            }
        }
        showMenu.toggle()
    }
    
    func tabCheck() -> Bool {
        if decks.decks.count > 1 {
            return true
        } else {
            return false
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
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
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
