//
//  SearchOffers.swift
//  Com'n Share
//
//  Created by Medi Olivier on 03/08/2021.
//

import Foundation
import SwiftUI
import MapKit

// todo move into related struct
let idColor = {(id: Int) -> Color in
    switch id {
        case 0:
            return Color("darkO")
        case 1: 
            return Color("lightY")
        case 2:
            return Color("neonP")
        case 3:
            return Color("blue")
        default:
            return Color.gray
    }
}

struct Goods: Identifiable, Hashable, Decodable {
    var id: Int
    let name: String
    let icon: String
    //let color: Color
}

let goodsTypes : [Goods] = [
    Goods(id: 0, name: "Alimentation", icon: "fork"),
    Goods(id: 1, name: "Textile", icon: "shirt"),
    Goods(id: 2, name: "Hygiène", icon: "hand"),
    Goods(id: 3, name: "Autre", icon: "other")]


struct GoodsTypesSelector: View {
    @Binding fileprivate var goodsTypeSelection: Set<Goods>
    
    var body: some View {
        VStack {
            Text("Catégories :").font(.title2)
            List {
                    ForEach(goodsTypes) {
                        goodsType in
                        Button {
                            if goodsTypeSelection.contains(goodsType) {
                                goodsTypeSelection.remove(goodsType)
                            }else{
                                goodsTypeSelection.update(with: goodsType)
                            }
                        }
                            label: {
                                HStack {
                                    if goodsTypeSelection.contains(goodsType) {
                                        Image(systemName: "checkmark.circle")
                                    }else{
                                        Image(systemName: "circle")
                                    }
                                    Group {
                                        Image(goodsType.icon).resizable().frame(width: 25, height: 25)
                                        Text(goodsType.name)
                                    }.foregroundColor(idColor(goodsType.id))
                                }
                        }
                    }
            }
        }
    }
}


struct SearchFiltersBurgerMenu: View {
    @Binding var maxDist: Double
    @Binding var goodsTypesSelected: Set<Goods>
    @Binding var showOffers: Bool
    @Binding var showAsks: Bool
    
    var body: some View {
        VStack (alignment: .center) {
            Spacer(minLength: 20)
            Text("Filtres").font(.title).foregroundColor(Color("darkO")).bold()
            Spacer(minLength: 30)
            Text("Types d'annonces :").font(.title2)
            //Spacer()
            List {
                HStack {
                    CheckBox(isChecked: $showOffers)
                    Text("Offres").foregroundColor(Color("txtGray"))
                }
                HStack {
                    CheckBox(isChecked: $showAsks)
                    Text("Demandes").foregroundColor(Color("txtGray"))
                }
            }
            //Spacer(minLength: 20)
            GoodsTypesSelector(goodsTypeSelection: $goodsTypesSelected)
            Spacer()
            //Text("Allergènes").font(.title2)
        }.background(Color.white)
    }
}

struct SearchResult: Identifiable {
    var id = UUID() //? ObjectIdentifier or offer id instead
    
    let donneur : profile
    let title: String
    let goodType: Int
    let description: String
    let location: CLLocationCoordinate2D
    let distance: Double
    let image: Image
}

class MapGoodsAnnotation: MKPointAnnotation {
    /*let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D*/
    let color: Color
    let image: UIImage?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, color: Color = .red, image: UIImage? = nil) {
        self.image = image
        self.color = color
        super.init()
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }
}

struct SearchOfferView: View {
    @State private var listView = false
    @State private var textQuery: String = ""
    
    @State private var singleSelection : UUID?
    
    @State private var moreFilters : Bool = false
    
    @State private var centerLocation = CLLocationCoordinate2D(latitude: 43.604652, longitude: 1.444209)
    
    @State private var showOffers: Bool = false
    @State private var showAsks: Bool = false
    
    @State private var maxDist: Double = 5.0
    @State private var goodsTypesSelected = Set<Goods>()
    
    @State private var slideOffset: CGFloat = 0
    
