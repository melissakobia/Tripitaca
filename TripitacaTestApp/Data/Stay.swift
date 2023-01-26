//
//  Stay.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import Foundation

struct Stay: Identifiable, Hashable, Encodable {
    var id = UUID()
    var stayName: String
    var location: String
    var hostName: String
    var stayDescription: String
    var guests: Int
    var numberOfBedrooms: Int
    var numberOfBeds: Int
    var numberOfBathrooms: Int
    var dates: String
    var ratings: Int
    var images: [String]
    var price: String
    
    init(id: UUID = UUID(), stayName: String, location: String, hostName: String, stayDescription: String, guests: Int, numberOfBedrooms: Int, numberOfBeds: Int, numberOfBathrooms: Int, dates: String, ratings: Int, images: [String], price: String) {
        self.id = id
        self.stayName = stayName
        self.location = location
        self.hostName = hostName
        self.stayDescription = stayDescription
        self.guests = guests
        self.numberOfBedrooms = numberOfBedrooms
        self.numberOfBeds = numberOfBeds
        self.numberOfBathrooms = numberOfBathrooms
        self.dates = dates
        self.ratings = ratings
        self.images = images
        self.price = price
    }

}

extension Stay {
    static var stays: [Stay] = [
        .init(stayName: "Anka Resort", location: "Nanyuki", hostName: "John Pholly", stayDescription: "Anka Resort is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 20, numberOfBedrooms: 20, numberOfBeds: 20, numberOfBathrooms: 20, dates: "", ratings: 4, images: ["pic_11", "pic_1"], price: "$90"),
        .init(stayName: "Misty Lodge", location: "Nanyuki", hostName: "Peter Pholly", stayDescription: "Misty Lodge is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 30, numberOfBedrooms: 30, numberOfBeds: 35, numberOfBathrooms: 35, dates: "", ratings: 4, images: ["pic_12", "pic_2"], price: "$120"),
        .init(stayName: "Sarova White Sands", location: "Mombasa", hostName: "Sarova White Sands", stayDescription: "Sarova White Sands is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 20, numberOfBedrooms: 20, numberOfBeds: 20, numberOfBathrooms: 20, dates: "", ratings: 2, images: ["pic_13", "pic_5"], price: "$190"),
        .init(stayName: "Peaks Hotel", location: "Nairobi", hostName: "Peaks Hotel", stayDescription: "Anka Resort is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 20, numberOfBedrooms: 20, numberOfBeds: 20, numberOfBathrooms: 20, dates: "", ratings: 3, images: ["pic_14", "pic_5"], price: "$190"),
        .init(stayName: "Peaks Hotel", location: "Nairobi", hostName: "Peaks Hotel", stayDescription: "Anka Resort is located at the edge of the Mount Kenya Forest. It overlooks the peaks of Mount Kenya and is a perfect destination for your home away from home. Our serene and ambient environment creates a unique atmosphere that suits all types of events.", guests: 20, numberOfBedrooms: 20, numberOfBeds: 20, numberOfBathrooms: 20, dates: "", ratings: 5, images: ["pic_15", "pic_5"], price: "$190"),
    ]
}
