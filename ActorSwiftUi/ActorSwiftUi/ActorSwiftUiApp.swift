//
//  ActorSwiftUiApp.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import SwiftUI

@main
struct ActorSwiftUiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gateway: gateway(),selected : SearchResult())
        }
    }
}
