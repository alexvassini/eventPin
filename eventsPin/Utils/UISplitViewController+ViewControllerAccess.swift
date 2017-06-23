
import Foundation
import UIKit


extension UISplitViewController {
    
    var master : UIViewController? {
        
        let view = self.viewControllers.first
        
        if view is UINavigationController {
            let navigation = view as! UINavigationController
            
            return navigation.viewControllers.first
        }
            
        else {
            return view
        }
    }
    
    var detail : UIViewController? {
        
        var view : UIViewController?
        
        if self.viewControllers.count > 1 {
            
            view = self.viewControllers[1]
            
            if view is UINavigationController {
                let navigation = view as! UINavigationController
                
                return navigation.viewControllers.first
            }
            else {
                return view
            }
        }
            
        else {
            return nil
        }
    }
}
