//
//  APIClient.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 14/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import Foundation
import MapKit


class APIClient {
    
    static func getInfo(completion: @escaping (User?) -> ()) {
        var request = URLRequest(url: URL(string: "https://d-pay.mybluemix.net/api/search")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            if let jsonData = data {
                let decoder = JSONDecoder()
                do {
                    
                    let user = try decoder.decode(User.self, from: jsonData)
                    completion(user)
                } catch {
                    completion(nil)
                }
            }
        }.resume()
    }
}
