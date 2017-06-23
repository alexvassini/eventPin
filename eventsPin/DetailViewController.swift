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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let master = self.splitViewController?.master as! MasterTableViewController
        
        master.delegate = self
        
        decidedPage = self.storyboard?.instantiateViewController(withIdentifier: "detailContentViewController") as? DetailContentViewController
        
        decidedPage?.view.backgroundColor = .red
        
        inspirationPage = self.storyboard?.instantiateViewController(withIdentifier: "detailContentViewController") as? DetailContentViewController
        
        
        self.pageViewController?.setViewControllers([decidedPage!], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController?.delegate = self
        self.pageViewController?.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
