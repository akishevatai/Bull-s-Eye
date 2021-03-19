//
//  AboutUIViewController.swift
//  Bull's Eye
//
//  Created by Atai Akishev on 8/20/20.
//  Copyright © 2020 Atai Akishev. All rights reserved.
//

import UIKit
import WebKit

class AboutUIViewController: UIViewController {
        
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
        let request = URLRequest(url: url)
            webView.load(request)  // URL -> Uniform Resource Locator
        }
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
