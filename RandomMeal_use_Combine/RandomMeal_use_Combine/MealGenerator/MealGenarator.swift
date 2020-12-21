//
//  MealGenarator.swift
//  RandomMeal_use_Combine
//
//  Created by Maxim Granchenko on 21.12.2020.
//

import Foundation
import Combine

class MealGenerator: ObservableObject {
    @Published var currentMeal: Meal?
    private var cancellable: AnyCancellable?
    
    func fetchRandomMeal() {
        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { data, _ in
            if let mealData = try? JSONDecoder().decode(MealDate.self, from: data) {
                self.currentMeal = mealData.meals.first
            }
        }
    }
}
