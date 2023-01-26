//
//  SearchView.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
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
    @State var closeSearchView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            header
                .padding(.top)
            
            CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Stays", "Packages"])
            
            ScrollView(showsIndicators: false) {
                if preselectedIndex == 0 {
                    
                    StaysSearchView(closeSearch: $closeSearchView).environmentObject(dataManager)
                    
                } else {
                    
                    PackagesSearchView(closeSearch: $closeSearchView).environmentObject(dataManager)
                }
            }
           
            Spacer()
        }
        .padding()
        .onChange(of: self.closeSearchView) { newValue in
            if newValue {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
    }
    
    var header: some View {
        HStack(alignment: .center, spacing: 10) {
            Button {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
                    .imageScale(.large)
            }
            
            Spacer()
            
            Text("Search")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "xmark")
                .foregroundColor(.clear)
                .imageScale(.large)

        }
        .padding(.bottom)
        .padding(.top, -10)
    }
    
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


