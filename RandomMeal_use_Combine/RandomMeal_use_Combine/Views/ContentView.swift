//
//  ContentView.swift
//  RandomMeal_use_Combine
//
//  Created by Maxim Granchenko on 21.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var mealGenarator = MealGenerator()
    
    var getRandomButton: some View {
        Button(action: {
            mealGenarator.fetchRandomMeal()
        }, label: {
            Text("Get Random Meal")
                .font(.custom("Avenir-Heavy", fixedSize: 25))
                .foregroundColor(Color(.systemBackground))
                .padding()
                .background(Color(.systemBlue))
                .cornerRadius(16)
        })
    }
    
    var body: some View {
        VStack {
            getRandomButton
            if let name = mealGenarator.currentMeal?.name {
                Text(name)
                    .foregroundColor(Color(.label))
                    .font(.custom("Avenir-Medium", size: 25))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
