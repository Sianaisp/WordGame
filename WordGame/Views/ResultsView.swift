//
//  ResultsView.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import Foundation
import UIKit

class ResultsView: UIView {
    @IBOutlet private weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.alpha = 0
    }
    
    func configureView(score: Int) {
        messageLabel.text = "CONGRATULATIONS"
    }
    
    func hide() {
        UIView.animate(withDuration: 1,
                       animations: {self.alpha = 0.0},
                       completion: { _ in
            self.removeFromSuperview()
        })
    }
}
