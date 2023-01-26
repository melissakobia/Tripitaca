//
//  DataManager.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import Foundation

class DataManager: ObservableObject {
    @Published var filteredStays: [Stay] = Stay.stays
    @Published var filteredPackages: [Package] = Package.packages
    @Published var searchOption: Int = -1
    
    func searchPackages(locationText: String, guests: Int, nights: Int) {
        self.filteredPackages.removeAll()
        if locationText.isEmpty && guests == 0 {
            self.filteredPackages = Package.packages
        }
        
        for item in Package.packages {
            if item.location.localizedCaseInsensitiveContains(locationText) || item.packageName.localizedCaseInsensitiveContains(locationText) || guests > item.guests  {
                self.filteredPackages.append(item)
            }
        }
        
    }
    
    func searchStays(locationText: String, guests: Int) {
        self.filteredStays.removeAll()
        if locationText.isEmpty && guests == 0 {
            self.filteredStays = Stay.stays
        }
        
        for item in Stay.stays {
            if item.location.localizedCaseInsensitiveContains(locationText) || item.stayName.localizedCaseInsensitiveContains(locationText) || guests > item.guests  {
                self.filteredStays.append(item)
            }
        }
        
    }
}
