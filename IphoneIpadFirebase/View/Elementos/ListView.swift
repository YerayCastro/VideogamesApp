//
//  ListView.swift
//  IphoneIpadFirebase
//
//  Created by Yery Castro on 23/2/23.
//

import SwiftUI

struct ListView: View {
    
    var device = UIDevice.current.userInterfaceIdiom
    @Environment(\.horizontalSizeClass) var width
    
    func getColumns() -> Int{
        return (device == .pad) ? 3 : ((device == .phone && width == .regular) ? 3 : 1)
    }
    var plataforma : String
    @StateObject var datos = FirebaseViewModel()
    @State private var showEditar = false
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: getColumns()), spacing: 20){
                ForEach(datos.datos){ item in
                    CardView(titulo: item.titulo, portada: item.portada,index: item,plataforma: plataforma)
                        .onTapGesture {
                            showEditar.toggle()
                        }.sheet(isPresented: $showEditar, content: {
                            EditarView(plataforma: plataforma , datos: item)
                        })
                        .padding(.all)
                }
            }
        }.onAppear{
            datos.getData(plataforma: plataforma)
        }
    }
}


