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
    
    let client = APIClient()
    var info = ["吃飯", "睡覺", "打東東"]
    
    let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setcell()
        groupPrint()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setcell() {
        
        let cellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "cell")
    }
    
    func groupPrint() {
        
        dispatchGroup.enter()
        client.getName { (name, error) in
            
            if let error = error {
                
                print(error)
                self.dispatchGroup.leave()
            } else {
                
                guard let name = name else { return }
                self.info[0] = name
                self.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        client.getAddress { (address, error) in
            
            if let error = error {
                
                print(error)
                self.dispatchGroup.leave()
            } else {
                
                guard let address = address else { return }
                self.info[1] = address
                self.dispatchGroup.leave()
                
            }
        }
        
        dispatchGroup.enter()
        client.getHead { (head, error) in
            
            if let error = error {
                
                print(error)
                self.dispatchGroup.leave()
            } else {
                
                guard let head = head else { return }
                self.info[2] = head
                self.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            
            print("All functions complete 👍")
            self.myTableView.reloadData()
        }
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
            
            //let cellIndexPath = info[indexPath.row]
            
            cell.infoLabel.text = info[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ViewController {
    
}

