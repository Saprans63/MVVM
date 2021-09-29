//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import Foundation
import Bond

class HomeViewModel {
    var controll: BaseViewController!
    let items = Observable<[Post]>([])
    
    func apiPostList(){
  
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
   
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.items.value = posts
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostDelete(post:Post, handler: @escaping (Bool)-> Void){
      
        AFHttp.del(url: AFHttp.API_POST_DELETE + post.id!, params: AFHttp.paramsEmpty(), handler: {response in
       
            switch response.result {
            case .success:
                print(response.result)
               handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}
