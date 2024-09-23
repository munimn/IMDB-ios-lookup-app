//
//  SearchReply.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/12/22.
//

import Foundation
struct SearchReply : Codable {
    
    let searchType : String
    let expression : String
    let results : [SearchResult]
    let errorMessage : String
    
    init() {
        searchType = ""
        expression = ""
        results = []
        errorMessage = ""
    }
}
