//
//  TestSubView.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/07/01.
//

import SwiftUI

struct TestSubView: View {
    var body: some View {
        ZStack {
            Color.pink
            Text("TestSubView")
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

struct TestSubView_Previews: PreviewProvider {
    static var previews: some View {
        TestSubView()
    }
}
