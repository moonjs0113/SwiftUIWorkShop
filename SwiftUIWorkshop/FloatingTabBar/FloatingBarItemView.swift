import SwiftUI

public struct BottomBarItemView: View {
    public let isSelected: Bool
    public let item: BottomBarItem
    
    public var body: some View {
        VStack {
            Image(systemName: item.icon)
                .imageScale(.large)
                .blendMode(.plusDarker)
                .foregroundColor(isSelected ? item.color : Color.deselectedColor)
            Text(item.title)
                .lineLimit(1)
                .font(.system(size: 20, weight: isSelected ? .bold : .regular))
                .minimumScaleFactor(0.01)
                .foregroundColor(isSelected ? item.color : Color.deselectedColor)
                .frame(minHeight: 15)
        }
        .padding()
    }
}
