//
//  ViewController.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = WordViewModel()
    var dictionary = [Word]()
    @IBOutlet private weak var gameView: UIView!
    @IBOutlet private weak var centerWord: UILabel!
    @IBOutlet private weak var fallingWord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDataFromAPIHandler(url: EndPoint.dictionaryUrl) { (_) in
            DispatchQueue.main.async {
                self.setNewWords()
            }
        }
    }
    
    private func setNewWords() {
        centerWord.text = viewModel.getNewWord()?.english
        fallingWord.text = viewModel.getFallingWord()
    }
}

