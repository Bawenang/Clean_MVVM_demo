//
//  MainViewController.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 24/11/21.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    
    var viewModel: MainViewModelling!
    
    private let disposeBag = DisposeBag()
    private let reuseCellId = "userTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        
        viewModel.loadUsers.accept(())
    }
    
    private func setupTableView() {
        usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil),
                                forCellReuseIdentifier: reuseCellId)
        usersTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    private func setupViewModel() {
        viewModel.userParams
            .drive(usersTableView.rx.items) { [weak self] tableView, _, element in
                guard let `self` = self,
                      let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: self.reuseCellId),
                      let cell = dequeuedCell as? UserTableViewCell else {
                    return UITableViewCell()
                }
                cell.setup(with: element)
                return cell
            }
            .disposed(by: disposeBag)
        
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
