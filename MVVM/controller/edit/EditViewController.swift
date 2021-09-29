//
//  EditViewController.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import UIKit

class EditViewController: BaseViewController {

    
    @IBOutlet weak var titleEdit: UITextField!
    
    @IBOutlet weak var bodyEdit: UITextField!
    
    @IBOutlet weak var IdEdit: UITextField!
    
    var viewModel = EditViewModel()
    var home = HomeViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

    @IBAction func EditButton(_ sender: Any) {
                   let nameTitle = titleEdit.text
                   let nameBody = bodyEdit.text
                   let nameId = IdEdit.text
                  
        self.viewModel.apiPostUptade(post: Post(title: nameTitle!, body: nameBody!, id: nameId!))
                   let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
                   self.navigationController?.pushViewController(homeView, animated: true)
                   
                   if nameTitle != nil && nameBody != nil {
                       titleEdit.text = nil
                       bodyEdit.text = nil
                   }
    }
    
}
