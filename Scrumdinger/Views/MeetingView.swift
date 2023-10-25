//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct MeetingView: View {

    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining, 
                    theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)

                HStack{
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {

                    }, label: {
                        Image(systemName: "forward.fill")
                    })
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline )
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
