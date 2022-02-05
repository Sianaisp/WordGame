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
    private var apiHandler = APIHandler()
    private var dictionary = [Word]()
    private var score: Int = 0
    var round: Int = 1
    
    
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
    
    
    func resetScore() {
        score = 0
        round = 1
    }
    
    func isCorrectWord() -> Bool {
        translationSuggestion == pickedWord?.spanish
    }
    
    func isWrongWord() -> Bool {
        translationSuggestion != pickedWord?.spanish
    }
    
    func incrementScore() {
        score += 1
    }
    
    func incrementRound() {
        round += 1
    }
}
