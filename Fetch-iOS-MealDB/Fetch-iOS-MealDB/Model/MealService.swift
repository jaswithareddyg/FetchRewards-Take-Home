import Foundation
import Combine

class MealService {
    enum ServiceError: Error {
        case apiError
        case invalidResponse
        case invalidData
    }

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

class MealDetailService {
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
