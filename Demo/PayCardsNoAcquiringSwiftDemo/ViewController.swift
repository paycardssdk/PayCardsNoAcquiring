//
//  ViewController.swift
//  PayCardsNoAcquiringSwiftDemo
//
//  Created by Viktor Bespalov on 24/03/16.
//  Copyright © 2016 Pay.Cards. All rights reserved.
//

import UIKit
import PayCardsNoAcquiring

class ViewController: UIViewController, PCDCardScanViewControllerDelegete {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Properties
    
    var merchant: PCDMerchant {
        let _merchant = PCDMerchant()
        _merchant.ID = 1 // Your id
        _merchant.password = "pass" // Your password
        _merchant.clientId = "456" // Your client ID
        _merchant.email = "ololo@qq.ee" // Your email
        _merchant.phone = "" // Your phone
        return _merchant
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    
    @IBAction func presentPayCards(sender: AnyObject) {
        self.activityIndicator.startAnimating()
        PCDCardScanViewController.presentOnViewController(self, merchant: merchant, delegate: self) { (error) in
            self.activityIndicator.stopAnimating()
            
            if let error = error {
                self.infoLabel.text = "ERROR: \(error.localizedDescription)"
            }
        }
    }
    
    // MARK: - PCDCardScanViewControllerDelegete
    
    func cardScanViewController(cardScanViewController: PCDCardScanViewController!, didCloseWithError error: NSError!) {
        infoLabel.text = "ERROR: \(error?.localizedDescription)"
        cardScanViewController.dismissWithCompletion(nil)
    }
    
    func cardScanViewController(cardScanViewController: PCDCardScanViewController!, didFinishScanWithInfo cardInfo: [NSObject : AnyObject]!) {
        infoLabel.text = "CARD INFO: \(cardInfo[PCDCardParams])"
        cardScanViewController.dismissWithCompletion(nil)
    }
    
    func cardScanViewControllerUserDidClose(cardScanViewController: PCDCardScanViewController!) {
        infoLabel.text = "RECOGNITION CANCELED"
        cardScanViewController.dismissWithCompletion(nil)
    }
}

