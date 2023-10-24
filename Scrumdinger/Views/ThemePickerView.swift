//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Ram Jondhale on 24/10/23.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme

    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePickerView(selection: .constant(.periwinkle))
}
