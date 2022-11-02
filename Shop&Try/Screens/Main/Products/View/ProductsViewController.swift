import UIKit

final class ProductsViewController: CAViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    private var viewModel : ProductsViewModelProtocol

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
        viewModel.fetchProducts()
        
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
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = self.view.frame.width/2.5
        let height = self.view.frame.width/3
           
        return CGSize(width: width, height: height)
    }
    
    
    
}

// MARK: - ProductsViewModelDelegate
extension ProductsViewController : ProductsViewModelDelegate {
    func didErrorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func didFetchProducts() {
        print("PRODUCTS FETCHED!")
    }
}
