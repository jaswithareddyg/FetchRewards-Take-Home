import SwiftUI

struct MealListView: View {
    @ObservedObject var mealListViewModel: MealListViewModel
    @State private var selectedMealID: String?

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $mealListViewModel.searchText)
                
                List {
                    ForEach(mealListViewModel.meals.filter {
                        $0.strMeal.lowercased().contains(mealListViewModel.searchText.lowercased()) || mealListViewModel.searchText.isEmpty
                    }, id: \.idMeal) { meal in
                        Button {
                            selectedMealID = meal.idMeal
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: meal.strMealThumb)!) {
                                    Text("Loading...")
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                
                                Text(meal.strMeal)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .sheet(isPresented: Binding<Bool>(
                get: { selectedMealID != nil },
                set: { _ in selectedMealID = nil }
            )) {
                if let meal = mealListViewModel.meals.first(where: { $0.idMeal == selectedMealID }) {
                    MealDetailView(idMeal: meal.idMeal)
                }
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MealListViewModel()
        return MealListView(mealListViewModel: viewModel)
    }
}
