//
//  DetailContentViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 23/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout


class DetailContentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout{
    
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
        
        setupCollectionView()
        
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView(){
        
        let layout = CHTCollectionViewWaterfallLayout()
        
        layout.columnCount = Int(numberOfColumns)
        
        self.collectionView?.collectionViewLayout = layout
        
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
        
       
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(self.detailEdit(_:)), for: .touchUpInside)
        
       
        
        cell.pinImage.image = pin.image
        cell.pinDescription.text = pin.description
        
        return cell
    }
    
     func detailEdit(_ sender: UIButton){
        
        print(sender.tag)
        let alert = UIAlertController(title: "Titulo", message: "Mensagem", preferredStyle: .actionSheet)
        
         //TODO: Refatorar
        
        
        let indexPath = IndexPath(row: sender.tag, section:0)
        let cell = collectionView!.cellForItem(at: indexPath) as! PinCollectionViewCell
        
        alert.popoverPresentationController?.sourceView = cell.view
        alert.popoverPresentationController?.sourceRect = cell.button.frame
        
       
        
        self.present(alert, animated: true, completion: nil)
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
    
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // create a cell size from the image size, and return the size
       
        var size:CGSize = CGSize(width: 200.0, height: 325.0)
        
        let viewWidth = self.view.frame.width
        
        let pin = self.pinList[indexPath.row]
        
        //let imageHeight = pin.image?.size.height
        
        let label = NSString(string: pin.description ?? "")
        
        size.width = (viewWidth - (margin * (numberOfColumns+1))) / numberOfColumns
        
        let titleHeight : CGFloat = label.boundingRect(with: CGSize(width: CGFloat(size.width-16), height: 400),
                                                       options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                       attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 13)],
                                                       context: nil).height + 20
        
        print(titleHeight)
        
        size.height = titleHeight + size.width
     
        print(size.height)
       
        
        //TODO: Acertar a altura da imagem.
        
        
        return size

    }

}
