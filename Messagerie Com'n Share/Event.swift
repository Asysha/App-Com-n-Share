//
//  Event.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 09/08/2021.
//

import SwiftUI

struct Event: View {
    var event : News
    var body: some View {
            VStack {
                Header(titre: "\(event.title)")
                event.pict.resizable().frame(width: 400, height: 350)
                VStack {
                    ScrollView {
                        Spacer()
                        Text("\(event.content)").font(.body).foregroundColor(Color("txtGray"))
                        Spacer()
                    }
                    Spacer()
                }.frame(width: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                Spacer()
                Spacer()
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
}
}

struct Event_Previews: PreviewProvider {
    static var previews: some View {
        Event(event : News.init(id: 0, title: "Évenement", content: "   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed urna magna. Morbi at euismod odio. Fusce in accumsan dolor. Pellentesque tincidunt urna felis, a ullamcorper lorem fermentum vulputate. Aliquam eu sem ut velit finibus finibus non non est. Maecenas dapibus fermentum luctus. Phasellus varius cursus magna, at commodo enim sollicitudin et. Phasellus blandit diam non nibh dapibus porttitor. Cras pharetra, risus et dignissim aliquet, nulla sapien iaculis nibh, eget auctor neque justo quis libero. Nunc egestas elementum fermentum.", pict: Image("event2")))
    }
}
