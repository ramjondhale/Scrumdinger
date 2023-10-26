//
//  History.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 25/10/23.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    let attendees: [DailyScrum.Attendee]

    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
