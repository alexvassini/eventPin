//
//  CreateEditViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 05/07/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class CreateEditViewController: UIViewController {
    
    
    @IBOutlet weak var contentUIView: UIView!
   
    @IBOutlet weak var photoView: UIView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var addDataView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var tagsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentUIView.layer.cornerRadius = 10
        
        photoView.backgroundColor = Constants.generalBackgroundColor
        
        navigationBar.barTintColor = DataModel.shared.settings.primaryColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white]
        
        segmentedControl.tintColor = DataModel.shared.settings.secondaryColor
        
        textField.backgroundColor = Constants.generalBackgroundColor
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createAndSavePins(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func textFieldDidChange(_ textField: UITextField) {
        print("editando...")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //CreateAndEditVC

}
