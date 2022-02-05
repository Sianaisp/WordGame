//
//  APIHandler.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import Foundation

class APIHandler {
    
    typealias completion = ([Word]) -> ()
     
    func getData(withUrl url: String, completion: @escaping completion) {
        if let unwrappedUrl = URL(string: url) {
            URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                }
                if let data = data {
                let jsonDecoder =  JSONDecoder()
                    guard let dictionary =  try? jsonDecoder.decode([Word].self, from: data) else {
                        completion([])
                        return
                    }
                    completion(dictionary)
                }
            }).resume()
        }
    }
}
