//
//  ContentView.swift
//  Application
//
//  Created by abdouladim on 3/8/2021.
//

import SwiftUI

struct Connexion: View {
    @Binding var isConnect : Bool
    @State private var Username  : String = ""
    @State private var Password  : String = ""
    @State var mdpCorrect : Bool
    var body: some View {
        NavigationView {
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .padding(20)
                
                
                TextField("Identifiant", text: $Username)
                    .font(.system(size: 20))
                    .padding(.leading, 15.0)
                    .frame(width: 330, height: 60, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color("lightG"))
                    ).padding(15)
                
                
                SecureField("Mot de passe", text: $Password)
                    .font(.system(size: 20))
                    .padding(.leading, 15.0)
                    .frame(width: 330, height: 60, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color("lightG"))
                    )
                Spacer()
                if mdpCorrect == false {
                    Text("Mot de passe ou identifiant incorrect")
                }
                //NavigationLink(destination: (((Username == "Swift") && (Password == "123456")) ? AnyView(HomeView().navigationBarBackButtonHidden(true).navigationBarHidden(true)) : AnyView(Connexion(mdpCorrect: false).navigationBarBackButtonHidden(true).navigationBarHidden(true)))) {
                Button (action : { if ((Username == "Swift") && (Password == "123456")) { isConnect.toggle()} else {mdpCorrect = false} } ) {
                    Text("Se connecter")
                        .font(.system(size: 20))
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color("darkO"))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }.padding(5)
                
                NavigationLink (destination : signup().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                    Text("S'inscrire")
                        .font(.system(size: 20))
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(Color("neonP"))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("neonP")))
                        .padding(15)
                }
                
                NavigationLink(destination : MDPoublie().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                    Text("Mot de passe oublié ?").underline()
                        .font(.body).foregroundColor(Color("txtGray"))
                }.padding(15)
                
                Spacer()
                
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }
    }
}

