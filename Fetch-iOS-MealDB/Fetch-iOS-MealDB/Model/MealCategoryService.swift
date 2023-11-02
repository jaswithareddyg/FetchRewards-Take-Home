import Foundation
import Combine

class MealService {
    enum ServiceError: Error {
        case apiError
        case invalidResponse
        case invalidData
    }

    static func fetchDessertMeals(completion: @escaping (Result<MealCategoryResponse, Error>) -> Void) {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

        guard let url = URL(string: urlString) else {
            completion(.failure(ServiceError.apiError))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(ServiceError.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(ServiceError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let mealsResponse = try decoder.decode(MealCategoryResponse.self, from: data)
                completion(.success(mealsResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


class MealDetailService {
    static func fetchMealDetail(for idMeal: String, completion: @escaping (Result<MealDetailResponse, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"

        guard let url = URL(string: urlString) else {
            completion(.failure(MealService.ServiceError.apiError))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(MealService.ServiceError.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(MealService.ServiceError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let mealDetailResponse = try decoder.decode(MealDetailResponse.self, from: data)
                completion(.success(mealDetailResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
