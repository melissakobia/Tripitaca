//
//  Destination.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import Foundation

struct Destination: Identifiable, Hashable, Encodable {
    var id = UUID()
    var destinationName: String
    var image: String
    
    init(destinationName: String, image: String) {
        self.destinationName = destinationName
        self.image = image
    }
}


extension Destination {
    static let places: [Destination] = [
        .init(destinationName: "Nairobi", image: "pic_4"),
        .init(destinationName: "Nanyuki", image: "pic_3"),
        .init(destinationName: "Mombasa", image: "pic_6"),
        .init(destinationName: "Nakuru", image: "pic_1"),
        .init(destinationName: "Kisumu", image: "pic_2"),
        .init(destinationName: "Mt Kenya", image: "pic_5"),
    ]
}
