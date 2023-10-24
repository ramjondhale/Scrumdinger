//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendee = ""

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            } header: {
                Text("Meeting Info")
            }

            Section {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })

                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendee)
                            scrum.attendees.append(attendee)
                            newAttendee = ""
                        }

                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                    .disabled(newAttendee.isEmpty)
                }
            } header: {
                Text("Attendees")
            }


        }
    }
}

#Preview {
    DetailEditView()
}
