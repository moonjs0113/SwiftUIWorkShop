import SwiftUI

public struct BottomBarItem {
    public let icon: String
    public let title: String
    public let color: Color
    
    
    public init(icon: String,
                color: Color,_ title: String) {
        self.icon = icon
        self.title = title
        self.color = color
    }
}

