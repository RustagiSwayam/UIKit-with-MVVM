//
//  AnimalViewController.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//

import UIKit

class AnimalViewController: UIViewController {
    
    private lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(AnimalTableViewCell.Nib(), forCellReuseIdentifier: AnimalTableViewCell.identifier)
        return tv
    }()
    
    private lazy var animalsViewModel = AnimalViewModel()
    
    override func loadView() {
        super.loadView()
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

private extension AnimalViewController {
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Animals"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableview.dataSource = self
        self.view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension AnimalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsViewModel.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = animalsViewModel.animals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as! AnimalTableViewCell
        cell.configure(with: animal)
        return cell
    }
}
