//
//  WordViewModel.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import Foundation

class WordViewModel {
    
    typealias completion = ([Word]) -> ()
    private var pickedWord: Word?
    private var translationSuggestion: String?
    var apiHandler = APIHandler()
    var dictionary = [Word]()
    
    
    func getDataFromAPIHandler(url: String, completion: @escaping completion) {
        apiHandler.getData(withUrl: url) { [weak self] dictionary in
            self?.dictionary = dictionary
            completion(dictionary)
        }
    }
    
    func getNewWord() -> Word? {
        pickedWord = dictionary.randomElement()
        return pickedWord
    }
    
    func getFallingWord() -> String? {
        let translationOptions: [String] = [pickedWord?.spanish ?? "", dictionary.randomElement()?.spanish ?? ""]
        translationSuggestion = translationOptions.randomElement()
        return translationSuggestion
    }
}
