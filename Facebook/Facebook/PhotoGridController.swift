//
//  PhotoGridController.swift
//  Facebook
//
//  Created by Mohamed Samaha on 03/08/2021.
//

import Foundation
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "3"))
    
    override func setupViews() {
        backgroundColor = .yellow
        stack(imageView)
    }
}
class PhotosGridController: LBTAListController<PhotoGridCell, String>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        self.items = ["2", "3", "4", "1","3"]
    }
    let cellspacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 || indexPath.item == 1 {
            
            let width = (view.frame.width - 3 * cellspacing) / 2
            
            return .init(width: width, height: width)
        }
//        4.1 math hack for the cell
        let width = (view.frame.width - 4.1 * cellspacing) / 3
        
        return .init(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellspacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellspacing, bottom: 0, right: cellspacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellspacing
    }
}

struct PhotosGridPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
        
    }
    
    // to convert the UIkit scene like swiftUI scene instead of main storyboard
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotosGridPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: PhotosGridPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PhotosGridPreview.ContainerView>) {
    
        }
    }
    
}


