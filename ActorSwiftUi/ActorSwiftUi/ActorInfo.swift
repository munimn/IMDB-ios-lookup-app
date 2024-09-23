//
//  ActorInfo.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import Foundation
struct Role : Codable, Hashable {
    let id : String
    let title : String
    let role : String
    
    init() {
        id = ""
        title = ""
        role = ""
    }
}

struct ActorBio : Codable {
    let id : String
    let name : String
    let image : String
    let summary : String
    let knownFor : [Role]
    
    init() {
        id = ""
        name = ""
        image = ""
        summary = ""
        knownFor = []
    }
}
