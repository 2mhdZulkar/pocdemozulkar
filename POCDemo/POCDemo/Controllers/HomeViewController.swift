//
//  HomeViewController.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblUserId: UILabel!
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userid = self.viewModel.user?.userid{
            self.lblUserId.text = userid
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
}

