//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Leslie Villalta on 4/8/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    var post: Post!
    
    override func viewDidLoad() {
           super.viewDidLoad()

           if let post = post {
               // Load the image using Nuke or URLSession
               if let photo = post.photos.first {
                   let url = photo.originalSize.url
                   Nuke.loadImage(with: url, into: detailImageView)
               }

               // Set the caption text and strip HTML tags
               captionTextView.text = post.summary.trimHTMLTags()  // Use UITextView to display the caption
               
               captionTextView.sizeToFit()
               
               captionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
           }
       }
    
}

