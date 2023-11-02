//
//  MealListView.swift
//  Fetch-iOS-MealDB
//
//  Created by Jaswitha Reddy G on 11/1/23.
//

import SwiftUI

struct MealListView: View {
    @State private var dessertMeals: [Meal] = []
    @State private var filteredMeals: [Meal] = []
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(filteredMeals) { meal in
                    NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                        HStack {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                                switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                    case .failure(_):
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                    case .empty:
                                        ProgressView()
                                    @unknown default:
                                        EmptyView()
                                }
                            }
                            Text(meal.strMeal)
                        }
                    }
                }
                .navigationTitle("Dessert Meals")
            }
        }
        .onAppear {
            fetchDessertMeals()
        }
        .onChange(of: searchText) {
            filterMeals()
        }
    }

    func fetchDessertMeals() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealResponse.self, from: data)
                    dessertMeals = response.meals
                    filteredMeals = dessertMeals // Initial setup with unfiltered data
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }

    func filterMeals() {
        if searchText.isEmpty {
            filteredMeals = dessertMeals
        } else {
            filteredMeals = dessertMeals.filter {
                $0.strMeal.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
