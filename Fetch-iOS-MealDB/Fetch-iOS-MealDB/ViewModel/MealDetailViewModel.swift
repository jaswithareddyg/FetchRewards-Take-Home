import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    @Published var selectedMeal: MealDetail?

    func fetchMealDetail(for idMeal: String) {
        MealDetailService.fetchMealDetail(for: idMeal) { result in
            switch result {
            case .success(let response):
                self.selectedMeal = response.meals.first
            case .failure(let error):
                // Handle error
                print("Error fetching meal details: \(error)")
            }
        }
    }
}
