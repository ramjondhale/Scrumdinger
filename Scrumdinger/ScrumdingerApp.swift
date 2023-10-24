//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
