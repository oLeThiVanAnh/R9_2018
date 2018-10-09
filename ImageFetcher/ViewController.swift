//
//  ViewController.swift
//  ImageFetcher
//
//  Created by vananh on 10/8/18.
//  Copyright © 2018 vananh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    
    let imageFetcher: ImageSizeFetcher = ImageSizeFetcher()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onFetchButtonTouched(_ sender: Any) {
        let imageURL: URL = URL(string: urlTextField.text!)!;
        imageFetcher.sizeFor(atURL: imageURL) { (err, result) in                
            DispatchQueue.main.async {
                self.resultLable.text = NSStringFromCGSize((result?.size)!);
            }
        }
        
    }
}

