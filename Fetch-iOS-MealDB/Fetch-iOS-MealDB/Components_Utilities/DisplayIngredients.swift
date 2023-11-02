import SwiftUI

/// A structure responsible for displaying the ingredients and measures of a meal.
struct MealDetailContent {
    /// A method that displays the ingredients and their respective measures for a meal.
    static func displayIngredientsAndMeasures(for meal: MealDetail) -> some View {
        // Using VStack to stack the ingredients and measures in a vertical arrangement.
        VStack(alignment: .leading, spacing: 16) {
            // Displaying ingredient and measure pairs up to 20.
            // Using if conditions to check each ingredient and measure individually.
            // Using Text views to display each pair.
            if !meal.strIngredient1.isEmpty && !meal.strMeasure1.isEmpty {
                Text("\(meal.strIngredient1) - \(meal.strMeasure1)")
            }
            if !meal.strIngredient2.isEmpty && !meal.strMeasure2.isEmpty {
                Text("\(meal.strIngredient2) - \(meal.strMeasure2)")
            }
            if !meal.strIngredient3.isEmpty && !meal.strMeasure3.isEmpty {
                Text("\(meal.strIngredient3) - \(meal.strMeasure3)")
            }
            if !meal.strIngredient4.isEmpty && !meal.strMeasure4.isEmpty {
                Text("\(meal.strIngredient4) - \(meal.strMeasure4)")
            }
            if !meal.strIngredient5.isEmpty && !meal.strMeasure5.isEmpty {
                Text("\(meal.strIngredient5) - \(meal.strMeasure5)")
            }
            if !meal.strIngredient6.isEmpty && !meal.strMeasure6.isEmpty {
                Text("\(meal.strIngredient6) - \(meal.strMeasure6)")
            }
            if !meal.strIngredient7.isEmpty && !meal.strMeasure7.isEmpty {
                Text("\(meal.strIngredient7) - \(meal.strMeasure7)")
            }
            if !meal.strIngredient8.isEmpty && !meal.strMeasure8.isEmpty {
                Text("\(meal.strIngredient8) - \(meal.strMeasure8)")
            }
            if !meal.strIngredient9.isEmpty && !meal.strMeasure9.isEmpty {
                Text("\(meal.strIngredient9) - \(meal.strMeasure9)")
            }
            if !meal.strIngredient10.isEmpty && !meal.strMeasure10.isEmpty {
                Text("\(meal.strIngredient10) - \(meal.strMeasure10)")
            }
            if !meal.strIngredient11.isEmpty && !meal.strMeasure11.isEmpty {
                Text("\(meal.strIngredient11) - \(meal.strMeasure11)")
            }
            if !meal.strIngredient12.isEmpty && !meal.strMeasure12.isEmpty {
                Text("\(meal.strIngredient12) - \(meal.strMeasure12)")
            }
            if !meal.strIngredient13.isEmpty && !meal.strMeasure13.isEmpty {
                Text("\(meal.strIngredient13) - \(meal.strMeasure13)")
            }
            if !meal.strIngredient14.isEmpty && !meal.strMeasure14.isEmpty {
                Text("\(meal.strIngredient14) - \(meal.strMeasure14)")
            }
            if !meal.strIngredient15.isEmpty && !meal.strMeasure15.isEmpty {
                Text("\(meal.strIngredient15) - \(meal.strMeasure15)")
            }
            if !meal.strIngredient16.isEmpty && !meal.strMeasure16.isEmpty {
                Text("\(meal.strIngredient16) - \(meal.strMeasure16)")
            }
            if !meal.strIngredient17.isEmpty && !meal.strMeasure17.isEmpty {
                Text("\(meal.strIngredient17) - \(meal.strMeasure17)")
            }
            if !meal.strIngredient18.isEmpty && !meal.strMeasure18.isEmpty {
                Text("\(meal.strIngredient18) - \(meal.strMeasure18)")
            }
            if !meal.strIngredient19.isEmpty && !meal.strMeasure19.isEmpty {
                Text("\(meal.strIngredient19) - \(meal.strMeasure19)")
            }
            if !meal.strIngredient20.isEmpty && !meal.strMeasure20.isEmpty {
                Text("\(meal.strIngredient20) - \(meal.strMeasure20)")
            }
        }
    }
}
