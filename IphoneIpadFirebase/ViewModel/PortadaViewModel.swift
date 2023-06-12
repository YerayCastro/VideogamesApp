//
//  PortadaViewModel.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 23/2/23.
//

import Foundation
import Firebase
import FirebaseStorage

class PortadaViewModel: ObservableObject {
    
    @Published var data : Data? = nil
    
    init(imagenUrl: String){
        let storeImagen = Storage.storage().reference(forURL: imagenUrl)
        storeImagen.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error?.localizedDescription {
                print("error al traer la imagen", error)
            }else{
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
    }
}
