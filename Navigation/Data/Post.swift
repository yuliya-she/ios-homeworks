//
//  Post.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import Foundation
import UIKit
struct Post {
    static var title = "My post"
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
}

extension Post {
    
    static func make() -> [Post] {
    [
        Post(author: "natali.official", description: "Пион – удивительно красивый бутон, который издавна считается королем всех цветов", image: UIImage(named: "peoniesPost")!, likes: 129, views: 200),
        Post(author: "bestflowers.official", description: "Камелия – прекрасное нежное растение, цветы которого используют не только для составления букетов, но и для изготовления всевозможных украшений.", image: UIImage(named: "camellias")!, likes: 100, views: 150),
        Post(author: "julia.official", description: "Тюльпаны — типичные эфемероиды, приспособившиеся к жизни в засушливых местностях с жарким, безводным летом.", image: UIImage(named: "tulips")!, likes: 90, views: 100),
        Post(author: "dazies.official", description: "Ромашки – самый искренний и чистый символ любви.", image: UIImage(named: "dazies")!, likes: 67, views: 90)
    ]
    }
}
