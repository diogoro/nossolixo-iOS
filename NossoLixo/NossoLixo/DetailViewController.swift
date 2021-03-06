//
//  DetailViewController.swift
//  NossoLixo
//
//  Created by Diogo Ribeiro de Oliveira on 20/04/18.
//  Copyright © 2018 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var categorySelect: Category? {
        didSet {
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = categorySelect {
            if let label = detailDescriptionLabel {
                label.text = detail.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

