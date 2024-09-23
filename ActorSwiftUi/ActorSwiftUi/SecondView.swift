//
//  SecondView.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/12/22.
//

import SwiftUI
struct SecondView: View {
    @StateObject var gateway: gateway
    @State var selected : Actor
    @State var gotomain = false 
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: ThirdView(gateway:gateway), isActive: $gotomain) { EmptyView() }
                Text(gateway.seriesData.title).padding()
                Text(gateway.seriesData.plot).padding()
                
                List {
                    ForEach( self.gateway.seriesData.actorList, id: \.self) { p in
                        HStack{
                            Text(p.name)
                        }.onTapGesture{
                            selected = p
                            self.gateway.selectedactor = selected
                            Task{
                                await gateway.getDetailsActor()
                        }
                            gotomain = true
                        }.listRowBackground(selected == p ? Color.accentColor : Color(UIColor.systemGroupedBackground))
                    }
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(gateway: gateway(), selected : Actor())
    }
}

