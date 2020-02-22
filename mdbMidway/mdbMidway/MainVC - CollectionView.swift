//
//  MainVC - CollectionView.swift
//  mdbMidway
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
            as! MainVCCollectionViewCell

        cell.instaCaption?.image = arrayOfPosts[index].image
        cell.instaCaption?.text = arrayOfPosts[index].caption
        cell.instaName?.text = arrayOfPosts[index].name
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(2 - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
        if (grid == false) {
            return CGSize(width: size*2, height: size)
        }
        return CGSize(width: size, height: size-20)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }



}
