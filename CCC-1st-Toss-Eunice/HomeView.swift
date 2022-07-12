//
//  HomeView.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/06/30.
//

import SwiftUI

struct HomeView: View {
    @State var isClipboardExist: Bool = false
    @State var scaleFlag: Bool = false

    var body: some View {
            ScrollView {
                // 바꿀 예정
                LazyVStack(pinnedViews: .sectionFooters) {
                    ListHeader()
                        .background(BGBox())
                        .padding(.horizontal)
                    Section(
                        footer: ListHeader()
                            .background(BGBox())
                            .padding(.horizontal)
                            .scaleEffect(1.1)
                            .animation(.default, value: scaleFlag)
                    ) {
                        VStack {
                            ListHeader()
                                .background(BGBox())
                            ForEach(0...2, id: \.self) { _ in
                                ListItem()
                            }
                            Divider()
                                .padding()
                            ForEach(3...4, id: \.self) { _ in
                                ListItem()
                            }
                        }
                        .background(BGBox())
                        .padding(.horizontal)
                    }
                    Section {
                        VStack {
                            ListItem()
                            Divider()
                                .padding()
                            ListItem()
                        }
                        .background(BGBox())
                        .padding(.horizontal)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0...3, id: \.self) { _ in
                            CardView()
                                .frame(width: UIScreen.main.bounds.width * 0.4)
                        }
                    }
                }
                .padding(.horizontal)
                HStack {
                    Button("금액 숨기기", action: {})
                        .foregroundColor(Color(uiColor: .systemGray))
                    Divider()
                    Button("자산 추가", action: {})
                        .foregroundColor(Color(uiColor: .systemGray))
                }
                .padding()
                .padding(.bottom)
            }
            .background(
                Color(uiColor: .systemGray6
                    .withAlphaComponent(0.8)
                )
                .ignoresSafeArea()
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
