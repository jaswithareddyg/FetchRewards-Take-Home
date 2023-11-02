import SwiftUI

struct MealDetailView: View {
    @ObservedObject var mealDetailViewModel: MealDetailViewModel
    let idMeal: String
    
    init(idMeal: String) {
        self.idMeal = idMeal
        self.mealDetailViewModel = MealDetailViewModel()
        self.mealDetailViewModel.fetchMealDetail(for: idMeal)
    }

    var body: some View {
        if let selectedMeal = mealDetailViewModel.selectedMeal {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(selectedMeal.strMeal)
                        .font(.title)
                        .padding(.bottom, 8)
                    
                    AsyncImage(url: URL(string: selectedMeal.strMealThumb)!) {
                        Text("Loading Image...")
                            .foregroundColor(.gray)
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(8)

                    if !selectedMeal.strInstructions.isEmpty {
                        Text("Instructions:")
                            .fontWeight(.bold)
                        Text(selectedMeal.strInstructions)
                            .padding(.bottom, 8)
                    }

                    ForEach(1...20, id: \.self) { index in
                        if !selectedMeal.ingredient(at: index).isEmpty && !selectedMeal.measure(at: index).isEmpty {
                            Text("\(selectedMeal.ingredient(at: index)) - \(selectedMeal.measure(at: index))")
                        }
                    }
                }
                .padding()
            }
        } else {
            Text("Loading...")
        }
    }
    
    func printDetails(_ selectedMeal: MealDetail) {
        print("Meal ID: \(selectedMeal.idMeal)")
        print("Meal Name: \(selectedMeal.strMeal)")
        print("Meal Category: \(selectedMeal.strCategory)")
        // ... print other properties

        // Loop through ingredients and measures
        for index in 1...20 {
            let ingredient = selectedMeal.ingredient(at: index)
            let measure = selectedMeal.measure(at: index)
            if !ingredient.isEmpty && !measure.isEmpty {
                print("Ingredient \(index): \(ingredient) - Measure: \(measure)")
            }
        }

        print("Instructions: \(selectedMeal.strInstructions)")
    }
}


struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return MealDetailView(idMeal: "52860")
    }
}
