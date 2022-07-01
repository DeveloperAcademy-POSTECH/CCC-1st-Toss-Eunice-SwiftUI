//
//  Style.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/07/01.
//

import SwiftUI

// 필요한가? contentOffset으로 안 되나? -> 필요할 때 트리거 걸기엔 이게 좋을지도?
// ref: https://protocorn93.github.io/tags/PreferenceKey/
// ref: https://www.youtube.com/watch?v=c5JKEU-VI4A
struct ScrollOffsetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = .zero

    static var defaultValue: CGPoint = .zero

//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {

//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TrackableScrollView<Content: View>: View {
    let axes: Axis.Set // 필요한가?
//    let offsetChanged: (CGFloat) -> Void
    let offsetChanged: (CGPoint) -> Void
    let content: Content

//    @State private var locY: CGFloat? = nil

    init(axes: Axis.Set = .vertical,
         offsetChanged: @escaping (CGPoint) -> Void = { _ in },
         @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.offsetChanged = offsetChanged
        self.content = content()
    }

    var body: some View {
        SwiftUI.ScrollView(axes) {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scrollView")).origin)
            }
            .frame(width: 0, height: 0)

            content

        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
    }
}

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
