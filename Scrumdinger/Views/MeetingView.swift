//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct MeetingView: View {

    @Binding var scrum: DailyScrum

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
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
        .navigationBarTitleDisplayMode(.inline )
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
