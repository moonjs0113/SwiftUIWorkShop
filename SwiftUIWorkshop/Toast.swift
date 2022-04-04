//
//  Toast.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/01.
//

import SwiftUI

struct MakeToast: View {
    @State var showAlert = false
    @State var isOn: Bool = true
    @State var stepperValue = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Toast")
                .font(.title)
                .padding()
            VStack {
                HStack {
                    Text("핫소스 추가")
                    Toggle("", isOn: self.$isOn)
                }
                HStack {
                    Text("아보카도 추가")
                    Toggle("", isOn: self.$isOn)
                }
                HStack {
                    Text("수량")
                    Stepper("", value: self.$stepperValue, in: 0...10, step: 1)
                }
            }
            Button("주문하기") {
                self.showAlert.toggle()
            }.alert(isPresented: self.$showAlert) {
                Alert(title: Text("OK"), message: Text("먹나요?"), dismissButton: .cancel())
            }
        }
        .padding()
    }
}

struct ListView: View {
    @State var stepperValue = 1
    @State var sliderValue = 0.0
    
    var body: some View {
        List {
            Section {
                Group {
                    Text("Group in Section")
                    
                    Stepper("", value: self.$stepperValue, in: 0...10, step: 1)
                }
                ForEach(4..<7) { index in
                    Text("Group, world #\(index)")
                }
                Section {
                    
                    Text("Section in Section with padding").padding()
                    
                }
            }
            Group {
                Group {
                    Text("Group in Group #1").padding()
                }
                Section {
                    Button("주문하기") { }
//                    MakeToast()
                    Text("Section in Group #1 without padding()")
                    Slider(value: self.$sliderValue, in: 1...150, step: 1)
                }
            }
            
            Group {
                Text("Form Text")
                Text("Form Text")
                Text("Form Text")
            }
            
            Section {
                Text("Form Text")
                Text("Form Text")
                Text("Form Text")
            } header: {
                Text("Header")
            }
            
        }
    }
}

struct Toast: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Text("List Tab")
                }
            
            MakeToast()
                .tabItem {
                    Text("Toast Tab")
                }.tag(1) // tag는 optional
            
            
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            
            Text("탭 페이지(View)").tabItem {
                // 탭 버튼
                /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/
            }.tag(3)
        }
        
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        Toast()
    }
}
