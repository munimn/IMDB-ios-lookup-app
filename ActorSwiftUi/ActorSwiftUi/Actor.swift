//
//  Actor.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import Foundation
struct Actor : Codable, Identifiable ,Hashable {
    let id : String
    let image : String
    let name : String
    let asCharacter : String
    
    init() {
        id = ""
        image = ""
        name = ""
        asCharacter = ""
    }
    
    init(withId id : String) {
        self.id = id
        image = ""
        name = ""
        asCharacter = ""
    }
}
