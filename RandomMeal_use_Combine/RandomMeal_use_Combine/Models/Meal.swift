//
//  Meal.swift
//  RandomMeal_use_Combine
//
//  Created by Maxim Granchenko on 21.12.2020.
//

import Foundation

struct MealDate: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let name: String
    let imageUrlString: String
    let instructions: String
    let ingredients: [Ingredient]
}

struct Ingredient: Decodable {
    let name: String
    let measure: String
}

extension Meal {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDictionary = try container.decode([String: String?].self)
        
        var index = 1
        var ingredients: [Ingredient] = []
        
        while let ingredient = mealDictionary["strIngredient\(index)"] as? String,
              let measure = mealDictionary["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }
        
        self.ingredients = ingredients
        name = mealDictionary["strMeal"] as? String ?? ""
        imageUrlString = mealDictionary["strMealThumb"] as? String ?? ""
        instructions = mealDictionary["strInstructions"] as? String ?? ""
    }
}
