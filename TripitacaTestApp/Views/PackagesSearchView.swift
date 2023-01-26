//
//  PackagesSearchView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct PackagesSearchView: View {
    @EnvironmentObject var dataManager: DataManager
    @State var location: String = ""
    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    @State private var adults: Int = 0
    @State private var children: Int = 0
    @State private var infants: Int = 0
    @State private var nights: String = ""
    @State private var showGuestPicker: Bool = false
    @State var preselectedIndex = 0
    @State var showStays: Bool = false
    @State var showPackages: Bool = false
    @Binding var closeSearch: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            //Location
            VStack(alignment: .leading, spacing: 8) {
                Text("Where to?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                HStack(alignment: .center, spacing: 5) {
                    FontIcon.text(.materialIcon(code: .location_on), color: .secondary)
                    
                    TextField(text: $location, prompt: Text("Enter location").font(.footnote).foregroundColor(.secondary)) { }
                }
                .padding(EdgeInsets(top: 14, leading: 8, bottom: 14, trailing: 6))
                .background {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
                }
                    
            }
            .padding(.vertical, 5)
            
            //Check In
            VStack(alignment: .leading, spacing: 8) {
                Text("Check in")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "calendar")
                        .imageScale(.small)
                        .foregroundColor(.secondary)
                    
                    DatePicker(selection: $checkInDate, in: Date()..., displayedComponents: [.date]) {
                        Text("Select a date")
                            .font(.footnote)
                    }
                }
                .padding(EdgeInsets(top: 14, leading: 8, bottom: 14, trailing: 6))
                .background {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
                }
                    
            }
            .padding(.vertical, 5)
            
            //Nights
            VStack(alignment: .leading, spacing: 8) {
                Text("How many nights?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                HStack(alignment: .center, spacing: 5) {
                
                    TextField(text: $nights, prompt: Text("Number of nights").font(.footnote).foregroundColor(.secondary)) { }
                        .keyboardType(.numberPad)
                }
                .padding(EdgeInsets(top: 14, leading: 8, bottom: 14, trailing: 6))
                .background {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
                }
                    
            }
            .padding(.vertical, 5)
            
            //Guests
            
            guestsView
            
            //Search Button
            
            Button {
                search()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(LinearGradient(colors: [Color("primaryColor"), Color.primary], startPoint: .leading, endPoint: .trailing))
                    
                    Text("Search")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.medium)
                }
                .frame(height: 45)
            }
            .padding(.vertical)
        }
        .padding(.top)
        
    }
    
    var guestsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Who's coming?")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Number of guests")
                    .font(.caption2)
                    .fontWeight(.medium)
                
                HStack(alignment: .center, spacing: 8) {
                    Text("\(adults) adults")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color.secondary)
                        }
                    Text("\(children) children")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color.secondary)
                        }
                    Text("\(infants) infants")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color.secondary)
                        }
                    
                    Spacer()
                }
                .onTapGesture {
                    withAnimation {
                        self.showGuestPicker.toggle()
                    }
                }
                
                if showGuestPicker {
                    
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Adults")
                                .font(.callout)
                            
                            Text("Ages 13 or above")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .center, spacing: 8) {
                            Button {
                                if adults > 1 {
                                    adults -= 1
                                }
                            } label: {
                                Image(systemName: "minus.circle")
                                    .imageScale(.large)
                                    .foregroundColor( .secondary)
                            }
                            .disabled(adults < 1)
                            
                            Text("\(adults)")
                                .font(.callout)
                                .fontWeight(.medium)
                            
                            Button {
                                adults += 1
                            } label: {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                                    .foregroundColor(.secondary)
                            }

                        }
                    
                    }
                    .padding(.vertical, 8)
                    
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Children")
                                .font(.callout)
                            
                            Text("Ages 2-12")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .center, spacing: 8) {
                            Button {
                                if children > 0 {
                                    children -= 1
                                }
                            } label: {
                                Image(systemName: "minus.circle")
                                    .imageScale(.large)
                                    .foregroundColor( .secondary)
                            }
                            .disabled(children < 0)
                            
                            Text("\(children)")
                                .font(.callout)
                                .fontWeight(.medium)
                            
                            Button {
                                children += 1
                            } label: {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                                    .foregroundColor(.secondary)
                            }

                        }
                    
                    }
                    .padding(.vertical, 8)
                    
                    
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Infants")
                                .font(.callout)
                            
                            Text("Under 2")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .center, spacing: 8) {
                            Button {
                                if infants > 1 {
                                    infants -= 1
                                }
                            } label: {
                                Image(systemName: "minus.circle")
                                    .imageScale(.large)
                                    .foregroundColor( .secondary)
                                
                            }
                            .disabled(infants < 1)
                            
                            Text("\(infants)")
                                .font(.callout)
                                .fontWeight(.medium)
                            
                            Button {
                                infants += 1
                            } label: {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                                    .foregroundColor(.secondary)
                            }

                        }
                    
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 14, trailing: 8))
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
            }
                
        }
        .padding(.vertical, 5)
    }
    
    func search() {
        withAnimation {
            dataManager.searchOption = 1
            dataManager.searchPackages(locationText: self.location, guests: self.adults, nights: Int(self.nights) ?? 0)
            self.closeSearch = true
        }
    }
}

struct PackagesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesSearchView(closeSearch: .constant(false))
    }
}
