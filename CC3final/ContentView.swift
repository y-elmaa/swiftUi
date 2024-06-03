//
//  ContentView.swift
//  CC3-App
//
//  Created by user on 7/5/2024.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var time: String
    var temperature: Double
    var windSpeed: Double
}

class WeatherViewModel: ObservableObject {
    @Published var weatherData: [Weather] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    var weatherArray: [Weather] = []
                    for i in 0..<result.hourly.time.count {
                        let weather = Weather(time: result.hourly.time[i], temperature: result.hourly.temperature_2m[i], windSpeed: result.hourly.wind_speed_10m[i])
                        weatherArray.append(weather)
                    }
                    DispatchQueue.main.async {
                        self.weatherData = weatherArray
                    }
                } catch let error {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.weatherData) { weather in
                NavigationLink(destination: WeatherDetailView(weather: weather)) {
                    WeatherRow(weather: weather)
                }
            }
            .navigationBarTitle("Weather Forecast")
            
            
        }
    }
}


struct WeatherRow: View {
    var weather: Weather
    
    var body: some View {
        HStack {
            Image("weather")
                .resizable()
                .frame(width: 80,height: 80)
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text("Time: \(weather.time)")
                Text("Temperature: 	\(weather.temperature)°C")
                Text("Wind Speed: \(weather.windSpeed) m/s")
            }
            Spacer()
            
        }
        .padding()
        .background(Color.brown) // Set background color to white
        .cornerRadius(8) // Add corner radius
        .shadow(color: Color.black, radius: 3, x: 0, y: 2) // Add shadow
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Add border
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct WeatherDetailView: View {
    var weather: Weather
    

    var body: some View {
        VStack {
            Text("Time: \(weather.time)")
                .font(.title)
            Text("Temperature: \(weather.temperature)°C")
            Text("Wind Speed: \(weather.windSpeed) m/s")
            Spacer()
        }
        .padding()
        .background(Color.brown) // Set background color to white
        .cornerRadius(8) // Add corner radius
        .shadow(color: Color.black, radius: 3, x: 0, y: 2) // Add shadow
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Add border
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct WeatherResponse: Codable {
    var current: Current
    var hourly: Hourly
}

struct Current: Codable {
    var time: String
    var temperature_2m: Double
    var wind_speed_10m: Double
}

struct Hourly: Codable {
    var time: [String]
    var wind_speed_10m: [Double]
    
    var temperature_2m: [Double]
    var relative_humidity_2m: [Int]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
