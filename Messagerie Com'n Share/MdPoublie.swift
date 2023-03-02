//
//  ContentView.swift
//  Recup de mot de passe1
//
//  Created by Makabu on 03/08/2021.
//
 
import SwiftUI
struct MDPoublie: View{
    
    @State var adressemail : String = ""
    @State var isValid = false
    
    func isadressemailvalid(){
        if self.adressemail.count > 7 {
        self.isValid = true
        }else{
            self.isValid = false
            print("l'adresse mail n'est pas valide")
        }
    }
    
    var body: some View{
        ZStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            {
    
                Header(titre : "Mot de passe oublié ?")
                HStack {
                    Text("Entrer votre adresse mail :")
                        .font(.title2)
                        .padding()
                        .foregroundColor(Color("txtGray"))
                    Spacer()
                }
            
            TextField("machin@gmail.com", text: $adressemail)
                .padding()
                .cornerRadius(2)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("lightG"))
                    .padding()
         )
                    NavigationLink(
                        destination: Recup_de_mot_de_passe2().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton()),
                        label: {
                            Text("Suivant")
                                .foregroundColor(.white)
                                .font(.title3)
                            .padding(15)
                            .background(Color("darkO"))
                            .cornerRadius(50)                              })
                            
                
            Spacer()
            Spacer()
                
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
        
        }
    }

            
        
                    
                
                  
                
        
            
            
                
            
                
            
                
            
            
                
            
        }
    


struct ContentView_Previews12345: PreviewProvider {
    static var previews: some View {
        MDPoublie()
    }
}

