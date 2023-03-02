//
//  OfferCreate.swift
//  Com'n Share
//
//  Created by Medi Olivier on 09/08/2021.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit
import Contacts //to be able to reverse geocode the address

var geocoder = CLGeocoder()
let defaultLocation = CLLocationCoordinate2D( //where to init ?
    latitude: 43.587101,
    longitude: 1.493185
)

struct Point: Identifiable {
    var id = UUID()
    var location = CLLocationCoordinate2D()
    var color: Color = .green
}

struct PickerMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {

    }

    func makeCoordinator() -> PickerCoordinator {
        PickerCoordinator(self)
    }

    class PickerCoordinator: NSObject, MKMapViewDelegate {
        var parent: PickerMapView

        init(_ parent: PickerMapView) {
            self.parent = parent
        }
        
        
    }
}

struct LocationPicker: View {
    @State var address: String
    @State var region = MKCoordinateRegion(
        center: defaultLocation,
        span: MKCoordinateSpan(
            latitudeDelta: 1,
            longitudeDelta: 1
        )
    )
    @Binding var selectedLocation: Point
    
    var body: some View {
        VStack {
            HStack {
                TextField("Adresse", text: $address)
                Button(action: {
                    //https://developer.apple.com/documentation/corelocation/clgeocoder
                    geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
                        
                        if let error = error {
                            // TODO
                            print("Geocoding error : \(error)")
                        }else{
                            if let location: CLLocation = placemarks?.first?.location {
                                region.center = location.coordinate
                                selectedLocation = Point(location: location.coordinate)
                            }
                        }
                    })
                }) {
                    Image(systemName: "scope").foregroundColor(Color("darkO"))
                }
            }.padding()
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [selectedLocation]){
                point in
                MapMarker(coordinate: point.location,
                          tint: point.color)
            }/*.onTapGesture {
                
            }.gesture(
                DragGesture().onEnded { _ in
                    geocoder.reverseGeocodeLocation(CLLocation(latitude: region.center.latitude, longitude: region.center.longitude), completionHandler: {(placemarks, error) in
                        
                        if let error = error {
                            // TODO
                            print("Reverse geocoding error : \(error)")
                        }else{
                            print("hello")
                            if let placemark: CLPlacemark = placemarks?.first {
                                
                                if let addr: CNPostalAddress = placemark.postalAddress {
                                    let frmt = CNPostalAddressFormatter()
                                    frmt.style = .mailingAddress
                                    address = frmt.string(from: addr)
                                    print(address)
                                }
                                if let location: CLLocation = placemark.location {
                                    region.center = location.coordinate
                                }
                            }
                        }
                    })
                }
            )*/
        }
    }
}

struct SchedulesPicker: View {
    @Binding var schedules: [DateInterval]
    //@State var update: Bool = false
    let intervalFormatter = DateComponentsFormatter()
    
    init(schedules: Binding<[DateInterval]>) {
        self._schedules = schedules
        intervalFormatter.allowedUnits = [.day, .hour, .minute, .second]
        intervalFormatter.unitsStyle = .abbreviated
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center) {
                ForEach (schedules.indices, id: \.self) { i in
                    VStack {
                        DatePicker("De ", selection: Binding(get: { return schedules[i].start }, set: { v in
                            schedules[i] = (v < schedules[i].end ? DateInterval(start: v, end: schedules[i].end) : DateInterval(start: schedules[i].end, end: v))
                        })).datePickerStyle(CompactDatePickerStyle())
                        DatePicker("à ", selection: Binding(get: { return schedules[i].end }, set: { v in
                            schedules[i] = (v > schedules[i].start ? DateInterval(start: schedules[i].start, end: v) : DateInterval(start: v, end: schedules[i].start))
                        })).datePickerStyle(CompactDatePickerStyle())
                        
                        Text("(\(intervalFormatter.string(from: schedules[i].duration) ?? "?"))")
                        
                        Button(action: {
                            //todo delete current interval from schedules
                            schedules.remove(at: i)
                        }) {
                            Image(systemName: "multiply").resizable().frame(width: 25, height: 25)
                        }
                    }.padding().overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)).padding()
                }
                
                Button(action: {
                    //todo popup interval picker
                    schedules.append(DateInterval(start: Date(), end: Date()))
                    //update.toggle()
                }) {
                    Image(systemName: "plus").resizable().frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct Offer: Identifiable {
    var id = UUID() //? ObjectIdentifier or offer id instead
    
    let authorName: String
    let title: String
    let goodType: Int
    let description: String
    let location: CLLocationCoordinate2D
    let image: Image? = nil
}

struct CreateOfferView: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var offerType: String = ""
    @State var goods: Goods?
    @State var selectedLocation = Point(id: UUID(), location: defaultLocation, color: .green)
    //@State var schedules: [DateInterval]
    
    var body: some View {
        VStack (alignment: .center){
            Group{
                VStack {
                    Rectangle().fill(Color.white).frame(width: 400, height: 40)
                    HStack {
                        Spacer()
                        BackButton()
                        Spacer()
                        Text("Nouvelle Annonce").font(.title).fontWeight(.bold).foregroundColor(Color("txtGray")).frame(height: 30)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink (destination : AnnonceView(annonce: SearchResult.init(donneur: anna, title: title, goodType: 0, description: description, location: defaultLocation, distance: 5.3, image: Image(systemName: "multiply.circle")) ).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton()) ) {
                            Image(systemName: "arrowshape.turn.up.right.circle").resizable().frame(width: 35, height: 35 ).foregroundColor(Color("neonP"))
                        }
                        Spacer()
                    }
                    Divider().frame(width: 400, height: 2).background(Color("darkO"))
                }.background(Color(.white)) //end header
                TextField("Titre", text: $title).font(.title).foregroundColor(Color("txtGray")).multilineTextAlignment(.center).padding(2).overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("lightG"), lineWidth: 1)).padding(2)
                Picker("", selection: $offerType) {
                    Text("Don").tag("offer")
                    Text("Besoin").tag("ask")
                }.pickerStyle(SegmentedPickerStyle())
                VStack {
                    HStack {
                        Text("Description :").font(.title3).foregroundColor(.gray).padding(5)
                        Spacer()
                    }
                    TextEditor(text: $description).font(.body).multilineTextAlignment(.center).frame(height: 150).padding(3).overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("lightG"), lineWidth: 1))
                }.padding(2)
                Picker("Type de bien : \(goods?.name ?? "Cliquez pour selectionner")", selection: $goods) {
                    ForEach(goodsTypes) { g in
                        HStack {
                            Text(g.name)
                            Image(systemName: g.icon)
                        }.frame(height: 20).tag(g)
                    }
                }.pickerStyle(MenuPickerStyle()).accentColor(Color("darkO"))
            }.padding()
            //SchedulesPicker(schedules: $schedules)
            LocationPicker(address: "", selectedLocation: $selectedLocation)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
    }
}
struct NvlleAnnonce_Previews: PreviewProvider {
    static var previews: some View {
        CreateOfferView()
    }
}
