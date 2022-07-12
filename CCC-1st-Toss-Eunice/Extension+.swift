//
//  Style.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/07/01.
//

import SwiftUI

// ref: https://github.com/Asperi-Demo/4SwiftUI/blob/master/Answers/Extend_builtIn_button_style.md

struct CustomButtonStyle: PrimitiveButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button(configuration)
            .buttonStyle(.bordered)
            .font(.headline)
            .foregroundColor(Color(uiColor: .systemGray))
            .background(
                Color(uiColor: .systemGray6)
                    .opacity(0.01)
            )
    }
}

extension PrimitiveButtonStyle where Self == CustomButtonStyle {
    static var custom: CustomButtonStyle {CustomButtonStyle()}
}
