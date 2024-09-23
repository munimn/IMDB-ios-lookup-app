//
//  SearchResult.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//


import Foundation

struct SearchResult : Codable, Identifiable,Hashable {
    let id : String
    let resultType : String
    let image : String
    let title : String
    let description : String
    
    init() {
        id = ""
        resultType = ""
        image = ""
        title = ""
        description = ""
    }
}



