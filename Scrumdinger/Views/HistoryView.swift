//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 27/10/23.
//

import SwiftUI

struct HistoryView: View {
    let history: History

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeesString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeesString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Preview: PreviewProvider {

    static var history: History {
        History(attendees: [
            DailyScrum.Attendee(name: "Abhishek"),
            DailyScrum.Attendee(name: "Mukesh"),
            DailyScrum.Attendee(name: "Ram")
        ],
        transcript: "Mukesh, would you like to start today? Sure, yesterday I reviewed Abhishek' PR and met with the design team to finalize the UI...")
    }
    static var previews: some View {
        NavigationStack {
            HistoryView(history: history)
        }
    }
}
