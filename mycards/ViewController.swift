//
//  ViewController.swift
//  mycards
//
//  Created by Andrew Rudenko on 28.09.17.
//  Copyright © 2017 Andrew Rudenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    class Word: CustomStringConvertible {
        let word: String
        let definition: String
        var okCount = 0
        var failCount = 0
        var lastOk: Date?
        var lastFail: Date?
        
        init(word: String, definition: String) {
            self.word = word
            self.definition = definition
        }
        
     var description: String {
            get {
                return "Word{\(word) = \(definition); ok: \(okCount) (last at \(String(describing: lastOk))); fail: \(failCount) (last at \(String(describing: lastFail)))}"
            }
        }
    }
    var collection = [Word(word: "hello", definition: "greeting"),
                      Word(word: "bye", definition: "досвидос")]
    var currentCollection: [Word] = []
    var current: Word?

    @IBAction func rightSwipe(_ sender: Any) {
        current?.failCount += 1
        current?.lastFail = Date()
        print(current!)
        nextWord()
    }
    @IBAction func leftSwipe(_ sender: Any) {
        current?.okCount += 1
        current?.lastOk = Date()
        print(current!)
        nextWord()
    }
    @IBOutlet weak var currentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextWord()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func nextWord() {
        if currentCollection.count == 0 {
            currentCollection = collection
        }
        current = currentCollection.first
        currentLabel.text = current!.word
        currentCollection.removeFirst()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//    }


}

