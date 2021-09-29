//
//  CreateViewController.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import UIKit

class CreateViewController: BaseViewController {

    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    var viewModel = CreateViewModel()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    
    
        
        
    @IBAction func AddButton(_ sender: Any) {
        let nameTitle = titleText.text
        let nameBody = bodyText.text
        self.viewModel.apiPostCreate(post: Post(title: nameTitle!, body: nameBody!))
                   
                   let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
                   self.navigationController?.pushViewController(homeView, animated: true)
                   
                   if nameTitle != nil && nameBody != nil {
                       titleText.text = nil
                       bodyText.text = nil
                   }
     
        
    }
}
