//
//  ImagenFirebase.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 23/2/23.
//

import SwiftUI

struct ImagenFirebase: View {
    
    let imagenAlternativa = UIImage(systemName: "photo")
    @ObservedObject var imageLoader : PortadaViewModel
    
    init(imageUrl: String){
        imageLoader = PortadaViewModel(imagenUrl: imageUrl)
    }
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? imagenAlternativa!)
            .resizable()
            .cornerRadius(20)
            .shadow(radius: 5)
            .aspectRatio(contentMode: .fit)
    }
}


