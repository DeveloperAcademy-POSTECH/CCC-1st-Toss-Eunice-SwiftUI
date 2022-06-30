//
//  ContentView.swift
//  CCC-1st-Toss-Eunice
//
//  Created by Hyorim Nam on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
    
//    init(){
//        UITabBar
//            .appearance()
//            .backgroundColor = UIColor.clear
//    }
    
    var body: some View {
//        ZStack(alignment: .bottom) {
            TabView {
                // 탭바 끝에 둥근 마무리 필요 - 탭 바 좀 내리고? 뒤에 배경
                // 아래 pane이 pinned view인 것 필요
                // HomeView()
                // 지금 위치고정 안 됨
                customeTabBarBackground(content: HomeView())
                    //.ignoresSafeArea()
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
    }
}
func customeTabBarBackground<Content: View>(content: Content) -> some View {
    ZStack(alignment: .bottom) {
        content
        RoundedRectangle(cornerRadius: 24)
            .fill(.pink)
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
