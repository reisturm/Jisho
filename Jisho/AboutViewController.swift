//
//  AboutViewController.swift
//  JSON
//
//  Created by Rei Sturm on 11/19/19.
//  Copyright © 2019 Rei Sturm. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var about: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        about.text = "Jisho is a powerful Japanese-English dictionary. It lets you find words, kanji, example sentences and more quickly and easily. Enter any Japanese text or English word in the search box and Jisho will search a myriad of data for you.\n\n Searching can be done in a variety of ways:\n\n1) Search the romanized (Romaji) form of the word\n\n2) Search for English words by surrounding the query in double quotes (i.e. \"hello\")\n\n3) Search for the Japanese word\n\nDisclaimer: Jisho was created by Kim Ahlström, Miwa Ahlström and Andrew Plummer. I do not claim any rights to this product. This application was for learning purposes only. For more information, please see https://jisho.org/about"
        about.adjustsFontSizeToFitWidth = true
    }
}
