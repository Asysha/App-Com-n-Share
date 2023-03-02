//
//  Settings.swift
//  Com'n Share
//
//  Created by Medi Olivier on 06/08/2021.
//

import Foundation
import SwiftUI

struct ExpendableSection: View {
    var title: String
    var section: AnyView
    
    @State var expanded = false
    var body: some View {
        VStack {
            Button(action: { withAnimation { expanded = !expanded } }){
                HStack {
                    Text(title).font(.title2).foregroundColor(Color("neonP"))
                    Spacer()
                    Image(systemName: expanded ? "chevron.down" : "chevron.right").foregroundColor(Color("neonP"))
                }
            }
            if expanded {
                section
                Spacer()
            }
        }
    }
}

struct CheckBox: View {
    @Binding var isChecked: Bool
    var checkedImage = Image(systemName: "checkmark.circle")
    var uncheckedImage = Image(systemName: "circle")
    var body: some View {
        Button(action: {isChecked = !isChecked}){
            if isChecked {
                checkedImage
            }else{
                uncheckedImage
            }
        }
    }
}

struct SettingsView: View {
    @State var darkmode: Bool = false
    var body: some View {
            VStack {
                Header(titre: "Paramètres")
                VStack {
                ExpendableSection(title: "Notifications", section: AnyView(Text("Hello")))
                ExpendableSection(title: "Confidentialité et Sécurité", section: AnyView(Text("Hello")))
                ExpendableSection(title: "Paramètres de l'interface", section: AnyView(HStack {
                        Text("Mode Sombre")
                        Spacer()
                        CheckBox(isChecked: $darkmode, checkedImage: Image(systemName: "moon.stars"), uncheckedImage: Image(systemName: "sun.max"))
                    }))
                ExpendableSection(title: "Accessibilité", section: AnyView(Text("Hello")))
                }.padding()
                Spacer()
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
    }
}

struct SettingsView_preview: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewDevice("iPhone 12")
    }
}

