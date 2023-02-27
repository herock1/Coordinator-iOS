//
//  APIService.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 2/2/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->())

    func getAllCards(completion: @escaping (Result<[Card], Error>) -> Void)
}

class APIService: APIServiceProtocol {
    func getAllCards(completion: @escaping (Result<[Card], Error>) -> Void) {
        guard Reachability.isConnectedToNetwork(),
              let url = URL(string: Endpoint.cardList.url) else {
                  completion(.failure(APIError.noConnection))
                  return
              }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let cards = try JSONDecoder().decode(CardResponse.self, from: data)
                completion(.success(cards.data))
            } catch let error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }

        }.resume()
    }
    // Simulate a long waiting for fetching
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->() ) {
        DispatchQueue.global().async {
            sleep(3)
            let path = Bundle.main.path(forResource: "content", ofType: "json")!
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                do {
                    let photos = try decoder.decode(Photos.self, from: data)
                    complete( true, photos.photos, nil )
                } catch {
                }
            } catch {
            }
        }
    }
}

struct Photos: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let name: String
    let description: String?
    let createdat: Date
    let imageurl: String
    let forsale: Bool
    let camera: String?
}

struct CardResponse: Codable {
    let data: [Card]
}

struct Card: Codable {
    let id: Int
    let name: String
    let type: String
    let desc: String
    let atk: Int?
    let def: Int?
    let level: Int?
    let race: String
    let attribute: String?
    let archetype: String?
    let cardSets: [CardSet]?
    let cardImages: [CardImage]
    let cardPrices: [CardPrices]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case desc = "desc"
        case atk = "atk"
        case def = "def"
        case level = "level"
        case race = "race"
        case attribute = "attribute"
        case archetype = "archetype"
        case cardSets = "card_sets"
        case cardImages = "card_images"
        case cardPrices = "card_prices"
    }

}

struct CardSet: Codable {
    let setName: String
    let setCode: String
    let setRarity: String
    let setPrice: String

    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setPrice = "set_price"
    }
}

struct CardPrices: Codable {
    let market: String
    let player: String
    let ebay: String
    let amazon: String

    enum CodingKeys: String, CodingKey {
        case market = "cardmarket_price"
        case player = "tcgplayer_price"
        case ebay = "ebay_price"
        case amazon = "amazon_price"
    }
}

struct CardImage: Codable {
    let id: Int
    let imageURL: String
    let imageURLSmall: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
    }
}
