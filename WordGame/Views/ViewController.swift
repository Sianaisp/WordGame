//
//  ViewController.swift
//  WordGame
//
//  Created by Anais Plancoulaine on 05.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = WordViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDataFromAPIHandler(url: EndPoint.dictionaryUrl)
    }
}

