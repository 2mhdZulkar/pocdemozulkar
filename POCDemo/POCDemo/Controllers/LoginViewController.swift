//
//  LoginViewController.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtUserId.text = "123"
        self.txtUserPassword.text = "123"
        /// Delegate the protocol
        viewModel.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
        
        viewModel.login(userid: txtUserId.text, password: txtUserPassword.text)
    }
    
    
}
extension LoginViewController: LoginResultProtocol {
    
    
    
    func success(user: User) {
        self.viewModel.user = user
        self.performSegue(withIdentifier: SegueIdentifier.navigateToUserDashboard, sender: nil)
    }
    
    func error(error: String) {
       
        showPopup(isSuccess: false,message :error)
    }
    
    func showPopup(isSuccess: Bool, message:String) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error",
                                          message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.navigateToUserDashboard {
            if let destinationVC = segue.destination as? HomeViewController {
                destinationVC.viewModel.user = self.viewModel.user
            }
        }
    }
}


