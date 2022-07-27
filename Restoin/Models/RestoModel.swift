//
//  RestoModel.swift
//  Restoin
//
//  Created by Kozi on 27/07/22.
//

import UIKit

struct RestoModel: Decodable {
    let restaurants: [Restaurants]
}

struct Restaurants: Decodable {
    let id: String
    let name: String
    let description: String
    let pictureId: String
    let city: String
    let rating: Double
}

struct RestoManager {
    func fetchResto(completion: @escaping(RestoModel) -> Void) {
        guard let url = URL(string: "https://restaurant-api.dicoding.dev/list")
            else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Data tidak dapat ditampilkan: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder =  JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(RestoModel.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("error encoding")
            }
        }
        
        dataTask.resume()
    }
    
}
