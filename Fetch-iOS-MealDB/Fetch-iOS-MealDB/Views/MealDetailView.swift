import SwiftUI

/// A view displaying detailed information about a specific meal.
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
                    // Display meal title
                    Text(selectedMeal.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 8)
                    
                    // Display meal image centered on the page
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: selectedMeal.strMealThumb)!) {
                            Text("Loading Image...")
                                .foregroundColor(.gray)
                        }
                        .frame(width: 200, height: 200)
                        .cornerRadius(8)
                        Spacer()
                    }
                    
                    // Display Ingredients and Measures section
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    MealDetailContent.displayIngredientsAndMeasures(for: selectedMeal)

                    // Display meal instructions
                    if !selectedMeal.strInstructions.isEmpty {
                        Text("Instructions:")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(selectedMeal.strInstructions)
                            .padding(.bottom, 8)
                    }
                }
                .padding()
            }
        } else {
            Text("Loading...")
        }
    }
}

/// A preview for the MealDetailView.
struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(idMeal: "52860")
    }
}
