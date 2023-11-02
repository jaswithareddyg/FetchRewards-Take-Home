import Foundation
import Combine

// MARK: - MealService

class MealService {
    enum ServiceError: Error {
        case apiError
        case invalidResponse
        case invalidData
    }
    
    // MARK: Fetch Dessert Meals
    
    /// Fetches dessert meals from an API and returns a publisher with the results.
    ///
    /// - Returns: A publisher with meal category response or an error.
    
    static func fetchDessertMeals() -> AnyPublisher<MealCategoryResponse, Error> {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

        guard let url = URL(string: urlString) else {
            return Fail(error: ServiceError.apiError).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw ServiceError.invalidResponse
                }
                return data
            }
            .decode(type: MealCategoryResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

// MARK: - MealDetailService

class MealDetailService {
    
    // MARK: Fetch Meal Detail

    /// Fetches detailed information for a specific meal by its `idMeal` and returns a publisher with the results.
    ///
    /// - Parameter idMeal: The identifier of the meal to fetch.
    /// - Returns: A publisher with meal detail response or an error.
    
    static func fetchMealDetail(for idMeal: String) -> AnyPublisher<MealDetailResponse, Error> {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"

        guard let url = URL(string: urlString) else {
            return Fail(error: MealService.ServiceError.apiError).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw MealService.ServiceError.invalidResponse
                }
                return data
            }
            .decode(type: MealDetailResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
