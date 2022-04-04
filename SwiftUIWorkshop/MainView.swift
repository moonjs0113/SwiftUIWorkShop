//
//  MainView.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/04.
//

import SwiftUI

struct MainView: View {
    @State public var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            PageView()
                .setPageIndex(index: self.selectedIndex)
                .ignoresSafeArea()
            FloatingTabBar(selectedIndex: self.$selectedIndex)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
