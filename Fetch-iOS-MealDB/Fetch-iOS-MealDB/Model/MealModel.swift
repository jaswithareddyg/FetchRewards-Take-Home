//
//  Meal.swift
//  Fetch-iOS-MealDB
//
//  Created by Jaswitha Reddy G on 11/1/23.
//

import Foundation

// Model for MealListView
struct Meal: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String { // Providing an identifier for Identifiable protocol conformance
        return idMeal
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}

struct MealDetailsResponse: Codable {
    let meals: [MealDetails]
}

// Model for MealDetailView
struct MealDetails: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    var ingredients: [Ingredient] = []

    struct Ingredient: Codable {
        let name: String
        let measurement: String
    }

    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions, strMealThumb
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)

        // Iterating over all the key-value pairs in the decoder
        var ingredients: [Ingredient] = []
        let mirror = Mirror(reflecting: decoder)
        
        for case let (label?, value) in mirror.children {
            // If the label is an ingredient key (e.g., strIngredient1, strIngredient2, etc.)
            if label.hasPrefix("strIngredient"), let ingredient = value as? String, !ingredient.isEmpty {
                let ingredientKey = label.replacingOccurrences(of: "strIngredient", with: "")
                // Looking for the corresponding measure label (e.g., strMeasure1, strMeasure2, etc.)
                if let measureLabel = mirror.children.first(where: { $0.label == "strMeasure\(ingredientKey)" })?.value as? String, !measureLabel.isEmpty {
                    ingredients.append(Ingredient(name: ingredient, measurement: measureLabel))
                } else {
                    // If the measure label is empty, add the ingredient with an empty measurement
                    ingredients.append(Ingredient(name: ingredient, measurement: ""))
                }
            }
        }
    }
}
