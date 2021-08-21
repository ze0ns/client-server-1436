//
//  DisplayPhotoCollectionViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//

import UIKit


final class DisplayPhotoViewController: UIViewController {

    let photosAPI = PhotosAPI()

    var photos: [Photo] = []
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    let reusableNIB = "photosCollectionViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем ячейку, созданную через xib
        let nib = UINib(nibName: reusableNIB, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reusableNIB)
        

        
        photosAPI.getPhotos{[weak self] users in
            self?.photos = users!
            self?.collectionView?.reloadData()


        }
       

        
    }


}
extension DisplayPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableNIB, for: indexPath) as! photosCollectionViewCell
        let photo = photos[indexPath.row]
        let urlImage = URL(string:photo.photo130)!
        if let data = try? Data(contentsOf: urlImage) {
            // Create Image and Update Image View
            cell.photosImage.image = UIImage(data: data)
        }

        return cell
    }

}
