//
//  BeadsSetsListViewController.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 18/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BeadsSetsListViewController: UIViewController {
    
    var beadsService: BeadsServiceProvider!
    
    @IBOutlet weak var beadsSetsListTableView: UITableView!
    
    init(with beadsService: BeadsServiceProvider) {
        self.beadsService = beadsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beadsSetsListTableView.register(UINib.init(nibName: "BeadsSetTableViewCell", bundle: nil), forCellReuseIdentifier: BeadsSetTableViewCell.reuseIdentifier())
    }

}

extension BeadsSetsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeadsSetTableViewCell.reuseIdentifier(), for: indexPath)
        return cell
    }
    
    
}

extension BeadsSetsListViewController: UITableViewDelegate {

}
