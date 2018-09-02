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
    
    var semaphore = DispatchSemaphore(value: 1)
    // If you do this in the main thread (value: 0), the whole app will maybe freeze

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setcell()
        asyncPrint()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setcell() {
        
        let cellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "cell")
    }
    
    func asyncPrint() {
        
        DispatchQueue.global().async {
            
            print("---------------------------")
            print(">>>>>>>>>>>> wait get name")
            print("---------------------------")
            self.semaphore.wait()

            self.client.getName { (name, error) in
                
                if let error = error {
                    
                    print(error)
                    self.semaphore.signal()
                } else {
                    
                    guard let name = name else { return }
                    self.info[0] = name
                    self.myTableView.reloadData()
                    
                    print("---------------------------")
                    print(">>>>>>>>>>>> get name")
                    print("---------------------------")
                    self.semaphore.signal()
                    
                }
            }
            
            print("---------------------------")
            print(">>>>>>>>>>>> wait get address")
            print("---------------------------")
            self.semaphore.wait()
            
            
            self.client.getAddress { (address, error) in
                
                if let error = error {
                    
                    print(error)
                    self.semaphore.signal()
                } else {
                    
                    guard let address = address else { return }
                    self.info[1] = address
                    self.myTableView.reloadData()
                    
                    print("---------------------------")
                    print(">>>>>>>>>>>> get address")
                    print("---------------------------")
                    self.semaphore.signal()
                    
                }
            }
            
            print("---------------------------")
            print(">>>>>>>>>>>> wait get head")
            print("---------------------------")
            self.semaphore.wait()
            
            self.client.getHead { (head, error) in
                
                if let error = error {
                    
                    print(error)
                } else {
                    
                    guard let head = head else { return }
                    self.info[2] = head
                    self.myTableView.reloadData()
                }
            }
            
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
                        
            cell.infoLabel.text = info[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
}

