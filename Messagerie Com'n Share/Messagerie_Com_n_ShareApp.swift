//
//  Messagerie_Com_n_ShareApp.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 03/08/2021.
//

import SwiftUI
import CoreLocation
/*
class Updater : ObservableObject {
    
}*/

@main
struct Messagerie_Com_n_ShareApp: App {
    @State var isConnect : Bool = false
    //@StateObject var update = Updater()
    var body: some Scene {
        WindowGroup {
            Group {
                if !(isConnect) {
                    Connexion(isConnect: $isConnect, mdpCorrect: true)
                }
                else {
                    NavigationView {
                        TabView {
                                    HomeView().navigationBarHidden(true).navigationBarBackButtonHidden(true).tabItem {
                                        Image(systemName: "house").font(.system(size: 50))
                                    }
                                    SearchOfferView().navigationBarHidden(true).navigationBarBackButtonHidden(true).tabItem {
                                        Image(systemName: "magnifyingglass").font(.system(size: 50))
                                    }
                                    BoitedeRecep().navigationBarHidden(true).navigationBarBackButtonHidden(true)
                                        .tabItem {
                                            Image(systemName: "bubble.left.and.bubble.right").font(.system(size: 50))
                                    }.tag(1)
                                    MyProfileView(myProfile : MonProfil).navigationBarHidden(true).navigationBarBackButtonHidden(true).tabItem {
                                        Image(systemName: "face.smiling").font(.system(size: 50))
                                    }
                                }.animation(.easeInOut)
                        .transition(.slide).accentColor(Color("darkO"))
                    }
                }
            }//.environmentObject(update)
            }
            
    }
}
