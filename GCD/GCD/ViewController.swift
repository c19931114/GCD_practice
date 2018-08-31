//
//  ViewController.swift
//  GCD
//
//  Created by Crystal on 2018/8/31.
//  Copyright © 2018年 Crystal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setcell()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setcell() {
        
        let cellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "cell")
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as? MyTableViewCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController {
    
}

