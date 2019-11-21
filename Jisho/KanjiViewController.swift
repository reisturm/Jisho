//
//  KanjiViewController.swift
//  JSON
//
//  Created by Rei Sturm on 11/18/19.
//  Copyright © 2019 Rei Sturm. All rights reserved.
//

import UIKit

class KanjiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var userInput = ""
    var myData = [[String: Any]]()
    var illegalChars: Set<String> = ["<", ">", "%", "}", "}", "|", "\\", "^", "~", "[", "]", "`"]
    var count1 = 0
    var count2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Results for " + userInput
        
        //sanitize input
        for elem in userInput {
            if illegalChars.contains(String(elem)){
                print("Illegal Character Detected")
                userInput = ""
                break
            } else if String(elem) == "“" {
                count1 += 1
            } else if String(elem) == "”" {
                count2 += 1
            }
        }
        
        if count1 > 1 || count2 > 1 {
            print("Too many quotations")
            userInput = ""
        }
        
        //deal with double quotes
        if userInput.contains("“") || userInput.contains("”") {
            let indexStartOfText = userInput.index(userInput.startIndex, offsetBy:1)
            let indexEndOfText = userInput.index(userInput.endIndex, offsetBy: -1)
            let substring = userInput[indexStartOfText..<indexEndOfText]
            userInput = "%22" + substring + "%22"
        } else {
            userInput = userInput.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        }
        
        let url = URL(string: "https://jisho.org/api/v1/search/words?keyword=" + userInput)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.myData = dataDictionary["data"] as! [[String : Any]]
            //print(self.myData)
            self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func addingPercentEncoding(withAllowedCharacters allowedCharacters: CharacterSet) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KanjiCell") as! KanjiCell
        
        if let japanese = myData[indexPath.row]["japanese"] as? [[String: String]] {
            let word = japanese[0]["word"]
            let reading = japanese[0]["reading"]
            //print(word)
            //print(reading)
            if (word == nil) {
                cell.hiragana.text = ""
                cell.Kanji.text = reading
            }
            else {
                cell.hiragana.text = reading
                cell.Kanji.text = word
            }
            
            cell.hiragana.adjustsFontSizeToFitWidth = true
            cell.Kanji.adjustsFontSizeToFitWidth = true
        }
        if let senses = myData[indexPath.row]["senses"] as? [[String: [Any]]] {
            let english = senses
            //print(english)
            if let eng_def = english[0]["english_definitions"] as? [String] {
                let ans = eng_def
                var defs = ""
                for i in 0...ans.count - 1 {
                    defs = defs + "\(i + 1)) \(ans[i])\n"
                }
                cell.definitions.text = defs
                cell.definitions.adjustsFontSizeToFitWidth = true
            }
        }
        return cell
    }
}
