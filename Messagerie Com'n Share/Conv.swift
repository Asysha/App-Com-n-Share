//
//  Conv.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 06/08/2021.
//

import SwiftUI

struct messageConv : Identifiable {
    var id = UUID()
    var content : String
    var expeMe : Bool
}

struct Conv: View {
    var profile : profile
    @State var messages : [messageConv]
    @State var newMess : String
    var body: some View {
        ZStack { //bg
            Color("bgGray").ignoresSafeArea()
            VStack { //header
                VStack {
                    Header(titre: profile.name)
                }
                VStack {
                    ScrollView {
                      ScrollViewReader { value in
                            ForEach (0..<messages.count, id: \.self) { index in
                            if messages[index].expeMe == false {
                                HStack {
                                    profile.pict.resizable().frame(width: 40, height: 40, alignment: .top).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color("darkO"), lineWidth: 2)).frame(alignment: .top).offset( y: +10)
                                    Text("\(messages[index].content)")
                                        .padding(10)
                                        .foregroundColor(.black)
                                        .font(.body)
                                        .background(Color("lightP"))
                                        .cornerRadius(10)
                                    Spacer()
                                }
                            }
                            else {
                                HStack {
                                    Spacer()
                                    Text("\(messages[index].content)")
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .background(Color("neonP"))
                                        .cornerRadius(10)
                                }
                            } //end esle
                            }.onChange(of: messages.count) { _ in value.scrollTo(messages.count - 1)}//end for each
                    }
                        
                    }.frame(width: 370, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                } //end of Vstack (marges)
                Spacer()
                HStack {
                    Spacer()
                    Spacer()
                    TextField("Message", text: $newMess).padding(10)
                        .foregroundColor(.black)
                        .font(.body)
                        .background(Color("lightG"))
                        .cornerRadius(10)
                    Spacer()
                    Button (action: { //ne marche pas !!
                        messages.append(messageConv(content: newMess, expeMe: true))
                        newMess = ""
                        
                    }) {
                        Image(systemName: "paperplane.circle").resizable().frame(width: 40, height: 40, alignment: .center).foregroundColor(Color("darkO"))
                    }
                    Spacer()
                    Spacer()
                }.frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Rectangle().foregroundColor(Color(.white))).padding(10)//end of Hstack textfield
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading : BackButton())//end of ZStack for bg
    }
}


struct ConvPreviews: PreviewProvider {
    static var previews: some View {
        Conv(profile: profile.init(name: "Anna W", pict: Image("Anna")), messages: [messageConv(id: UUID(), content: "dyhciqsns", expeMe: false), messageConv(id: UUID(), content: "vcgbhndj", expeMe: true), messageConv(id: UUID(), content: "qsxdcfvghnj", expeMe: true), messageConv(id: UUID(), content: "xcfgh", expeMe: false), messageConv(id: UUID(), content: "wsxdfghbn", expeMe: true), messageConv(id: UUID(), content: "dplkjhgfdsxcvi", expeMe: false)], newMess: "")
    }
}
