//
//  RestaurantListingTableViewController.swift
//  Foodsie
//
//  Created by Cons Bulaqueña on 18/05/2018.
//  Copyright © 2018 consios. All rights reserved.
//

import UIKit
import FirebaseFirestore



class RestaurantListingTableViewController: UITableViewController
{
    
    @IBOutlet  var tableViewXd: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var menuBarButtonItem: UIBarButtonItem!
    
    
    //empty array of restaurants
    var restaurants : Restaurantes!
    
    
    var filteredRestaurants = [Restaurant]()
    let activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = Restaurantes()
//
//    //tell search bar this class is delegate
//        SearchBar.delegate = self
//
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        restaurants.cargarDatos {
            self.tableViewXd.reloadData()
        }
    }
    
    
    
    // MARK: - Activity Indicator method
    
    func showActivityIndicator()
    {
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicatorView.center = tableView.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .red
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator()
    {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
    
    // Mark: Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "ShowMealsViewController" {
//        let mealsVC = segue.destination as! MealsViewController
//            //should be "" empty string, not nil to avoid fatal error
//        if SearchBar.text != "" {
//            mealsVC.restaurant =
//                self.filteredRestaurants[self.tableView.indexPathForSelectedRow!.row]
//        } else {
//            mealsVC.restaurant =
//            self.restaurants[self.tableView.indexPathForSelectedRow!.row]
//        }
//    }
//}

}
// Mark: UITableViewDataSource
//implement UITableView data source

extension RestaurantListingTableViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurants.restaurantes.count
    }
    
    //fetch data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
      
        let restauranteActual : Restaurant!
        
        restauranteActual = restaurants.restaurantes[indexPath.row]
        
        cell.nameLabel.text = restauranteActual.name
        cell.addressLabel.text = restauranteActual.address
        cell.imageView!.image = UIImage(named: "burguer")
        cell.ratingLabel.text = "4,5"
        cell.restoTypeLabel.text = "restaurante"
        
        return cell
    }

}

//extension RestaurantListingTableViewController : UISearchBarDelegate
//{
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredRestaurants = self.restaurants.filter({ (restaurant) -> Bool in
//            return restaurant.name?.lowercased().range(of: searchText.lowercased()) != nil
//        })
//
//        self.tableView.reloadData()
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//}
