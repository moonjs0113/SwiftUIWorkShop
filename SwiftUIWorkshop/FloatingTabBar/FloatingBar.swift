import SwiftUI

public struct FloatingTabBar : View {
    @Binding public var selectedIndex: Int {
        willSet {
            print("Will Set \(newValue) in FloatingTabBar")
        }
    }
    
    private let items: [BottomBarItem] = [
        BottomBarItem(icon: "map", color: Color.iconColor, "지도"),
        BottomBarItem(icon: "bubble.left", color: Color.iconColor, "커뮤니티"),
        BottomBarItem(icon: "person", color: Color.iconColor, "마이페이지")
    ]
    
    public init(selectedIndex: Binding<Int>) {
        self._selectedIndex = selectedIndex
    }
    
    func itemView(at index: Int) -> some View {
        Button {
            withAnimation {
                self.selectedIndex = index
            }
        } label: {
            BottomBarItemView(isSelected: index == self.selectedIndex, item: self.items[index])
        }
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 17, style: .continuous)
                        .fill(.white)
                        .frame(height: 80)
                    HStack(alignment: .center, spacing: 50) {
                        self.itemView(at: 0)
                        self.itemView(at: 1)
                        self.itemView(at: 2)
                    }
                    .padding([.horizontal])
                    .animation(.default, value: 0)
                    .padding(.bottom,0)
                    .padding(.top,0)
                    .frame(height: 70)
                }
                .shadow(color: .darkTextColorMain.opacity(0.1),
                        radius: 10, x: 10, y: 5)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .background(.clear)
    }
}

#if DEBUG
@available(iOS 13.0.0, *)
@available(OSX 10.15.0, *)
struct FloatingTabBar_Previews : PreviewProvider {
    static var previews: some View {
        FloatingTabBar(selectedIndex: .constant(0))
    }
}
#endif

