//
//  ViewController.swift
//  Potukuru_SecretCode
//
//  Created by Student on 3/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var GuessLBL: UILabel!
    @IBOutlet weak var GameLBL: UILabel!
    var tb:UITableView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tb = tableView
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: "row") as! UITableViewCell
        row.textLabel?.text = AppDelegate.mdl.Symbols[indexPath.row]
        return row
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.mdl.addSymbolToGuess(Symbol: AppDelegate.mdl.Symbols[indexPath.row])
        GuessLBL.text = AppDelegate.mdl.StatusForAGuess()
        GameLBL.text = AppDelegate.mdl.Status
        if AppDelegate.mdl.Guess.count == 4 {
            tableView.isUserInteractionEnabled = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetBTN(_ sender: Any) {
        tb?.isUserInteractionEnabled = true
        self.tb?.reloadData()
        GuessLBL.text = ""
        GameLBL.text = ""
        AppDelegate.mdl.reset()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

