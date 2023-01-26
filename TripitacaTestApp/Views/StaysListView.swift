//
//  StaysListView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import SwiftUI

struct StaysListView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataManager: DataManager
    @State var showSearchView: Bool = false
    @State var filterFields = ["Price", "Rooms & Beds", "Type Of Place", "For Tonight Only", "Flexible Cancellation", "Wifi", "Cable TV", "Kitchen"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            searchBar
            
            filters
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(dataManager.filteredStays, id: \.self) { item in
                        StayListItemView(stay: item)
                        
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
        .navigationTitle(Text("Stays"))
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

struct StaysListView_Previews: PreviewProvider {
    static var previews: some View {
        StaysListView()
    }
}


struct StayListItemView: View {
    @State private var maximumRating: Int = 5
    @State private var viewStay: Bool = false
    @State var stay: Stay
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(stay.images.first ?? "pic_1")
                .resizable()
                .scaledToFill()
                .frame(width: width - 30 , height: 180)
                .cornerRadius(10)
            
            Text("Hotel In \(stay.location)")
                .font(.footnote)
                .fontWeight(.thin)
            
            Text(stay.stayName)
                .font(.callout)
                .fontWeight(.medium)
            
            Text("\(stay.guests) Guests, \(stay.numberOfBedrooms) Bedrooms, \(stay.numberOfBeds) Beds, \(stay.numberOfBathrooms) Bathrooms")
                .font(.footnote)
                .fontWeight(.thin)
            
            HStack {
                HStack(alignment: .center, spacing: 2) {
                    ForEach(1 ..< maximumRating + 1) { number in
                        Image(systemName: ratingImageName(number: number))
                            .foregroundColor(Color("primaryColor"))
                            .font(.system(size: 12))
                    }
                }
                
                Spacer(minLength: 2)
                
                Text(stay.price)
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .onTapGesture {
            self.viewStay = true
        }
        
        NavigationLink(isActive: $viewStay) { StayView(stay: self.stay) } label: {}.hidden()

    }
    
    func ratingImageName(number: Int) -> String {
        if number > stay.ratings {
            return "star"
        } else {
            return "star.fill"
        }
    }
}
