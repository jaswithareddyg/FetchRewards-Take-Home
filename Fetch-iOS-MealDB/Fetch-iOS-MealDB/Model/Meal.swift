import Foundation


struct MealCategoryResponse: Decodable {
    let meals: [MealCategory]
}

struct MealCategory: Identifiable, Decodable {
    var id: String { // Conforming to Identifiable by using idMeal as the identifier
        return idMeal
    }
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}

struct MealDetail: Identifiable, Decodable {
    var id: String { // Conforming to Identifiable by using idMeal as the identifier
        return idMeal
    }
    
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    
    func ingredient(at index: Int) -> String {
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            if label == "strIngredient\(index)" {
                if let strValue = value as? String {
                    return strValue
                }
            }
        }
        return ""
    }

    func measure(at index: Int) -> String {
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            if label == "strMeasure\(index)" {
                if let strValue = value as? String {
                    return strValue
                }
            }
        }
        return ""
    }
}

//    let strIngredient1: String
//    let strIngredient2: String
//    let strIngredient3: String
//    let strIngredient4: String
//    let strIngredient5: String
//    let strIngredient6: String
//    let strIngredient7: String
//    let strIngredient8: String
//    let strIngredient9: String
//    let strIngredient10: String
//    let strIngredient11: String
//    let strIngredient12: String
//    let strIngredient13: String
//    let strIngredient14: String
//    let strIngredient15: String
//    let strIngredient16: String
//    let strIngredient17: String
//    let strIngredient18: String
//    let strIngredient19: String
//    let strIngredient20: String
//    let strMeasure1: String
//    let strMeasure2: String
//    let strMeasure3: String
//    let strMeasure4: String
//    let strMeasure5: String
//    let strMeasure6: String
//    let strMeasure7: String
//    let strMeasure8: String
//    let strMeasure9: String
//    let strMeasure10: String
//    let strMeasure11: String
//    let strMeasure12: String
//    let strMeasure13: String
//    let strMeasure14: String
//    let strMeasure15: String
//    let strMeasure16: String
//    let strMeasure17: String
//    let strMeasure18: String
//    let strMeasure19: String
//    let strMeasure20: String
