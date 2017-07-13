//
//  CreateEditViewController.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 05/07/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit
import Photos
import AVKit
import DKImagePickerController
import CHTCollectionViewWaterfallLayout


class CreateEditViewController: UIViewController {
    
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var contentUIView: UIView!
   
    @IBOutlet weak var photoView: UIView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var addDataView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var tagsView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var assets: [DKAsset]?
    
    var dataSource = PhotosDataSource()
    
    let margin:CGFloat = 8.0
    let numberOfColumns:CGFloat = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        
        photoView.backgroundColor = Constants.generalBackgroundColor
        
        navigationBar.barTintColor = DataModel.shared.settings.primaryColor
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white]
        
        backgroundView.backgroundColor = DataModel.shared.settings.primaryColor

        
        segmentedControl.tintColor = DataModel.shared.settings.secondaryColor
        
        textField.backgroundColor = Constants.generalBackgroundColor
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupCollectionView(){
        
        let layout = CHTCollectionViewWaterfallLayout()
        
        layout.columnCount = Int(numberOfColumns)
        
        self.collectionView?.collectionViewLayout = layout
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        
        
        
    }

    
    @IBAction func createAndSavePins(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func textFieldDidChange(_ textField: UITextField) {
        print("editando...")
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let pickerController = DKImagePickerController()
        
        
        pickerController.assetType = .allPhotos
        
        pickerController.defaultSelectedAssets = self.dataSource.photoArray
        
        pickerController.didCancel = { ()
            print("didCancel")
        }
        
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            print("didSelectAssets")
            
            self.dataSource.photoArray = assets
            self.collectionView.reloadData()
            
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            pickerController.modalPresentationStyle = .formSheet
        }
        
        self.present(pickerController, animated: true) {}

        
        
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
