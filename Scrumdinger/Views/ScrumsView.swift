//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct ScrumsView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView, content: {
                NewScrumSheet(scrums: $scrums, isPresentingSheet: $isPresentingNewScrumView)
            })
            .onChange(of: scenePhase) {
                if scenePhase == .background { saveAction() }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
