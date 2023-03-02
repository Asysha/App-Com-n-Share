//
//  ContentView.swift
//  Apps
//
//  Created by Aymen LKH 🔱 on 03/08/2021.
//

import SwiftUI

struct myProfile {
    var isMine : Bool
    var profile : profile
    var CompteC : Bool
    var nbStar : Int
    var descri : String
}
struct MyProfileView : View {
    var myProfile : myProfile
    var DonR : Int = Int.random(in: 0..<80)
    var DonE : Int = Int.random(in: 0..<80)
    var body: some View {
        VStack{
            HStack {
                if myProfile.isMine == true {
                    Spacer()
                    NavigationLink(destination : Favoris().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading : BackButton())) {
                        Image(systemName:"heart")
                            .resizable()
                            .frame(width: 30, height: 27)
                            .foregroundColor(Color("darkO")) }
                    
                    NavigationLink(destination : SettingsView().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading : BackButton())) {
                        Image(systemName:"gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .foregroundColor(Color("neonP")) }
                }
                else {
                    BackButton().padding(20)
                    Spacer()
                }
            }//end HStack top
            HStack{
                Spacer()
                myProfile.profile.pict.resizable().frame(width: 100, height: 100, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color("darkO"), lineWidth: 4))
                Spacer()
                VStack {
                    Text(myProfile.profile.name).font(.largeTitle).bold().foregroundColor(Color("txtGray"))
                    if myProfile.CompteC == true {
                        Text("Compte Certifié")
                        .bold()
                        .foregroundColor(Color("neonP"))
                        .font(.title3).frame(alignment: .bottom)
                    }
                }
                Spacer()
            }
            Spacer()
            ZStack {
                Color("bgGray").ignoresSafeArea()
                VStack{
                    Divider().frame(width: 400, height: 2).background(Color("darkO"))
                    VStack (alignment: .leading){
                        HStack{
                            Spacer()
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("lightY"))
                                .frame(width: 25, height: 25)
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("lightY"))
                                .frame(width: 25, height: 25)
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("lightY"))
                                .frame(width: 25, height: 25)
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("lightY"))
                                .frame(width: 25, height: 25)
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("lightG"))
                                .frame(width: 25, height: 25)
                            Spacer()
                            Spacer()
                            if myProfile.isMine == false {
                                NavigationLink(destination : SignalerUser(profile: myProfile.profile).navigationBarHidden(true).navigationBarBackButtonHidden(true)) {
                                    Image("att").resizable().frame(width : 30, height : 20).foregroundColor(Color("darkO"))
                                    Text("Signaler").underline().foregroundColor(Color("darkO"))}
                            }
                            else {
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            Spacer()

                        }.padding(20)//fin Hstack Etoile
                        
                        Text("Dons reçus :                                \(DonR)")
                            .bold()
                            .foregroundColor(Color("txtGray"))
                            .font(.title3)
                            .padding(10)
                            .frame(alignment : .leading)
                            .offset( x : +25)
                        Text("Dons effectués :                        \(DonE)")
                            .bold()
                            .foregroundColor(Color("txtGray"))
                            .font(.title3).padding(10)
                            .offset( x : +25)
                    }
                    VStack {
                        Text("\(myProfile.descri)").font(.body).foregroundColor(Color("txtGray")).padding()
                        Spacer()
                    }
                }
                Spacer()
                Spacer()
                
                }//Zstack end
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())//Big Vstack end
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        MyProfileView(myProfile: myProfile.init(isMine: true, profile: profile.init(name: "Anna W", pict: Image("Anna")), CompteC: true, nbStar: 4, descri: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
    }
}
