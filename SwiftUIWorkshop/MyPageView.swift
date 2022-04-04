//
//  MyPageView.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/04.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            Text("마이페이지")
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
