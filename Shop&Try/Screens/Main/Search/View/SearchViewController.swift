//
//  SearchViewController.swift
//  Shop&Try
//
//  Created by Eray on 2.11.2022.
//

import UIKit
import AlamofireImage

class SearchViewController: CAViewController {
    
    @IBOutlet var basketButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryControll: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    private var viewModel : SearchVM
    
    // Lists for searching
    var dataList: [Product] = []
    var filteredList : [Product] = []
    
    init(viewModel: SearchVM ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUI()
    }
    private func setupUI() {
        let nib = UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "productsCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        viewModel.fetchProducts()
        
        
    }
    
    @IBAction func showBasket(_ sender: Any) {
        let vm = BasketViewModel(viewModel.email)
        let vc = BasketViewController(viewModel: vm)
        navigationController?.present(vc, animated: true)
    }
    
   @IBAction func didValueChangedSegmentControl(_ sender: Any) {
       switch categoryControll.selectedSegmentIndex
       {
       case 0:
           viewModel.fetchProducts()
       case 1:
           viewModel.fetchElectronics()
       case 2:
           viewModel.fetchJewelery()

       case 3:
           viewModel.fetchMens()

       case 4:
           viewModel.fetchWomens()

       default:
           viewModel.fetchProducts()

     }
  }
    
}
// MARK: - CollectionView Extension

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          if !filteredList.isEmpty {return filteredList.count}else {return viewModel.numberOfRows}
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCollectionViewCell
        let product: Product
       
        if filteredList.isEmpty {
            product = viewModel.productForIndexPath(indexPath)!
        }else {
            product = filteredList[indexPath.row]
        }
       
        cell.priceLabel.text = "\(product.price ?? 0)"
        cell.productName.text = product.title
        let urlString: String = product.image ?? "https://live.staticflickr.com/65535/52439244120_eb00d487fd_c.jpg"
        let url = URL(string: urlString)!
        cell.image?.af.setImage(withURL: url)
        return cell
 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = self.view.frame.width/2.5
        let height = self.view.frame.width/2
           
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailsViewController()
        let product: Product
        if filteredList.isEmpty {
            product = viewModel.productForIndexPath(indexPath)!
        }else {
            product = filteredList[indexPath.row]
        }
        let vm = ProductDetailsViewModel.init(results: product, email: viewModel.email)
        vc.productDetailsViewModel = vm
        navigationController?.present(vc, animated: true)
    }
    
    
}

// MARK: - Searchbar Extension

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataList = viewModel.results
        filteredList = dataList.filter {$0.title!.lowercased().contains(searchText.lowercased())}
        collectionView.reloadData()
        
    }

}
// MARK: - SearchViewModelDelegate

extension SearchViewController : SearchViewModelDelegate {
    func didErrorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func didFetchProducts() {
        collectionView.reloadData()
    }
}