    @State var searchResults = annonces
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    TextField("Rechercher ...", text: $textQuery).padding(10)
                        .foregroundColor(.black)
                        .font(.body)
                        .background(Color("lightG"))
                        .cornerRadius(10)
                    Spacer()
                    Spacer()
                    Button (action: { //ne marche pas !!
                        print("")//pas de base de données ehe
                    }) {
                        Image(systemName: "magnifyingglass.circle").resizable().frame(width: 40, height: 40, alignment: .center).foregroundColor(Color("darkO"))
                    }
                    Spacer()
                    Spacer()
                }.frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Rectangle().foregroundColor(Color(.white)))//end of Hstack textfield
                VStack (alignment: .trailing) {
                    Button(action: {withAnimation { moreFilters = !moreFilters }}, label: {
                        Text("Filtres").foregroundColor(Color("darkO")).font(.title3)
                        if !moreFilters {
                            Image(systemName: "chevron.left").foregroundColor(Color("darkO"))
                        }else{
                            Image(systemName: "chevron.right").foregroundColor(Color("darkO"))
                        }
                    })
                    
                    HStack {
                        Text("Distance :")
                        Slider(value: $maxDist, in: 1...30).accentColor(Color("neonP"))
                        Text("Max : \(maxDist.f("%.1f"))km")
                    }
                    
                    Picker(selection: $listView, label: Text("Resultats")) {
                                    Text("Carte").tag(false)
                                    Text("Liste").tag(true)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                    
                }.padding()
                
                if listView {
                    List(selection: $singleSelection){
                        ForEach(searchResults) { r in
                            HStack {
                                NavigationLink (destination : AnnonceView(annonce: r).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())) {
                                    ZStack {
                                        GeometryReader { geo in
                                            r.image.resizable().aspectRatio(contentMode: .fit)
                                            ZStack {
                                                Rectangle().fill(idColor(r.goodType))
                                                Text("à \(r.distance.f("%.1f")) km").foregroundColor(.white).bold()
                                            }.frame(height: 40, alignment: .bottom).offset(y : geo.size.height - 40)
                                        }.frame(width: 150, height : 150)
                                        }
                                        VStack {
                                            Spacer()
                                            Text(r.title).font(.title3).bold().padding().frame(width: 200, height: 50)
                                            Spacer()
                                            Text(r.description).font(.body).foregroundColor(.gray).padding().frame(width: 200, height: 100)
                                            Spacer()
                                        }
                                }
                        }
                        }
                    }
                }else{
                    MapView(centerCoordinate: $centerLocation, circleSize: $maxDist, annotations: searchResults.map({
                        r in
                        return MapGoodsAnnotation(title: r.title, subtitle: r.description, coordinate: r.location, color: idColor(r.goodType), image: UIImage(named: goodsTypes[r.goodType].icon))
                    })
                    ).ignoresSafeArea() //(region: $region, circleSize: $maxDist, searchResults: $searchResults)
                                    
                }
            }
            if moreFilters {
                Color.black.opacity(0.5).onTapGesture {
                    withAnimation { moreFilters = false }
                }.ignoresSafeArea()
                GeometryReader { geo in
                    HStack {
                    SearchFiltersBurgerMenu(maxDist: $maxDist, goodsTypesSelected: $goodsTypesSelected, showOffers: $showOffers, showAsks: $showAsks).cornerRadius(10).frame(width: geo.size.width/3*2, alignment: .leading)
                        Color.white.frame(width: geo.size.width*2).offset(x: -15).zIndex(-1)
                    }.offset(x: geo.size.width/3+slideOffset)
                }.transition(.move(edge: .trailing))
                
            }
        }.gesture(
            DragGesture()
                .onChanged { gesture in
                    slideOffset = gesture.translation.width
                }
                .onEnded { _ in
                    if slideOffset > 100 {
                        slideOffset = 0
                        moreFilters = false
                    } else if slideOffset < -100 {
                        slideOffset = 0
                        moreFilters = true
                    } else {
                        slideOffset = 0
                    }
                }
        ).navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}



struct SearchOffers_preview: PreviewProvider {
    static var previews: some View {
        SearchOfferView()
            .previewDevice("iPhone 12")
    }
}
