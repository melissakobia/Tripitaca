//
//  MasterBaseView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import SwiftUI

struct MasterBaseView: View {
    
    let item: BottomBarItem
    
    var title: String {
        "\(item.title)"
    }
    
    var body: some View {
        VStack{
            selectedView
            Spacer()
        }
        
    }
    
    var selectedView: some View {
        VStack {
            switch title {
            case "Home":
                HomeView()
            case "Offers":
                OffersView()
            case "Alerts":
                AlertsView()
            case "Profile":
                ProfileView()
           
            default:
                EmptyView()
            }
        }
    }
}

struct MasterBaseView_Previews: PreviewProvider {
    static var previews: some View {
        MasterBaseView(item: BottomBarItem(icon: Image(systemName: "message.circle.fill"), selectedIcon: Image(systemName: "house.fill"), title: "Home"))
    }
}


