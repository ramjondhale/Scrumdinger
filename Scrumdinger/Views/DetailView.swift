//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum

    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundStyle(Color.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
            } header: {
                Text("Meeting Info")
            }
            Section {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            } header: {
                Text("Attendees")
            }

        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button(action: {
                isPresentingEditView = true
                editingScrum = scrum
            }, label: {
                Text("Edit")
            })
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button {
                                isPresentingEditView = false
                            } label: {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button {
                                isPresentingEditView = false
                                scrum = editingScrum
                            } label: {
                                Text("Done")
                            }
                        }
                    }
            }
        })
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
