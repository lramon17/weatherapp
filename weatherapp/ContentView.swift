//
//  ContentView.swift
//  weatherapp
//
//  Created by Lily Ramon on 3/17/26.
//

import SwiftUI

struct ContentView: View {
    // create Hour instances
    let hours = [Hour(time: "Now", temperature: 60, icon: "sun.max.fill"), Hour(time: "1PM", temperature: 63, icon: "sun.max.fill"), Hour(time: "2PM", temperature: 66, icon: "sun.max.fill"), Hour(time: "3PM", temperature: 68, icon: "sun.max.fill"), Hour(time: "4PM", temperature: 68, icon: "cloud.sun.fill")]
    // create Day instances
    let days = [Day(day: "Today", high: 68, low: 54, icon: "sun.max.fill"), Day(day: "Mon", high: 58, low: 45, icon: "cloud.fill"), Day(day: "Tue", high: 67, low: 55, icon: "cloud.sun.fill"), Day(day: "Wed", high: 60, low: 51, icon: "cloud.heavyrain.fill"), Day(day: "Thu", high: 71, low: 54, icon: "sun.max.fill"), Day(day: "Fri", high: 65, low: 51, icon: "cloud.sun.fill"), Day(day: "Sat", high: 74, low: 59, icon: "sun.max.fill"), Day(day: "Sun", high: 71, low: 57, icon: "cloud.sun.fill"), Day(day: "Mon", high: 69, low: 56, icon: "cloud.fill")]
    
    // UI content (what appears on the screen)
    var body: some View {
        // create background color; keep everything within this ZStack
        ZStack {
            LinearGradient(
                colors: [Color("sunny_blue"), Color("middle_sunny_blue"), Color("light_blue"), Color("super_light_blue")], startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            // general information at the top
            VStack {
                Text("Chapel Hill")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 50, weight: .light))
                    .padding(.top, -4)
                Text("55°")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 100))
                    .fontWeight(.thin)
                    .padding(.top, -30)
                Text("Sunny")
                    .foregroundStyle(Color("super_light_blue"))
                    .font(.system(size: 23))
                    .padding(.top, -55)
                Text("H: 57°   L: 45°")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 25))
                    .padding(.top, -40)
                Spacer()
            }
            // hourly forecast view
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(hours) {hour in
                        VStack {
                            Text(hour.time)
                                .padding(3)
                                .foregroundStyle(Color.white)
                            Image(systemName: hour.icon)
                                .padding(3)
                                .font(.system(size: 25))
                                .symbolRenderingMode(.multicolor)
                            Text("\(hour.temperature)°")
                                .foregroundStyle(Color.white)
                        }
                        .font(.system(size: 20))
                    }
                }
            }
            .offset(x: 35, y: -20)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("middle_sunny_blue"))
                    .frame(width: 375, height: 155)
                    .offset(x:0, y: -40))
            HStack {
                Image(systemName: "clock")
                    .foregroundStyle(Color("super_light_blue"))
                    .offset(x: -60)
                Text("HOURLY FORECAST")
                    .foregroundStyle(Color("super_light_blue"))
                    .font(.system(size: 18))
                    .offset(x: -60)
                
                
            }
            .padding(.top, -100)
            // now create daily weather view
            VStack(spacing: 8) {
                ForEach(days) { day in
                    HStack {
                        Text(day.day)
                            .foregroundStyle(Color.white)
                            .offset(x: -50)
                            .font(.system(size: 18))
                        VStack {
                            Image(systemName: day.icon)
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 25))
                        }
                        Text("\(day.low)°")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .offset(x: 30)
                        // temperature range bar
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("temp_bar"))
                                .frame(width: 70, height: 5)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("more_temp"))
                                .frame(width: CGFloat(day.high - day.low), height:5)
                        }
                        .offset(x: 50)
                        Text("\(day.high)°")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .offset(x: 60)
                    }
                                    }
            }
            .offset(x:0, y: 236)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("middle_sunny_blue"))
                    .frame(width: 375, height: 354)
                    .offset(x:0, y: 220))
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(Color("super_light_blue"))
                Text("10-DAY FORECAST")
                    .foregroundStyle(Color("super_light_blue"))
                    .font(.system(size: 18))
            }
            .offset(x: -65, y: 65)

        }
    }
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
