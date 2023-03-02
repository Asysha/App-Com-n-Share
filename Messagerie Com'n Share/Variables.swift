//
//  Variables.swift
//  Messagerie Com'n Share
//
//  Created by Marie Cassou on 10/08/2021.
//

import Foundation
import SwiftUI
import CoreLocation

//profile
let charles : profile = profile.init(name: "Charles F", pict: Image("Charles"))
let epicier : profile = profile.init(name: "Épicerie Chez Simone", pict: Image("Store"))
let cafe : profile = profile.init(name: "Café Au coin de la rue", pict: Image("Cafe"))
let clem : profile = profile.init(name: "Clémence M", pict: Image("Clem"))
let anna : profile = profile.init(name: "Anna W", pict: Image("Anna"))
let magasin : profile = profile.init(name: "Magasin Sapin", pict: Image("Store2"))

//page profile
let MonProfil : myProfile = myProfile.init(isMine: true, profile: anna, CompteC: true, nbStar: 4, descri: "Hello, je suis Anna, j'ai 26 ans et je travaille chez Yves Rochers. Mon emploi fait que j'ai régulièrement accès à des petits stocks de produits d'hygiène et de beauté, j'aimerai en faire profiter le plus de personnes possible.")
let charlesP : myProfile = myProfile.init(isMine: false, profile: charles, CompteC: false, nbStar: 4, descri: "Salut, je m’appelle Charles et je déménage, voilà pourquoi je me suis inscrit ici. Je pars en avion et débarrasse mon appart, plein de choses à recup' ici !")
let epicierP : myProfile = myProfile.init(isMine: false, profile: epicier, CompteC: true, nbStar: 4, descri: "Bonjour, nous sommes une épicerie de quartier, avec pour vocation de venir en aide aux riverains dans le pétrin et de ne pas gaspiller, c'est pour cela que nous proposons nos invendus gratuitement pour les personnes dans le besoin. Bienvenu chez Simone !")
let clemP : myProfile = myProfile.init(isMine: false, profile: clem, CompteC: false, nbStar: 4, descri: "Coucou, ici Clémence, qui travaille dans un hôtel qui consomme beaucoup de produits à l'unité, dont certains sont jétés alors que scéllés. Comptez sur moi pour vous les donner !")
let cafeP : myProfile = myProfile.init(isMine: false, profile: cafe, CompteC: true, nbStar: 4, descri: "Salut à tous, nous sommes un café mais aussi un lieu de rencontre universel, et avec ou sans argent, vous pouvez venir chez nous pour échanger, un café, des idées et plus encore. Voila pourquoi nous mettons à disposition un systéme de café suspendu, qui permet à tous de venir prendre un café, avec ou sans moyen ☕️ !")
let magasinP : myProfile = myProfile.init(isMine: false, profile: magasin, CompteC: false, nbStar: 4, descri: "Bonjour, je m’appelle Raphaël, j’ai 24 ans et je travaille dans cette superette depuis maintenant 3ans et demi. J’apprécie travailler dans là-bas, et surtout je peux profiter et faire profiter des surplus et invendus autour de moi.")

//annonce = search result
var gel : SearchResult = SearchResult.init(donneur : magasin, title : "Gels douche", goodType: 2, description: "Échantillons d'une nouvelle gamme offerts par un fournisseur, venez les récuperer.", location : CLLocationCoordinate2D(latitude: 43.617307, longitude: 1.445284), distance: 0.7, image: Image("gel"))
var denti : SearchResult = SearchResult.init(donneur: epicier, title: "Dentifrices en tubes", goodType: 2, description: "Les emballages ont été abimés donc ils sont invendables, venez les récuperer.", location: CLLocationCoordinate2D(latitude: 43.583055, longitude: 1.458502), distance: 0.7, image: Image("denti"))
var pates : SearchResult = SearchResult.init(donneur: charles, title: "Paquets de pâtes", goodType: 0, description: "Je démènage donc je me débarasse des certaines denrées, dont plusieurs paquets de pâtes.", location: CLLocationCoordinate2D(latitude: 43.593259, longitude: 1.424856), distance: 0.7, image: Image("pates"))
var towels : SearchResult = SearchResult.init(donneur: clem, title: "Serviettes de toilettes", goodType: 1, description: "Nous changeons les serviettes à l'hotêl où je travaille, donc nous donnons les anciennes.", location: CLLocationCoordinate2D(latitude: 43.559380, longitude: 1.461670), distance: 0.7, image: Image("towels"))
var jus : SearchResult = SearchResult.init(donneur: cafe, title: "Jus de fruits", goodType: 0, description: "Changement de packaging de cette marque : il nous reste du stock en surplus de jus de fruits en bouteille.", location: CLLocationCoordinate2D(latitude: 43.589294, longitude: 1.473171), distance: 0.7, image: Image("jus"))
var pommes : SearchResult = SearchResult.init(donneur: epicier, title: "10kg de pommes", goodType: 0, description: "Ces pommes n'ont pas le bon calibre et ne sont pas commercilisables, venez les récuperer.", location : CLLocationCoordinate2D(latitude: 43.583055, longitude: 1.458502), distance: 0.7, image: Image("pomme"))
var annonces : [SearchResult] = [gel, jus, towels, denti, pates, pommes]


//event
let videD : News = News.init(id : 0, title: "Vide-dressing solidaire", content: "a faire ehe", pict: Image("event1"))
let even : News = News.init(id : 1, title: "Évenement", content: "a faire ehe", pict: Image("event2"))
let destock : News = News.init(id : 2, title: "Destockage", content: "a faire ehe", pict: Image("event3"))
let events : [News] = [videD, even, destock]

//boite de reception
var messagesBDR: [message] = [message(id : UUID(), profile: cafe, content: "Êtes-vous disponible mardi vers 14h ?", read: false), message(id : UUID(), profile: charles, content: "Redez-vous dimanche alors, bonne journée", read: false), message(id : UUID(), profile: epicier, content: "Vous pouvez passer au magasin aux horaires d'ouverture, je vous donnerez les produits", read: true), message(id : UUID(), profile: clem, content: "Desolée mais je ne suis pas disponible à ce moment à cause de mes horaires de travail", read: true)]

//Conv
var messagesConv : [messageConv] =  [messageConv(id: UUID(), content: "Bonjour, je suis interressé par votre annonce !", expeMe: false), messageConv(id: UUID(), content: "Je suis disponible lundi et vous ?", expeMe: false), messageConv(id: UUID(), content: "Moi aussi !", expeMe: true), messageConv(id: UUID(), content: "Vers 18h ?", expeMe: false), messageConv(id: UUID(), content: "Parfait !", expeMe: true), messageConv(id: UUID(), content: "À lundi", expeMe: false)]








