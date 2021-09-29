//
//  EditViewModel.swift
//  MVVM
//
//  Created by Apple user on 29/09/21.
//

import Foundation
import Bond



class EditViewModel {
    var controll: BaseViewController!
    let items = Observable<[Post]>([])
    var homeview = HomeViewModel()
    
    
    
    func apiPostUptade(post: Post) {
      
              AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: {response in
            
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
