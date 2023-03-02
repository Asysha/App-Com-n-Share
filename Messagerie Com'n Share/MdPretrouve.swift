//
//  Recup de mot de passe2.swift
//  Recup de mot de passe1
//
//  Created by Makabu on 05/08/2021.
//

import SwiftUI

struct Recup_de_mot_de_passe2: View {
   @State private var motdepasse = ""
    @State private var confirmationdumotdepasse = ""

        
    
    var body: some View {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Header(titre: "Création d'un nouveau mot de passe")
                VStack {
                    HStack {
                        Text("Mot de passe")
                            .font(.title2)
                            .foregroundColor(Color("txtGray"))
                        Spacer()
                    }.padding()
                    TextField("Mot de passe", text: $motdepasse).padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 2.0)
                                .frame(height: 56.0))
                        .foregroundColor(Color("lightG"))
                        .padding()
                    HStack {
                        Text("Confirmer le mot de passe")
                            .font(.title2)
                            .foregroundColor(Color("txtGray"))
                        Spacer()
                    }.padding()
                    TextField("Confirmation du mot de passe", text: $confirmationdumotdepasse).padding(15)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .stroke(lineWidth: 2.0)
                                        .frame(height: 56.0)
                                        )
                        .foregroundColor(Color("lightG"))
                        .padding(.bottom, 50.0)
                        .padding()
                    NavigationLink(
                        destination: Ecran_final_recup_mot_de_passe().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton()),
                        label: {
                            Text("Enregistrez")
                                .foregroundColor(.white)
                                .font(.title2)
                            .padding()
                            .background(Color("darkO"))
                            .cornerRadius(40)                      })
                    Spacer()
                }
                
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
    }
}

struct Recup_de_mot_de_passe2_Previews: PreviewProvider {
    static var previews: some View {
        Recup_de_mot_de_passe2()
    }
}
