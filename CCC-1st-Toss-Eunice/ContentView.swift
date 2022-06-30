//
//  ContentView.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
    @State var isNotifExist: Bool = false
    
    var body: some View {
        NavigationView {
            TabView {
                customeTabBarBackground(content: HomeView())
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("홈")
                    }
                customeTabBarBackground(content: Text("혜택"))
                    .tabItem {
                        Image(systemName: "pentagon.fill")
                        Text("혜택")
                    }
                customeTabBarBackground(content: Text("송금"))
                    .tabItem {
                        Image(systemName: "paperplane.fill")
                        Text("송금")
                    }
                customeTabBarBackground(content: Text("주식"))
                    .tabItem {
                        Image(systemName: "banknote.fill")
                        Text("주식")
                    }
                Text("전체")
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                        Text("전체")
                    }
            }
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                    } label: {
                        // MARK: 애니메이션 추가하기
                        Image(systemName: "message.fill")
                            .rotation3DEffect(.degrees(180), axis: (x:1, y:-1, z:0))
                            .foregroundColor(Color(UIColor.systemGray2))
                        Text("toss")
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "message.fill")
                                .foregroundColor(Color(UIColor.systemGray2))
                        }
                        Button {
                        } label: {
                            if isNotifExist {
                                Image(systemName: "bell.badge.fill")
                                    .foregroundColor(Color(UIColor.systemGray2))
                            } else {
                                Image(systemName: "bell.fill")
                                    .foregroundColor(Color(UIColor.systemGray2))
                            }
                        }
                    }
                }
            }
            .onAppear {
                UITabBar
                    .appearance()
                    .unselectedItemTintColor = UIColor.systemGray5
            }
        }
    }
}

// ref: https://developer.apple.com/forums/thread/649007
func customeTabBarBackground<Content: View>(content: Content) -> some View {
    ZStack(alignment: .bottom) {
        content
        RoundedRectangle(cornerRadius: 24)
            .fill(Color(UIColor.systemBackground), strokeBorder: Color(UIColor.systemGray5))
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: 0)
    }
}

// ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-fill-and-stroke-shapes-at-the-same-time
extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
