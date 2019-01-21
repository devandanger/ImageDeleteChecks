//
//  ViewController.swift
//  ImageDeleteChecks
//
//  Created by Evan Anger on 1/20/19.
//  Copyright © 2019 Mighty Strong Software. All rights reserved.
//

import UIKit
import DKImagePickerController
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var fileInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchNumberOfAssets()
    }
    
    @IBAction func openGallery(_ sender: Any) {
        let pickerController = DKImagePickerController()
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
        }
        
        self.present(pickerController, animated: true) {}
    }
    @IBAction func deleteSelected(_ sender: Any) {

    }
    
    @IBAction func refreshMedia(_ sender: Any) {
        fetchNumberOfAssets()
    }
    
    
    private func fetchNumberOfAssets() {
        let numberOfAssets =  PHAsset.fetchAssets(with: .image, options: nil).countOfAssets(with: .image)
        self.fileInfo.text = "Number of assets: \(numberOfAssets)"
    }
}

