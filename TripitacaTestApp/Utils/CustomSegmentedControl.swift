//
//  CustomSegmentedControl.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 25/01/2023.
//

import Foundation
import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color("primaryColor")

    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                ZStack {
                    Capsule()
                        .fill(Color.white)

                    Capsule()
                        .fill(color)
                        .padding(3)
                        .opacity(preselectedIndex == index ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                    preselectedIndex = index
                                }
                            }
                }
                .overlay(
                    Text(options[index])
                        .font(.footnote)
                        .foregroundColor(preselectedIndex == index ? .white : .secondary)
                        .fontWeight(.medium)
                )
            }
        }
        .background {
            Capsule()
                .fill(Color.white)
                .shadow(color: Color(uiColor: .systemGray5) , radius: 5, x: 0, y: 0)
        }
        .frame(height: 40)
    }
}
