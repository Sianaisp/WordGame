//
//  ViewController.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = WordViewModel()
    @IBOutlet weak var incorrectButton: UIButton!
    @IBOutlet private weak var gameView: UIView!
    @IBOutlet private weak var centerWord: UILabel!
    @IBOutlet private weak var fallingWord: UILabel!
    @IBOutlet private weak var roundLabel: UILabel!
    @IBOutlet weak var fallingView: UIView!
    @IBOutlet weak var resultsView: ResultsView!
    @IBOutlet private weak var scoreLabel: UILabel!
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDataFromAPIHandler(url: EndPoint.dictionaryUrl) { (_) in
            DispatchQueue.main.async {
                self.startGame()
            }
        }
    }
    
    private func startGame() {
        viewModel.resetScore()
        setNewWords()
    }
    
    @IBAction func correctTapped(_ sender: Any) {
        animator?.stopAnimation(true)
        if viewModel.isCorrectWord() {
            viewModel.incrementScore()
            showWin()
        } else {
            showFail()
        }
        checkScore()
    }
    
    @IBAction func incorrectTapped(_ sender: Any) {
        animator?.stopAnimation(true)
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
        updateLabels()
        centerWord.text = viewModel.getNewWord()?.english
        fallingWord.text = viewModel.getFallingWord()
        dropWord()
    }
    
    private func updateLabels() {
        scoreLabel.text = String(viewModel.score)
        roundLabel.text = String(viewModel.round)
    }
    
    private func showWin() {
        print("win")
    }
    
    private func showFail() {
        print("fail")
    }
    
    private func dropWord() {
        fallingView.center.y = -64
        animator = UIViewPropertyAnimator(duration: 6, curve: .easeOut) {
            self.fallingView.center.y = self.gameView.bounds.height + 64
        }
        animator?.addCompletion {_ in
            self.checkScore()
        }
        animator?.startAnimation()
    }
    
    private func checkScore() {
        if viewModel.round < 10 {
            setNewWords()
        } else {
            resultsView.alpha = 1
        }
    }
}

