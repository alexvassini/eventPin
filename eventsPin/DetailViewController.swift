//
//  DetailViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 22/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , CategorySelectionDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let master = self.splitViewController?.master as! MasterTableViewController
        
        master.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func categorySelected(_ category: Category) {
        print(category.tag)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
