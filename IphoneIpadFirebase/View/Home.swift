//
//  Home.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 21/2/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct Home: View {
    @State private var index = "Playstation"
    @State private var menu = false
    @State private var widthMenu = UIScreen.main.bounds.width
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    
    
    var body: some View {
        ZStack{
            VStack{
                NavBar(index: $index, menu: $menu)
                ZStack{
                    if index == "Playstation" {
                       ListView(plataforma: "playstation")
                    }else if index == "Xbox" {
                        VStack{
                            ListView(plataforma: "xbox")
                        }
                    }else if index == "Nintendo" {
                        VStack{
                            ListView(plataforma: "nintendo")
                        }
                    } else {
                        AddView()
                    }
                }
            }
            // Termina navbar ipad
            if menu {
                HStack{
                    Spacer()
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    menu.toggle()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }.padding()
                            .padding(.top, 50)
                        VStack(alignment: .trailing){
                            ButtonView(index: $index, menu: $menu, title: "Playstation")
                            ButtonView(index: $index, menu: $menu, title: "Xbox")
                            ButtonView(index: $index, menu: $menu, title: "Nintendo")
                            Button(action:{
                                try! Auth.auth().signOut()
                                UserDefaults.standard.removeObject(forKey: "sesion")
                                loginShow.show = false
                            }){
                                Text("Salir")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        Spacer()
                    }
                    .frame(width: widthMenu - 200)
                    .background(Color.purple)
                }
            }
        }.background(Color("fondo"))
    }
}

