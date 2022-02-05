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
    @IBOutlet weak var incorrectButton: UIButton!
    @IBOutlet private weak var gameView: UIView!
    @IBOutlet private weak var centerWord: UILabel!
    @IBOutlet private weak var fallingWord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDataFromAPIHandler(url: EndPoint.dictionaryUrl) { (_) in
            DispatchQueue.main.async {
                self.startGame()
            }
        }
    }
    
    @IBAction func correctTapped(_ sender: Any) {
        if viewModel.isCorrectWord() {
            viewModel.incrementScore()
            showWin()
        } else {
            showFail()
        }
        checkScore()
    }
    
    @IBAction func incorrectTapped(_ sender: Any) {
        if viewModel.isWrongWord() {
            viewModel.incrementScore()
            showWin()
        } else {
            showFail()
        }
        checkScore()
    }
    
    
    
    private func setNewWords() {
        viewModel.incrementRound()
        centerWord.text = viewModel.getNewWord()?.english
        fallingWord.text = viewModel.getFallingWord()
    }
    
    private func startGame() {
        viewModel.resetScore()
        setNewWords()
    }
    
    private func showWin() {
        print("win")
    }
    
    private func showFail() {
        print("fail")
    }
    
    private func checkScore() {
        if viewModel.round < 10 {
            setNewWords()
        } else {
            print("FINISHED")
        }
    }
}

