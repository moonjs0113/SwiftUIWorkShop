//
//  MapButtonView.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/04.
//

import SwiftUI

struct MapButton: View {
    let buttonSize: CGFloat = 60
    var imageName: String
    
    init(name: String) {
        self.imageName = name
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
            Button(action: {
                
            }) {
                Image(systemName: self.imageName)
                    .foregroundColor(.black)
            }
        }
        .frame(width: self.buttonSize, height: self.buttonSize)
    }
}

struct MapButtonView: View {
    var body: some View {
        VStack {
            HStack{
                Spacer()
                VStack(spacing: 15) {
                    MapButton(name: "wand.and.rays")
                    MapButton(name: "arkit")
                    MapButton(name: "mappin.and.ellipse")
                }
                .padding([.trailing], 20.0)
                .padding([.top], 40.0)
            }
            Spacer()
        }
    }
}

struct MapButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MapButtonView()
    }
}
