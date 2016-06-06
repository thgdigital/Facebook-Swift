//
//  ViewController.swift
//  facebookfeed2
//
//  Created by Admin on 17/05/16.
//  Copyright © 2016 THG Digital. All rights reserved.
//

import UIKit

let cellId = "cellId"

let posts = Posts()


class FeedController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Facebook Feed"
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
            
        return feedCell
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText{
           
            let rect = NSString(string: statusText).boundingRectWithSize(CGSizeMake(view.frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)], context: nil)
            
            let contasHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
        return CGSizeMake(view.frame.width, rect.height + contasHeight + 24)
        }
        
        return CGSizeMake(view.frame.width, 500)
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }

}


