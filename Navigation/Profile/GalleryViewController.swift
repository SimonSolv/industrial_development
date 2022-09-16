import UIKit
import SnapKit
import iOSIntPackage

class GalleryViewController: UIViewController {

    let imageFilter = ImageProcessor()
    
    let galleryView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private func setupViews() {

        view.addSubview(galleryView)

        galleryView.dataSource = self
        galleryView.delegate = self
        galleryView.reloadData()
        
        galleryView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.leading.equalTo(view.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo gallery"
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        setupViews()
        print("Time: \(processImagesHW(filter: imageFilter))")
//        let stringSter = "UserInteractive Time: 0.000270167, UserInitiated Time: 0.000105833, Default Time: 0.000105917, Background Time: 0.000252, Utility Time: 0.0003985 "

    }
    
    func processImagesHW(filter: ImageProcessor)  -> Double {
        var imagesForProcessing: [UIImage] = []
        for i in 0...PhotoStorage.photoGrid.count - 1 {
            imagesForProcessing.append(PhotoStorage.photoGrid[i].image)
        }
        let start = DispatchTime.now()
        filter.processImagesOnThread(sourceImages: imagesForProcessing, filter: .chrome, qos: .default, completion:  { (images: [CGImage?]) in () })
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000
        return timeInterval
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Photo gallery"
    }

}
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoStorage.photoGrid.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.sourse = PhotoStorage.photoGrid[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(view.bounds.width - 8 * 4)/3, height: (view.bounds.width - 8 * 4)/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8.0)
    }

}
