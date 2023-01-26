//
//  Package.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import Foundation

struct Package: Identifiable, Hashable, Encodable {
    var id = UUID()
    var packageName: String
    var location: String
    var packageDescription: String
    var guests: Int
    var numberOfNights: Int
    var dates: String
    var ratings: Int
    var images: [String]
    var price: String
    
    init(id: UUID = UUID(), packageName: String, location: String, packageDescription: String, guests: Int, numberOfNights: Int, dates: String, ratings: Int, images: [String], price: String) {
        self.id = id
        self.packageName = packageName
        self.location = location
        self.packageDescription = packageDescription
        self.guests = guests
        self.numberOfNights = numberOfNights
        self.dates = dates
        self.ratings = ratings
        self.images = images
        self.price = price
    }
}

extension Package {
    static var packages: [Package] = [
        .init(packageName: "Weekend Staycation", location: "Nairobi", packageDescription: "Get a home away from home with drives around the city.", guests: 3, numberOfNights: 3, dates: "25 Jan 2023 - 31 Jan 2023", ratings: 4, images: ["pic_7", "pic_2"], price: "$300"),
        .init(packageName: "Kilimani Galore", location: "Kilimani", packageDescription: "Kilimani is the cream of the city with really nice views of the city. Let me host you for the weekend as we take a tour of the city", guests: 5, numberOfNights: 2, dates: "25 Jan 2023 - 31 Jan 2023", ratings: 5, images: ["pic_9", "pic_5"], price: "$150"),
        .init(packageName: "Nanyuki Serenity", location: "Nanyuki", packageDescription: "Nanyuki is the cream of the city with really nice views of the city. Let me host you for the weekend as we take a tour of the city", guests: 8, numberOfNights: 5, dates: "25 Jan 2023 - 31 Jan 2023", ratings: 5, images: ["pic_10", "pic_4"], price: "$200"),
        .init(packageName: "January Staycation", location: "Kisumu", packageDescription: "Nanyuki is the cream of the city with really nice views of the city. Let me host you for the weekend as we take a tour of the city", guests: 4, numberOfNights: 2, dates: "25 Jan 2023 - 31 Jan 2023", ratings: 5, images: ["pic_8", "pic_3"], price: "$250"),
    ]
}
