//
//  ContentView.swift
//  Signal users
//
//  Created by Makabu on 09/08/2021.
//

import SwiftUI

struct SignalerUser: View {
    var profile : profile
    var body: some View {
        VStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Header(titre: "Signaler un utilisateur")
                Spacer()
                Spacer()
                HStack {
                    Spacer()
                    Text("Utilisateur : ")
                            .foregroundColor(Color("darkO"))
                        .multilineTextAlignment(.leading)
                        .padding(5)
                    Spacer()
                    profile.pict.resizable().frame(width: 40, height: 40, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color("darkO"), lineWidth: 2))
                    Text(" \(profile.name)")
                        .font(.body).foregroundColor(Color("txtGray")).bold()
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("Pourquoi son comportement est-il inapproprié ?").padding(5).foregroundColor(Color("txtGray")).font(.body)
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        Text("Comportement innaproprié").tag(1)
                        Text("Article impropre a la consommation").tag(2)
                        Text("Non respect du règlement").tag(3)
                        Text("Scam").tag(4)
                        Text("Autre").tag(5)
                    }
                }
                Spacer()
                HStack {
                    Text("Ajouter un commentaire personnel :").padding(10).foregroundColor(Color("txtGray")).font(.body)
                    Spacer()
                }
                TextEditor(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(50)
                    .frame(width: 400.0, height: 200.0)
                    .background(RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 350.0, height: 220.0)
                                    )
                    .foregroundColor(Color("lightG"))
                    .padding()
                NavigationLink(destination : MyProfileView(myProfile: MonProfil).navigationBarHidden(true).navigationBarBackButtonHidden(true)) {
                    Text("Envoyez")
                        .foregroundColor(.white)
                        .font(.title3)
                    .padding()
                    .background(Color("darkO"))
                    .cornerRadius(40)
                }
                
                
                    
                    
                
                
            }
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
    
    }
}
struct ContentView_Previews4: PreviewProvider {
    static var previews: some View {
        SignalerUser(profile: profile.init(name: "Charles M", pict: Image("Charles")))
    }
}
    

