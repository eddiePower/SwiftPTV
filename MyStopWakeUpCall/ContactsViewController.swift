//
//  ContactsViewController.swift
//  MyStopWakeUpCall
//
//  Created by Eddie Power on 5/6/19.
//  Copyright © 2019 Eddie Power. All rights reserved.
//

import UIKit

//Contacts View Controller class is a Coco touch subclass of the UIViewController
//And also a UITableViewDataSource to setup the data in the created table view.
class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //use the dummy data JSON API to grab all contact data from our model
    private let contacts = ContactAPI.getContacts() // model
    
    //create a table view at run time vs draging and dropping one in storyboard now.
    let contactsTableView = UITableView() // view

    //
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        //Attach the table View to the main View / ViewController in our storyboard.
        view.addSubview(contactsTableView)
        
        //Set auto layout to the table view
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false

        //set the table view delegate to this class
        contactsTableView.delegate = self
        
        //Sets the top left right and bottom anchors of the table view to the top of the main view
        //the safeAreaLayoutGuide reference stops the table view from overlapping the iphone camera notch and lower swipe up bar
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        //set the table view data source to this class, if we seperate out the
        // data source client later this will point to instance of other class.
        contactsTableView.dataSource = self
        
        //register our reusable cell identifier for setting data in the table view cells.
        //contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        //register our custom Table View Cell class.
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        //do some cosmetic styling to the top nav bar.
        setUpNavigation()
        
        getAllStops()
        
    }
    
    func getAllStops()
    {
        Stop.allStops { (stops, error) in
            if let error = error
            {
                // got an error in getting the data
                print(error)
                return
            }
            guard let allStops = stops else
            {
                print("error getting all todos: result is nil")
                return
            }
            // success :)
            debugPrint(allStops)
            print(allStops.count)
        }
    }
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //create a tableView cell with identifier contactCell for later use
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        //assign the text lable as the name data field in our dummy data API.
        //cell.textLabel?.text = contacts[indexPath.row].name

        //fill the contact data from our custom cell
        cell.contact = contacts[indexPath.row]
       
        return cell
    }

    //
    func setUpNavigation()
    {
        navigationItem.title = "Contacts"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }

    //
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
