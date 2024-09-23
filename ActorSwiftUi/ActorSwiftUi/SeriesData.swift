//
//  SeriesData.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import Foundation
struct SeriesData : Codable {
    let id : String
    let title : String
    let year : String
    let image : String
    let plot : String
    let actorList : [Actor]
    
    init() {
        id = ""
        title = ""
        year = ""
        image = ""
        plot = ""
        actorList = []
    }
}
