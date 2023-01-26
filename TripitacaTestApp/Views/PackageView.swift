//
//  PackageView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct PackageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var maximumRating: Int = 5
    @State var package: Package
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    Image(package.images.first ?? "pic_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width - 10 , height: 250)
                        .cornerRadius(8)
                        .padding(.horizontal, 5)
                    
                    Text(package.packageName)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("Located at " + package.location)
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
                    
                    packageDescription
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Group {
                        mainAmenities
                        
                        Divider()
                            .padding(.horizontal)
                        
                        houseRules
                        
                        Divider()
                            .padding(.horizontal)
                    }
                    
                    
                    contactHost
                }
            }
            
            bottomBar
        }
        
        .navigationTitle(Text(package.packageName))
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
    
    var packageDetails: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Package Valid From" + package.dates)
                .font(.callout)
                .fontWeight(.thin)
            
            HStack(alignment: .center) {
                HStack(alignment: .center, spacing: 2) {
                    Image(systemName: "suitcase")
                        .imageScale(.medium)
                        .foregroundColor(.primary)
                    
                    Text("\(package.guests) Guests")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background {
                    Capsule()
                        .fill(Color(uiColor: .systemGray6))
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 2) {
                    Image(systemName: "moon")
                        .imageScale(.medium)
                        .foregroundColor(.primary)
                    
                    Text("\(package.numberOfNights) Nights")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background {
                    Capsule()
                        .fill(Color(uiColor: .systemGray6))
                }
                
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal)
    }
    
    var packageDescription: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Contact Host")
                .fontWeight(.semibold)
            
            Text(package.packageDescription)
                .font(.subheadline)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
    
    var mainAmenities: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Amenities")
                .fontWeight(.semibold)
            
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "tv")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Cable TV")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "bed.double")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Bed")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "microwave")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Microwave")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "cup.and.saucer")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Dishware")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                }
                
                Spacer(minLength: 5)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "washer")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Washer")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "stove")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Cooker")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "dishwasher")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Dish Washer")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "refrigerator")
                            .imageScale(.medium)
                            .foregroundColor(.primary)
                        
                        Text("Refrigerator")
                            .font(.callout)
                            .fontWeight(.thin)
                    }
                }
            }
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
                    Text("View Listing")
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
                Text(package.price + "/Night")
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
        if number > package.ratings {
            return "star"
        } else {
            return "star.fill"
        }
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView(package: Package(packageName: "Weekend Staycation", location: "Nairobi", packageDescription: "Get a home away from home with drives around the city.", guests: 3, numberOfNights: 3, dates: "25 Jan 2023 - 31 Jan 2023", ratings: 4, images: ["pic_7", "pic_2"], price: "$300"))
    }
}
