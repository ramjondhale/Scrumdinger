//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendee = ""

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePickerView(selection: $scrum.theme)
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
                            .accessibilityLabel("Add attendee")
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
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
