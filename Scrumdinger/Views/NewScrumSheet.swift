//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 25/10/23.
//

import SwiftUI

struct NewScrumSheet: View {

    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingSheet: Bool
    @State private var newScrum = DailyScrum.emptyScrum

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar(content: {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingSheet = false
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingSheet = false
                        }
                    }
                })
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingSheet: .constant(true))
}
