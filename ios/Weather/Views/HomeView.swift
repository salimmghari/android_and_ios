import SwiftUI
import CoreLocationUI

struct HomeView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack() {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(
                        weather: weather
                    )
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(
                                    latitude: location.latitude,
                                    longitude: location.longitude
                                )
                            } catch {
                                print("Weather fetch error:", error)
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    VStack(
                        spacing: 16
                    ) {
                        Text("Weather App")
                            .bold()
                            .font(.title)
                            .padding()
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                    }
                    .cornerRadius(6)
                    .symbolVariant(.fill)
                    .foregroundColor(.white)
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color("AccentColor"))
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
