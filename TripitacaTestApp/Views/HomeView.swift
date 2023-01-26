//
//  HomeView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import SwiftUI
import SwiftUIFontIcon
import GoogleSignIn


struct HomeView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject var dataManager: DataManager = DataManager()
    private let user = GIDSignIn.sharedInstance.currentUser
    @State var showSearchView: Bool = false
    @State var showStays: Bool = false
    @State var showPackages: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let name = user?.profile?.name {
                Text("Hello, \(name) 👋🏾")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, 6)
                    .padding(.bottom, 3)
                    .padding(.horizontal)
            }
            
            searchBar
            
            ScrollView( showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    
                    destinations
                    
                    recommendedPackages
                }
                
            }
        }
        .padding(.vertical)
        
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showSearchView,onDismiss: {
            debugPrint("Search closed")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    if dataManager.searchOption == 0 {
                        self.showStays = true
                    } else if dataManager.searchOption == 1 {
                        self.showPackages = true
                    }
                }
            }
        }) {
            NavigationView {
                SearchView().environmentObject(dataManager).navigationBarHidden(true)
            }
        }
        
        if dataManager.searchOption == 0 {
            
            NavigationLink(isActive: $showStays) { StaysListView().environmentObject(dataManager) } label: { }.hidden()
            
        } else if dataManager.searchOption == 1 {
            
            NavigationLink(isActive: $showPackages) { PackagesListView().environmentObject(dataManager) } label: { }.hidden()
        }
        

    }
    
    var searchBar: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "magnifyingglass")
                .imageScale(.medium)
                .foregroundColor(.secondary)
            
            Text("Where are you going?")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal.decrease")
                .imageScale(.medium)
                .foregroundColor(.secondary)
                
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background {
            Capsule()
                .fill(Color.white)
                .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
        }
        .padding(.horizontal)
        .onTapGesture {
            self.showSearchView = true
        }
    }
    
    var destinations: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .center, spacing: 10) {
                Text("Explore destinations")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {} label: {
                    Text("See all")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }

            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(Destination.places, id: \.self) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 120)
                            .cornerRadius(8)
                            .overlay {
                                Text(item.destinationName)
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                            }
                            .padding(.vertical)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        
    }
    
    var recommendedPackages: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .center, spacing: 10) {
                Text("Recommended packages")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer()
                
                NavigationLink {
                    PackagesListView().environmentObject(dataManager)
                } label: {
                    Text("See all")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }

            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(Package.packages, id: \.self) { item in
                        
                        RecommendedPackageItem(package: item)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .padding(.vertical)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


fileprivate struct RecommendedPackageItem: View {
    
    @State var package: Package
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(package.images.first ?? "pic_1")
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 140)
                .cornerRadius(8)
            
            HStack(alignment: .center) {
                HStack(alignment: .center, spacing: 0) {
                    FontIcon.text(.materialIcon(code: .people), color: .secondary)
                    
                    Text("\(package.guests) Guests")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "moon")
                        .imageScale(.small)
                        .foregroundColor(.secondary)
                    
                    Text("\(package.numberOfNights) Nights")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }

            }
            
            Text(package.packageName)
                .font(.callout)
                .fontWeight(.semibold)
            
            HStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 3) {
                    FontIcon.text(.materialIcon(code: .location_on), color: Color("primaryColor"))
                    
                    Text(package.location)
                        .font(.footnote)
                        .fontWeight(.medium)
                    
                }
                
                Spacer()
                
                Text(package.price)
                    .font(.callout)
                    .foregroundColor(Color("primaryColor"))
                    .fontWeight(.semibold)
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
        }
        .padding(.vertical)
    }
}

