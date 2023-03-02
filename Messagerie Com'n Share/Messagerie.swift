//
//  ContentView.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 03/08/2021.
//

import SwiftUI

struct profile : Equatable {
    var name : String
    var pict : Image
}
struct message : Identifiable { //struct des var d'un message
    var id = UUID()
    var profile : profile
    var content : String
    var read : Bool
}

struct BoitedeRecep: View {
    @State var messages = messagesBDR
    var body : some View {
        ZStack { //bg
            Color("bgGray").ignoresSafeArea()
            VStack { //header
                VStack {
                    Rectangle().fill(Color.white).frame(width: 400, height: 40)
                    HStack {
                        Spacer()
                        Spacer()
                        Text("Messagerie").font(.title).fontWeight(.bold).foregroundColor(Color("txtGray")).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Divider().frame(width: 400, height: 2).background(Color("darkO"))
                }.background(Color(.white))
                VStack {
                    if messages.isEmpty {
                        noMessage()
                    }
                    else { //affiche liste de messages
                            List {
                                ForEach (0..<messages.count, id : \.self) { index in
                                    MessageBdR(message : messages[index])
                                }.onDelete(perform: { indexSet in
                                    messages.remove(atOffsets: indexSet)
                                    //messages.remove(at: indexSet.first!)
                                    //messages.removeAll(where: {v in v.id == indexSet.first})
                                    //print("mess : \(messages)")
                                })
                            }.background(Color("bgGray"))
                    }//end else
                }
                Spacer()
            }//end Vsatck
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)//end of ZStack for bg
    }
}

struct noMessage : View { //si boite de recepton vide
    var body: some View {
        VStack {
            Spacer()
            Image("noMessage").resizable().frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Votre messagerie est vide.").font(.body).foregroundColor(.gray)
            Spacer()
            Spacer()
        }//end of VStack
    }
}

struct MessageBdR : View { //affiche 1 seul message
    @State var message : message
    var body: some View {
        ZStack {
            NavigationLink (destination : Conv(profile: message.profile, messages: messagesConv, newMess: "").navigationBarHidden(true).navigationBarBackButtonHidden(true)) {
                }
            HStack {
                message.profile.pict.resizable().frame(width: 40, height: 40, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color("darkO"), lineWidth: 2)).offset( y: -20)
                Spacer()
                VStack (alignment: .leading) {
                    Spacer()
                    Text("\(message.profile.name)").foregroundColor(Color("txtGray")).font(.title3).bold()
                    Spacer()
                    Text("\(message.content)").font(.body).foregroundColor(Color(.gray)).frame(width: 250)
                    Spacer()
                }
                Spacer()
                Spacer()
                if message.read == false {
                    Image(systemName: "circle.fill").resizable().frame(width: 10, height: 10, alignment: .top).foregroundColor(Color("neonP"))
                Spacer()
                Spacer()
                }
                Spacer()
            }.frame(width : 350, height: 100, alignment: .leading)
        }
    }
}

struct BackButton : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            print("active")
           presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward").foregroundColor(.gray)
        }
    }
}
struct Header : View { //header Messagerie
    var titre : String
    var body: some View {
            VStack {
                Rectangle().fill(Color.white).frame(width: 400, height: 40)
                HStack {
                    Spacer()
                    BackButton()
                    Spacer()
                    Text("\(titre)").font(.title).fontWeight(.bold).foregroundColor(Color("txtGray")).multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Divider().frame(width: 400, height: 2).background(Color("darkO"))
            }.background(Color(.white)) //end header
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        BoitedeRecep(messages: [message(id : UUID(), profile: profile.init(name: "Café Coin de la rue", pict: Image("Cafe")), content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", read: false), message(id : UUID(), profile: profile.init(name: "Charles F", pict: Image("Charles")), content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", read: false), message(id : UUID(), profile: profile.init(name: "Épicerie Chez Simone", pict: Image("Store")), content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", read: true), message(id : UUID(), profile: profile.init(name: "Clémence M", pict: Image("Clem")), content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", read: true)])
        
    }
}
