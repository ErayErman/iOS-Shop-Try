import UIKit
import AlamofireImage

final class ProductsViewController: CAViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var viewModel : ProductsViewModelProtocol

    init(viewModel: ProductsViewModelProtocol ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        //viewModel.fetchProducts()
        
        setupUI()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "productsCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }



}

// MARK: - CollectionView Extension
extension ProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 //viewModel.numberOfRows
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCollectionViewCell
       // let product = viewModel.productForIndexPath(indexPath)
       // cell.priceLabel.text = String(describing: product?.price)
       // cell.productName.text = product?.title
       // let urlString: String = product?.image ?? "https://live.staticflickr.com/65535/52439244120_eb00d487fd_c.jpg"
       // let url = URL(string: urlString)!
       // cell.image?.af.setImage(withURL: url)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = self.view.frame.width
        let height = self.view.frame.width
           
        return CGSize(width: width, height: height)
    }
    
    
    
}

// MARK: - ProductsViewModelDelegate
extension ProductsViewController : ProductsViewModelDelegate {
    func didErrorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func didFetchProducts() {
        collectionView.reloadData()
    }
}
