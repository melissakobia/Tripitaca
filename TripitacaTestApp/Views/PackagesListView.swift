//
//  PackagesListView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct PackagesListView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    @State var showSearchView: Bool = false
    @State var filterFields = ["Price", "Rooms & Beds", "Meal Plan", "Transport Inclusive"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            searchBar
            
            filters
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(dataManager.filteredPackages, id: \.self) { item in
                        PackageListItemView(package: item)
                        
                        Divider()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSearchView,onDismiss: { }) {
            NavigationView {
                SearchView().environmentObject(dataManager).navigationBarHidden(true)
            }
        }
        .padding(.vertical, 10)
        .navigationTitle(Text("Packages"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                   
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.primary)
                        .imageScale(.large)
                }

            }
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
        .padding(.horizontal, 10)
        .onTapGesture {
            self.showSearchView = true
        }
    }
    
    var filters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 13) {
                ForEach(filterFields, id: \.self) { item in
                    HStack(alignment: .center, spacing: 5) {
                        Text(item)
                            .font(.footnote)
                            .fontWeight(.thin)
                        
                        Image(systemName: "chevron.down")
                            .imageScale(.small)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background {
                        Capsule()
                            .stroke(lineWidth: 0.7)
                            .foregroundColor(.secondary)
                    }
                }

            }
            .padding(10)
        }
    }
}

struct PackagesListView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesListView()
    }
}

struct PackageListItemView: View {
    @State var viewPackage: Bool = false
    @State var package: Package
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(package.images.first ?? "pic_1")
                .resizable()
                .scaledToFill()
                .frame(width: width - 30 , height: 180)
                .cornerRadius(10)
            
            Text("Apartment In \(package.location)")
                .font(.footnote)
                .fontWeight(.thin)
            
            Text(package.packageName)
                .font(.callout)
                .fontWeight(.medium)
            
            Text("\(package.guests) Guests, \(package.numberOfNights) Nights")
                .font(.footnote)
                .fontWeight(.thin)
            
            HStack {
                Text(package.dates)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 2)
                
                Text(package.price)
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .onTapGesture {
            self.viewPackage = true
        }
        
        NavigationLink(isActive: $viewPackage) { PackageView(package: package) } label: {}.hidden()
    }
}
