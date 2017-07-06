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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor.gray .withAlphaComponent(0.85)
        
        //contentUIView.layer.shadowColor = UIColor.black.cgColor
       // contentUIView.layer.shadowOpacity = 0.6
       // contentUIView.layer.shadowOffset = CGSize(width: 4, height: 8)
      //  contentUIView.layer.shadowRadius = 8
      //  contentUIView.layer.shouldRasterize = false
        contentUIView.layer.cornerRadius = 10
        
        contentUIView.backgroundColor = Constants.generalBackgroundColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
