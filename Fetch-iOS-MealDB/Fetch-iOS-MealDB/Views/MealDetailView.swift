//
//  MealDetailView.swift
//  Fetch-iOS-MealDB
//
//  Created by Jaswitha Reddy G on 11/1/23.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @State private var mealDetails: MealDetails?

    var body: some View {
        ScrollView {
            VStack {
                if let meal = mealDetails {
                    Text(meal.strMeal)
                        .font(.title)
                    Text("Instructions: \(meal.strInstructions)")
                        .padding()
                    
                    // Displaying the ingredients if they exist
                    if !meal.ingredients.isEmpty {
                        Text("Ingredients:")
                            .font(.headline)
                        ForEach(meal.ingredients, id: \.name) { ingredient in
                            Text("\(ingredient.name) - \(ingredient.measurement)")
                        }
                    } else {
                        Text("No ingredients available")
                    }
                } else {
                    Text("Loading meal details...")
                }
            }
        }
        .onAppear {
            fetchMealDetails()
        }
    }

    func fetchMealDetails() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
                    if let meal = response.meals.first {
                        mealDetails = meal
                    } else {
                        print("No meal details found")
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a default MealDetailView with mealID for preview
        MealDetailView(mealID: "52860")
    }
}
