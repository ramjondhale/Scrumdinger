//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 25/10/23.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var editingScrum: DailyScrum
    @Binding var isPresentingSheet: Bool

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(editingScrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isPresentingSheet = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            isPresentingSheet = false
                        } label: {
                            Text("Done")
                        }
                    }
                }
        }
    }
}

#Preview {
    EditScrumSheet(
        editingScrum: .constant(DailyScrum.sampleData[0]),
        isPresentingSheet: .constant(true))
}
