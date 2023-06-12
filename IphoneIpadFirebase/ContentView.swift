//
//  ContentView.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 21/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View {
        return Group {
            if loginShow.show {
                Home()
                    .edgesIgnoringSafeArea(.all)
                    
            } else {
                Login()
                    .preferredColorScheme(.light)
            }
        }.onAppear{
            if (UserDefaults.standard.object(forKey: "sesion")) != nil {
                loginShow.show = true
            }
        }
    }
}


