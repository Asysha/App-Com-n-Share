//
//  Conv.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 04/08/2021.
//

import SwiftUI
import CoreLocation



struct AnnonceView : View {
    var annonce : SearchResult
    @State var profileV : myProfile = magasinP
    
    init(annonce : SearchResult) {
        self.annonce = annonce
        switch (annonce.donneur) {
            case charles :
                profileV = charlesP
            case cafe :
                profileV = charlesP
            case epicier :
                profileV = epicierP
            case clem :
                profileV = clemP
            case magasin :
                profileV = magasinP
            default :
                profileV = MonProfil
        }
    }
    
    var body: some View {
        VStack {
            HeaderAnn(annonce: annonce, titre: annonce.title, buttonName: ( annoncesFavorites.contains(where: {ann in ann.id == annonce.id}) ? "heart.fill" : "heart" ) )
            annonce.image.resizable().frame(width: 400, height: 350)
            VStack {
                ScrollView {
                    Spacer()
                    HStack {
                        Text("Distance : \(annonce.distance, specifier: "%.1f") km")
                            .font(.title3).foregroundColor(Color("neonP")).bold()
                        Spacer()
                    }
                    Spacer()
                    Text("\(annonce.description)").font(.body).foregroundColor(Color("txtGray"))
                    Spacer()
                }
                HStack {
                    Text("Donné.e.s par  : ")
                        .font(.title3).foregroundColor(Color("darkO")).bold()
                    Spacer()
                    NavigationLink(destination : MyProfileView(myProfile: profileV).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                        annonce.donneur.pict.resizable().frame(width: 40, height: 40, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color("darkO"), lineWidth: 2))
                        Text(" \(annonce.donneur.name)")
                            .font(.body).foregroundColor(Color("txtGray")).bold()
                    }
                    Spacer()
                }
                Spacer()
            }.frame(width: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            Spacer()
            Spacer()
            HStack {
                if (annonce.donneur == MonProfil.profile) {
                    Spacer()
                }
                else {
                    NavigationLink(destination : Conv(profile: annonce.donneur, messages: [], newMess: "").navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                        Text("Contactez le donneur").padding(15)
                            .foregroundColor(.white)
                            .font(.title3)
                            .background(Color("darkO"))
                            .cornerRadius(100)
                            .padding()
                    }
                }
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
        
    }
}
struct HeaderAnn : View { //header
    var annonce : SearchResult
    @State var titre : String
    @State var buttonName : String
    
    var body: some View {
            VStack {
                Rectangle().fill(Color.white).frame(width: 400, height: 40)
                HStack {
                    Spacer()
                    BackButton()
                    Spacer()
                    Text(titre).font(.title).fontWeight(.bold).foregroundColor(Color("txtGray")).frame(height: 30)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button (action: {
                        if !annoncesFavorites.contains(where: {ann in ann.id == annonce.id}) {
                            //add annonce to annoncesFavorites
                            annoncesFavorites.append(annonce)
                            buttonName = "heart.fill"
                        } else {
                            //remove annonce from annoncesFavorites
                            annoncesFavorites.removeAll(where: {ann in ann.id == annonce.id})
                            buttonName = "heart"
                        }
                    }) {
                        Image(systemName: "\(buttonName)").resizable().frame(width: 30, height: 25 ).foregroundColor(Color("neonP"))
                    }
                    Spacer()
                }
                Divider().frame(width: 400, height: 2).background(Color("darkO"))
            }.background(Color(.white)) //end header
    }
}

struct Conv_Previews: PreviewProvider {
    static var previews: some View {
        AnnonceView(annonce : SearchResult(donneur : cafe, title : "Jus de fruit", goodType : 0, description: "Changement de packaging de cette marque : il nous reste du stock en surplus de jus de fruits en bouteille.", location : CLLocationCoordinate2D(latitude : 43.589294, longitude : 1.473171), distance: 0.7, image : Image("jus")))
    }
}
