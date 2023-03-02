//
//  Favoris.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 09/08/2021.
//

import SwiftUI

var annoncesFavorites: [SearchResult] = []

struct Favoris: View {
    var body: some View {
        VStack {
            Header (titre: "Favoris")
            List {
                ForEach (annoncesFavorites) { annonce in
                    NavigationLink(destination : AnnonceView(annonce: annonce).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                        HStack {
                            ZStack {
                                GeometryReader { geo in
                                        annonce.image.resizable().aspectRatio(contentMode: .fit)
                                    ZStack {
                                        Rectangle().fill(idColor(annonce.goodType))
                                        Text("à \(annonce.distance.f("%.1f")) km").foregroundColor(.white).bold()
                                    }.frame(height: 40, alignment: .bottom).offset(y : geo.size.height - 40)
                                    }.frame(width: 150, height : 150)
                                }
                                VStack {
                                    Spacer()
                                    Text(annonce.title).font(.title3).bold().padding().frame(width: 200, height: 50)
                                    Spacer()
                                    Text(annonce.description).font(.body).foregroundColor(.gray).padding().frame(width: 200, height: 100)
                                    Spacer()
                            }
                        }
                    }
                }.onDelete(perform: { indexSet in
                            annonces.remove(atOffsets: indexSet) })
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
        
    }
}

struct Favoris_Previews: PreviewProvider {
    static var previews: some View {
        Favoris()
    }
}
