//
//  MasterTableViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 21/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

protocol CategorySelectionDelegate {
    
    func categorySelected(_ category:Category)
    
}

class MasterTableViewController: UITableViewController {
    
    
    var categories : [Category] = []
    
    var delegate:CategorySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = DataModel.shared.categories
        
        self.navigationController?.navigationBar.barTintColor = DataModel.shared.settings.primaryColor
        self.navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.view.backgroundColor = Constants.generalBackgroundColor
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryViewCell

        let category = categories[indexPath.row]
        
        cell.tagLabel.text = category.tag
        cell.counterLabel.text = String(category.count)
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        delegate?.categorySelected(category)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
