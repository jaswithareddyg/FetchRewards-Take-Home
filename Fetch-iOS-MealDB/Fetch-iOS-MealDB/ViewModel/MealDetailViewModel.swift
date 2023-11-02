import Foundation
import Combine

/// View model responsible for handling meal details in the app.
class MealDetailViewModel: ObservableObject {
    /// The selected meal for display.
    @Published var selectedMeal: MealDetail?

    private var cancellable: AnyCancellable?

    /// Fetches meal details for a given ID.
    /// - Parameters:
    ///   - idMeal: The identifier for the meal.
    func fetchMealDetail(for idMeal: String) {
        cancellable = MealDetailService.fetchMealDetail(for: idMeal)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] response in
                self?.selectedMeal = response.meals.first
            }
    }
}
