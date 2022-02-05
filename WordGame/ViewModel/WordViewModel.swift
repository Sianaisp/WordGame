//
//  WordViewModel.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import Foundation

class WordViewModel {
    
    var apiHandler = APIHandler()
    func getDataFromAPIHandler(url: String) {
        apiHandler.getData(withUrl: url)
    }
}
