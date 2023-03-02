//
//  Ecran final recup mot de passe.swift
//  Recup de mot de passe1
//
//  Created by Makabu on 09/08/2021.
//

import SwiftUI

struct Ecran_final_recup_mot_de_passe: View {
    @State var isConnect : Bool = false
    var body: some View {
            VStack {
                Header(titre: "Création d'un nouveau mot de passe")
                Spacer()
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Text("\(Image(systemName: "sparkles"))")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color("darkO"))
                        .multilineTextAlignment(.center)
                    Text("Votre nouveau mot de passe a bien été enregistré.")
                            .font(.title)
                            .padding(45)
                            .foregroundColor(Color("darkO"))
                        .multilineTextAlignment(.center)
                    Text("\(Image(systemName: "sparkles"))")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color("darkO"))
                        .multilineTextAlignment(.center)
                    NavigationLink(destination : Connexion(isConnect: $isConnect, mdpCorrect: true).navigationBarHidden(true).navigationBarBackButtonHidden(true)) {
                        Text("Retour à la connexion")
                            .foregroundColor(.white)
                            .font(.title3)
                        .padding(15)
                        .background(Color("darkO"))
                        .cornerRadius(50)
                            .padding(40)
                    }
                }
                Spacer()
                Spacer()
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
        
        }
}
        
        
    


struct Ecran_final_recup_mot_de_passe_Previews: PreviewProvider {
    static var previews: some View {
        Ecran_final_recup_mot_de_passe()
    }
}
