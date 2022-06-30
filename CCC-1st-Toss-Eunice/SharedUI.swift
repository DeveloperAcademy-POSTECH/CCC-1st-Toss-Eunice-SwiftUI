//
//  SharedUI.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/07/01.
//

import SwiftUI

struct ListHeader: View {
    var body: some View {
        HStack {
            Text("헤더")
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink(">", destination: TestSubView())
        }
        .padding()
    }
}

struct ListItem: View {
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Text("----- 통장")
                    .font(.body)
                    .foregroundColor(Color(uiColor: .systemGray))
                    .lineLimit(2)
                Text("\(1_000_000)원")
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                    .fixedSize()
                //                    .frame(maxWidth: .infinity)
            }
            Spacer()
            Button("테슷", action: {}).buttonStyle(.custom)
        }
        .padding()
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("1분 만에")
                .font(.body)
                .foregroundColor(Color(uiColor: .systemGray5))
            Text("내 보험\n전부 조회")
                .font(.title3)
                .bold()
                .lineLimit(2)
                .fixedSize()
            HStack {
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
            }
        }
        .padding()
        .background(BGBox())
    }
}

struct BGBox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(UIColor.systemBackground))
    }
}

struct SharedUI_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack {
                ListHeader()
                    .background(BGBox())
                    .padding()
                
                VStack {
                    ListHeader()
                    ListItem()
                    ListItem()
                }
                .background(BGBox())
                .padding()
                ScrollView(.horizontal){
                    HStack {
                        CardView()
                        CardView()
                        CardView()
                        CardView()
                    }
                }
            }
        }
    }
}
