//
//  IphoneIpadFirebaseApp.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 21/2/23.
//

import SwiftUI

@main
struct IphoneIpadFirebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let login = FirebaseViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
