//
//  Chargement.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 09/08/2021.
//

import SwiftUI

struct Chargement: View {
    var body: some View {
        ZStack {
            Image("charg").resizable().frame(width: 480, height: 900, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).ignoresSafeArea()
        }
    }
}

struct Chargement_Previews: PreviewProvider {
    static var previews: some View {
        Chargement()
    }
}
