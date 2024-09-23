//
//  ContentView.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gateway: gateway
    @State var s : String = ""
    @State var selected : SearchResult
    @State var gotomain = false
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: SecondView(gateway:gateway,selected: Actor()), isActive: $gotomain) { EmptyView() }
                HStack {
                    TextField("",text:$s).textFieldStyle(.roundedBorder).disableAutocorrection(true).frame(width:340,height:20,alignment: .trailing).padding().padding()
                }
                HStack {
                    Spacer()
                    Button("Search Series") {
                        Task{
                            await self.gateway.doSeriesSearch(search: s)
                        }
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                    Spacer()
                    Button("Search Movie") {
                        Task{
                            await self.gateway.doMovieSearch(search: s)
                        }
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                }
                List {
                    ForEach(self.gateway.searchresults.results, id: \.self) { p in
                        HStack{
                            Text(p.title)
                            
                        }.onTapGesture{
                            selected = p
                            self.gateway.selectedsearch = selected
                            Task{
                                await gateway.getDetails()
                        }
                            gotomain = true
                        }.listRowBackground(selected == p ? Color.accentColor : Color(UIColor.systemGroupedBackground))
                    }
                }
            }
        }
    }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gateway: gateway(), selected : SearchResult())
    }
}
