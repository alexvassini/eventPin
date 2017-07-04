//
//  DetailViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 22/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , CategorySelectionDelegate, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    var pageViewController: UIPageViewController?
    
    var decidedPage: DetailContentViewController?
    var inspirationPage: DetailContentViewController?
    
    var category : Category?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let master = self.splitViewController?.master as! MasterTableViewController
        
        master.delegate = self
        
        decidedPage = self.storyboard?.instantiateViewController(withIdentifier: "detailContentViewController") as? DetailContentViewController
        
      
        
        inspirationPage = self.storyboard?.instantiateViewController(withIdentifier: "detailContentViewController") as? DetailContentViewController
        
        
        self.pageViewController?.setViewControllers([decidedPage!], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController?.delegate = self
        self.pageViewController?.dataSource = self
        
        self.navigationController?.navigationBar.barTintColor = DataModel.shared.settings.primaryColor
        self.navigationController?.navigationBar.isTranslucent = false
        
        segmentedControl.tintColor = DataModel.shared.settings.secondaryColor
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonValueChanged(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            pageViewController?.setViewControllers([decidedPage!], direction: .reverse, animated: true, completion: nil)
            print(segmentedControl.selectedSegmentIndex)
        }
        
        else {
            pageViewController?.setViewControllers([inspirationPage!], direction: .forward, animated: true, completion: nil)
        print(segmentedControl.selectedSegmentIndex)
        }
        
    }
    
    
    func categorySelected(_ category: Category) {
        
        print(category.tag)
        
        self.category = category
        
        decidedPage?.pinList = category.decided
        inspirationPage?.pinList = category.inspiration
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewController == inspirationPage {
            
            return decidedPage
        }
        
        else {
            return nil
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController == decidedPage {
            return inspirationPage
        }
            
        else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if !completed {
            return
        }
        
        if previousViewControllers.first == decidedPage {
        segmentedControl.selectedSegmentIndex = 1
        }
        
        else if previousViewControllers.first == inspirationPage {
            segmentedControl.selectedSegmentIndex = 0
        }
        
        
        
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "pageControllerSegue" {
            
            self.pageViewController = segue.destination as? UIPageViewController
            
            
            
        }
        
    }
    
    
    

}
