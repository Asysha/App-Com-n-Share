//
//  signup.swift
//  Application
//
//  Created by abdouladim on 3/8/2021.
//

import SwiftUI

struct signup: View {
    //Email
    @State private var emaailString  : String = ""
    @State private var textEmail    : String = ""
    @State private var isEmailValid : Bool   = true
    // Prenom
    @State private var NomString  : String = ""
    @State private var textNom    : String = ""
    @State private var isNomValid : Bool   = true
    // Prenom
    @State private var PrenomString  : String = ""
    @State private var textPrenom   : String = ""
    @State private var isPrenomValid : Bool   = true
    //CodePostale
    @State private var CodeString  : String = ""
    @State private var textCode    : String = ""
    @State private var isCodeValid : Bool   = true
    
    
    var body: some View {
            VStack {
                Header(titre: "Inscription")
                ScrollView {
                VStack(alignment: .leading){
                    Group{
                    //Nom
                        Text("Nom")
                            .font(.title2)
                            .foregroundColor(Color("txtGray"))
                        TextField("Nom",  text: $textNom, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if self.textFieldValidatorNomPrenom(self.textNom) {
                                    self.isNomValid = true
                                } else {
                                    self.isNomValid = false
                                    self.textNom = ""
                                }
                            }
                        })
                            .font(.system(size: 20))
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(Color("lightG"))
                            )
                        if !self.isNomValid {
                            Text("Nom incorrect ! ")
                                .font(.callout)
                                .foregroundColor(Color("darkO"))
                        }
                    }
                    Group{
                    //prenom
                    
                    Text("Prénom")
                        .font(.title2)
                        .foregroundColor(Color("txtGray"))
                    TextField("Prénom",  text: $textPrenom, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if self.textFieldValidatorNomPrenom(self.textPrenom) {
                                self.isPrenomValid = true
                            } else {
                                self.isPrenomValid = false
                                self.textPrenom = ""
                            }
                        }
                    })
                        .font(.system(size: 20))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("lightG"))
                        )
                        if !self.isPrenomValid {
                            Text("Prenom incorrect ! ")
                                .font(.callout)
                                .foregroundColor(Color("darkO"))
                        }
                    }
                    Group{
                    //Code postale
                    
                    Text("Code Postal")
                        .font(.title2)
                        .foregroundColor(Color("txtGray"))
                    TextField("31000",  text: $textCode, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if self.textFieldValidatorCodePostale(self.textCode) {
                                self.isCodeValid = true
                            } else {
                                self.isCodeValid = false
                                self.textCode = ""
                            }
                        }
                    })
                        .font(.system(size: 20))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth:  2)
                                .foregroundColor(Color("lightG"))
                        )
                        if !self.isCodeValid {
                            Text("Code incorrect ! ")
                                .font(.callout)
                                .foregroundColor(Color("darkO"))
                        }
                    }
                    Group{
                    //Ville
                    Text("Ville")
                        .font(.title2)
                        .foregroundColor(Color("txtGray"))
                    TextField("Toulouse", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("lightG"))
                        )
                    }
                    Group{
                    //Email
                    Text("Email")
                        .font(.title2)
                        .foregroundColor(Color("txtGray"))
                    TextField("dev@gmail.com", text: $textEmail, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if self.textFieldValidatorEmail(self.textEmail) {
                                self.isEmailValid = true
                            } else {
                                self.isEmailValid = false
                                self.textEmail = ""
                            }
                        }
                    })
                        .font(.system(size: 20))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("lightG"))
                        )
                        if !self.isEmailValid {
                            Text("Email incorrect ! ")
                                .font(.callout)
                                .foregroundColor(Color("darkO"))
                        }
                    }
                    Group{
                    //Telephone
                    Text("Telephone")
                        .font(.title2)
                        .foregroundColor(Color("txtGray"))
                    TextField("06 45 95 54 86", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("lightG"))
                        )
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true).navigationBarHidden(true).navigationBarItems(leading: BackButton()) ) {
                                Text("S'inscrire")
                                    .font(.system(size: 20))
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(Color("darkO"))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                            }
                        Spacer()
                    }.padding(10)
                }
                }.padding().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton())
            }

    }
    //function email
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    //function email
    func textFieldValidatorNomPrenom(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let NomFormat = "[A-Za-z]{2,64}"
        let NomPredicate = NSPredicate(format:"SELF MATCHES %@", NomFormat)
        return NomPredicate.evaluate(with: string)
    }
    
    //function CodePostale
    func textFieldValidatorCodePostale(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let CodeFormat = "[0-9]{2,64}"
        let CodePredicate = NSPredicate(format:"SELF MATCHES %@", CodeFormat)
        return CodePredicate.evaluate(with: string)
    }
}




struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}
