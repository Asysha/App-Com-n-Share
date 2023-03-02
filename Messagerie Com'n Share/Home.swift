//
//  Home.swift
//  Com'n Share
//
//  Created by Medi Olivier on 04/08/2021.
//

import Foundation
import SwiftUI
import MapKit

struct News: Identifiable {
    var id: Int
    let title: String
    let content: String
    let pict : Image
}

extension Double {
    func f(_ format: String) -> String {
        return String(format: format, self)
    }
}

struct HomeNews: View {
    fileprivate var news: [News]
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Actualités").font(.title3).italic().foregroundColor(Color("txtGray"))
                    Spacer()
                }
                ScrollView (.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(news) { new in
                            VStack {
                                NavigationLink(destination : Event(event : new).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                                    new.pict
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .padding()
                                        .aspectRatio(contentMode: .fit)
                            }.frame(width: 150)
                        }
                    }
                }
            }
        }
    }
}
}

struct HomeGoodsSelection: View {
    fileprivate var searchResults: [SearchResult]
    let columns = [GridItem(.fixed(150), spacing: 20), GridItem(.fixed(150), spacing: 20)]
    var body: some View {
            VStack (alignment: .center) {
                HStack {
                    Text("Sélectionné pour vous").font(.title3).italic().foregroundColor(Color("txtGray"))
                    Spacer()
                }
                ScrollView (.vertical, showsIndicators: true) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(searchResults) { r in
                                ZStack {
                                    GeometryReader { geo in
                                        NavigationLink(destination : AnnonceView(annonce: r).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                                            r.image.resizable().aspectRatio(contentMode: .fit)
                                        }
                                        ZStack {
                                            Rectangle().fill(idColor(r.goodType))
                                            Text("à \(r.distance.f("%.1f")) km").foregroundColor(.white).bold()
                                        }.frame(height: 40, alignment: .bottom).offset(y : geo.size.height - 40)
                                    }.frame(width: 150, height : 150)
                                    }
                                    
                            }
                    }
                }
        }
    }
}

struct HomeHeader: View {
    var body: some View {
        VStack {
            HStack {
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(height: 100).offset(x : +20)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                NavigationLink (destination : CreateOfferView()) {
                    Image(systemName: "plus.circle").resizable().frame(width: 30, height: 30, alignment: .center).foregroundColor(Color("darkO"))
                            }
                Spacer()
            }
            Divider().frame(width: 400, height: 2).background(Color("neonP"))
        }
    }
}

struct HomeView: View {
    private var news = events
    
    private var searchResults = annonces
    
    var body: some View {
            VStack (alignment: .leading) {
                GeometryReader { geo in
                //header
                    HomeHeader().frame(height: geo.size.height*0.15)
                    HomeNews(news: news).frame(height: geo.size.height*0.25).offset(y: geo.size.height*0.15).padding(10)
                    HomeGoodsSelection(searchResults: searchResults).frame(height: geo.size.height*0.5).offset(y: geo.size.height*0.4+40).padding(10)
                }
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
    
}
struct Home_preview: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12")
    }
}
