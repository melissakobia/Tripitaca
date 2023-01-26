//
//  StayView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import SwiftUI

struct StayView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var maximumRating: Int = 5
    @State var stay: Stay
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    Image(stay.images.first ?? "pic_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width - 10 , height: 250)
                        .cornerRadius(8)
                        .padding(.horizontal, 5)
                    
                    Text(stay.stayName + " Hosted By " + stay.hostName)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("Located at " + stay.location)
                        .font(.callout)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    
                    HStack(alignment: .center, spacing: 10) {
                        HStack(alignment: .center, spacing: 2) {
                            ForEach(1 ..< maximumRating + 1) { number in
                                Image(systemName: ratingImageName(number: number))
                                    .foregroundColor(Color("primaryColor"))
                                    .font(.system(size: 12))
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    mainAmenities
                    
                    
                    
                    Divider()
                        .padding(.horizontal)
                    
                    houseRules
                    
                    Divider()
                        .padding(.horizontal)
                    
                    contactHost
                    
                    
                }
            }
            
            bottomBar
        }
        
        .navigationTitle(Text(stay.stayName))
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
    
    var mainAmenities: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "suitcase")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("\(stay.guests) Guests")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "bed.double")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("\(stay.numberOfBeds) Beds")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                }
                
                Spacer(minLength: 5)
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "bed.double.circle")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("\(stay.numberOfBedrooms) Bedrooms")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "bed.double.circle")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("\(stay.numberOfBathrooms) Baths")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                }
            }
            
            Text(stay.stayDescription)
                .font(.subheadline)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
                
        }
        .padding()
    }
    
    var houseRules: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("House Rules")
                .fontWeight(.semibold)
            
            HStack(alignment: .center) {
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "clock.fill")
                        .imageScale(.medium)
                        .foregroundColor(.primary)
                    
                    Text("Check In: After 12pm")
                        .font(.callout)
                        .fontWeight(.thin)
                }
                
                Spacer(minLength: 2)
                
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "clock.fill")
                        .imageScale(.medium)
                        .foregroundColor(.primary)
                    
                    Text("Check Out: 10:00am")
                        .font(.callout)
                        .fontWeight(.thin)
                }
            }
        }
        .padding()
    }
    
    var contactHost: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Contact Host")
                .fontWeight(.semibold)
            
            HStack(alignment: .center, spacing: 10) {
                Button { } label: {
                    Text("Contact Host")
                        .font(.callout)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(.secondary)
                        }
                }
                
                Spacer(minLength: 2)
                
                Button { } label: {
                    Text("Referral Link")
                        .font(.callout)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(.secondary)
                        }
                }

            }
        }
        .padding()
    }
    
    var bottomBar: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
            
            HStack(alignment: .center, spacing: 10) {
                Text(stay.price + "/Night")
                    .font(.callout)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {} label: {
                    Text("Book Now")
                        .font(.callout)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("primaryColor"))
                        }
                }

            }
            .padding(.vertical)
        }
        .padding(.horizontal, 10)
    }
    
    func ratingImageName(number: Int) -> String {
        if number > stay.ratings {
            return "star"
        } else {
            return "star.fill"
        }
    }
}

struct StayView_Previews: PreviewProvider {
    static var previews: some View {
        StayView(stay: Stay(stayName: "Anka Resort", location: "Nanyuki", hostName: "John Pholly", stayDescription: "Anka Resort is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 20, numberOfBedrooms: 20, numberOfBeds: 20, numberOfBathrooms: 20, dates: "", ratings: 4, images: ["pic_11", "pic_1"], price: "$90"))
    }
}
