//
//  CustomTabView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import SwiftUI

let navigationItems: [BottomBarItem] = [
    BottomBarItem(icon: Image(systemName: "house"), selectedIcon: Image(systemName: "house.fill"), title: "Home"),
    BottomBarItem(icon: Image(systemName: "gift"), selectedIcon: Image(systemName: "gift.fill"), title: "Offers"),
    BottomBarItem(icon: Image(systemName: "bell"), selectedIcon: Image(systemName: "bell.fill"), title: "Alerts"),
    BottomBarItem(icon: Image(systemName: "person"), selectedIcon: Image(systemName: "person.fill"), title: "Profile"),
]

struct CustomTabView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        withAnimation {
            navigationItems[selectedIndex]
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 4){
                
                MasterBaseView(item: selectedItem)
            }
            VStack{
                Spacer()
                BottomBar(selectedIndex: $selectedIndex, items: navigationItems)
                    .onAppear(perform: {
                    }).transition(.opacity)
                    .background(Color(.systemBackground))
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}


public struct BottomBarItem {
    @Environment(\.colorScheme) var colorScheme
    public let icon: Image
    public let selectedIcon: Image
    public let title: String
    
    
    public init(icon: Image,selectedIcon: Image, title: String){
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.title = title
    }
    
    
}

public struct BottomBarItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selected : Int
    public let index: Int
    public let item: BottomBarItem
    
    public var body: some View {
        HStack {
            if isSelected {
                item.selectedIcon
                    .resizable()
                    .foregroundColor(Color("primaryColor"))
                    .frame(width: 21, height: 20)
                    
            } else {
                if #available(iOS 16.0, *) {
                    item.icon
                        .resizable()
                        .foregroundColor(.secondary)
                        .fontWeight(.light)
                        .frame(width: 21, height: 20)
                } else {
                    // Fallback on earlier versions
                    item.icon
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 21, height: 20)
                }
                    
            }

        }
        .padding(10)

    }
    
    var isSelected : Bool{
        selected == index
    }
    
}

public struct BottomBar : View {
    @Environment(\.colorScheme) var colorScheme
    @Binding public var selectedIndex: Int
    
    public let items: [BottomBarItem]
    
    public init(selectedIndex: Binding<Int>, items: [BottomBarItem]) {
        self._selectedIndex = selectedIndex
        self.items = items
    }
    
    
    public init(selectedIndex: Binding<Int>, BarBuilder items: () -> [BottomBarItem]){
        self = BottomBar(selectedIndex: selectedIndex,
                         items: items())
    }
    
    
    public init(selectedIndex: Binding<Int>, item: BottomBarItem){
        self = BottomBar(selectedIndex: selectedIndex,
                         items: [item])
    }
    
    
    func itemView(at index: Int) -> some View {
        Button(action: {
            withAnimation { self.selectedIndex = index }
        }) {
            BottomBarItemView(selected: self.$selectedIndex,
                              index: index,
                              item: items[index])
        }
    }
    
    public var body: some View {
        VStack (spacing: 5){
            Divider()
            
            HStack(alignment: .bottom) {
                ForEach(0..<items.count) { index in
                    self.itemView(at: index)
                        
                    
                    if index != self.items.count-1 {
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 5)
            .padding(.horizontal)
        }
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
