//
//  DetailContentViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 23/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class DetailContentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pinList: [Pin] = [] {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    let margin:CGFloat = 8.0
    let numberOfColumns:CGFloat = 3.0
    
    @IBOutlet var collectionMarginConstraints: [NSLayoutConstraint]!
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        for constrain in collectionMarginConstraints {
            
            constrain.constant = margin
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pinList.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pinCollectionViewCell", for: indexPath) as! PinCollectionViewCell
    
        let pin = pinList[indexPath.row]
        
        cell.pinImage.image = pin.image
        cell.pinDescription.text = pin.description
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewWidth = self.view.frame.width
        
        var size:CGSize = CGSize(width: 200.0, height: 325.0)
        
        size.width = (viewWidth - (margin * (numberOfColumns+1))) / numberOfColumns
        
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
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
