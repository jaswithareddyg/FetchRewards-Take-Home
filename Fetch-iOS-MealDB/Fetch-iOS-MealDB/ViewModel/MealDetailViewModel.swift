import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    @Published var selectedMeal: MealDetail?

    private var cancellable: AnyCancellable?

    func fetchMealDetail(for idMeal: String) {
        cancellable = MealDetailService.fetchMealDetail(for: idMeal)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] response in
                self?.selectedMeal = response.meals.first
            }
    }
}
