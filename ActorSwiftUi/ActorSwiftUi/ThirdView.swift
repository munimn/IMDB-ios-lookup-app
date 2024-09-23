//
//  ThirdView.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/12/22.
//

import SwiftUI
struct ThirdView: View {
    @StateObject var gateway: gateway
    var body: some View {
        VStack{
            Text(gateway.actorbio.name).padding()
            AsyncImage(url: URL(string: self.gateway.actorbio.image)){ image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }.frame(width: 200, height: 200).padding()
            Text(gateway.actorbio.summary).padding()
            List{
                ForEach( self.gateway.actorbio.knownFor, id: \.self) { p in
                    HStack{
                        Text(p.title)
                        
                    }
                }
            }
        }
    }
}
struct ThirdView_Previews: PreviewProvider {
        static var previews: some View {
            ThirdView(gateway:gateway())
        }
}

