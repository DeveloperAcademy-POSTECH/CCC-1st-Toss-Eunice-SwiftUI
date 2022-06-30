//
//  HomeView.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/06/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        ZStack(alignment: .bottom) {
//            TabBarBackGroundView()
            ScrollView {
                LazyVStack(pinnedViews: .sectionHeaders) {
                    ForEach(0...4, id: \.self){ idx in
                        Text("\(idx)")
                            .frame(width: 200, height: 200)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.blue)
                            )
                    }
                    Section(header: Text("headerTest")) {
                        ForEach(0...4, id: \.self){ idx in
                            Text("\(idx)")
                                .frame(width: 200, height: 200)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 16).fill(.green)
                                )
                        }
                    }
                }
            }
            .background(
                Color(.orange)
                .ignoresSafeArea()
                )

        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
