//
//  HomeViewController.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var tableView: UITableView!
   
    var viewModel = HomeViewModel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
              }

              // MARK: - Method
              
        func initViews(){
                tableView.dataSource = self
                tableView.delegate = self
                initNavigation()
                bindViewModel()
                viewModel.apiPostList()
           
              }
    
    func bindViewModel() {
        viewModel.controll = self
        viewModel.items.bind(to: self) { strongSelf, _ in
            strongSelf.tableView.reloadData()
        }
    }
              
              func initNavigation(){
                  let refresh = UIImage(named: "ic_refresh")
                  let add = UIImage(named: "ic_add")
                  
                  navigationItem.leftBarButtonItem = UIBarButtonItem(image: refresh, style: .plain, target: self, action: #selector(leftTapped))
                  navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
                  title = "MVVM Pattern"
                  
              }
              
              func callCreateViewController(){
                  let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
                  self.navigationController?.pushViewController(vc, animated: true)
              }
              
              func callEditViewController(){
                 // let vc = EditViewController(nibName: "EditViewController", bundle: nil)
                 // let navigationController = UINavigationController(rootViewController: vc)
                 // self.present(navigationController, animated: true, completion: nil)
                  
                  let homeView = EditViewController(nibName: "EditViewController", bundle: nil)
                  self.navigationController?.pushViewController(homeView, animated: true)
              }
              
              // MARK: - Action
              
              @objc func leftTapped(){
                viewModel.apiPostList()
              }
              
              @objc func rightTapped(){
                  callCreateViewController()
              }
              
              // MARK: - Table View
              
              func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return viewModel.items.value.count
              }
              
              func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  let item = viewModel.items.value[indexPath.row]
                  
                  let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as! PostTableViewCell
                  
                  cell.titleLable.text = item.title
                  cell.bodyLable.text = item.body
                  
                  return cell
              }

              func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                  return UISwipeActionsConfiguration(actions: [
                      makeCompleteContextualAction(forRowAt: indexPath, post: viewModel.items.value[indexPath.row])
                  ])
              }

              func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                  return UISwipeActionsConfiguration(actions: [
                      makeDeleteContextualAction(forRowAt: indexPath, post: viewModel.items.value[indexPath.row])
                  ])
              }
              
              //MARK: - Contextual Actions
              private func makeDeleteContextualAction(forRowAt indexPath: IndexPath, post: Post) -> UIContextualAction {
                  return UIContextualAction(style: .destructive, title: "Delete") { [self] (action, swipeButtonView, completion) in
                      print("DELETE HERE")
                    self.viewModel.apiPostDelete(post: post, handler: {isDelated in
                        if isDelated{
                            self.viewModel.apiPostList()
                        }
                    })
                      completion(true)
                     
                  }
              }

              private func makeCompleteContextualAction(forRowAt indexPath: IndexPath, post: Post) -> UIContextualAction {
                  return UIContextualAction(style: .normal, title: "Edit") { (action, swipeButtonView, completion) in
                      print("COMPLETE HERE")
                      completion(true)
                     self.callEditViewController()
                      
                      
                  }
              }
            
          }
