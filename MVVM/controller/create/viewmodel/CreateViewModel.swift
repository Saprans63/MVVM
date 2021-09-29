//
//  CreateViewModel.swift
//  MVVM
//
//  Created by Apple user on 28/09/21.
//

import Foundation
import Bond


class CreateViewModel {
    var controller: BaseViewController!
    let itemss = Observable<[Post]>([])
    var homeview = HomeViewModel()

    
    func apiPostCreate(post: Post) {
       
           AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
        
               switch response.result {
               case .success:
                   print(response.result)
                self.homeview.apiPostList()
               case let .failure(error):
                   print(error)
               }
           })
       }

    
}


