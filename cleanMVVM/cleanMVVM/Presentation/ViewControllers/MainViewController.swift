//
//  MainViewController.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 24/11/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    
    private let reuseCellId = "userTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil),
                                forCellReuseIdentifier: reuseCellId)
        usersTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

        
    }

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
