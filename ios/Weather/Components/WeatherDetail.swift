//
//  WeatherDetails.swift
//  Weather
//
//  Created by Salim Mghari on 12/6/23.
//

import SwiftUI

struct WeatherDetail: View {
    var icon: String
    var name: String
    var value: String

    var body: some View {
        HStack(
            spacing: 16
        ) {
            Image(
                systemName: icon
            )
            .font(.title2)
            .frame(
                width: 16,
                height: 16
            )
            .padding()
            .foregroundColor(.white)
            .background(Color("AccentColor"))
            .cornerRadius(50)
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail(
            icon: "thermometer",
            name: "Feels like",
            value: "8°"
        )
    }
}
