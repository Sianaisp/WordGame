//
//  APIHandler.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import Foundation

class APIHandler {
     
    func getData(withUrl url: String) {
        if let unwrappedUrl = URL(string: url) {
            URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                }
                if let data = data {
                let jsonDecoder =  JSONDecoder()
                let dictionary =  try? jsonDecoder.decode([Word].self, from: data)
                    print(dictionary![0].spanish)
                }
            }).resume()
        }
    }
}
