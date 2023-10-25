//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 25/10/23.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    let skipAction: () -> Void

    /// Current speaker number
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted })  else { return nil }
        return index + 1
    }

    private var speakerText: String {
        guard let speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    /// Check whether current speaker is last speaker
    private var isLastSpeaker: Bool {
        // Return true if all speaker from the speakers array are completed except last one
        speakers.dropLast().reduce(true) { result, speaker in
            result && speaker.isCompleted
        }
    }

    var body: some View {
        VStack {
            HStack{
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction, label: {
                        Image(systemName: "forward.fill")
                    })
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Preview: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
