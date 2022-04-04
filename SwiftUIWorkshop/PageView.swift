//
//  PageView.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/04.
//

import SwiftUI

struct PageView: View {
    @State var selectedIndex: Int = 0
    
    func setPageIndex(index: Int) -> some View {
        print("\(index) in PageView")
        self.selectedIndex = index
        return self.body
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollValue in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                        Spacer()
                        MapView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .id(0)
                        MyPageView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .id(1)
                    }
                    .onChange(of: self.selectedIndex == 0) { _ in
                        withAnimation{
                            scrollValue.scrollTo(self.selectedIndex)
                        }
                    }
                }
            }
        }
    }
}
