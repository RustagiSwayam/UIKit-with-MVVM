//
//  AnimalViewController.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//
import UIKit

class AnimalViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 140)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(UINib(nibName: "AnimalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(AnimalTableViewCell.Nib(), forCellReuseIdentifier: AnimalTableViewCell.identifier)
        tv.dataSource = self
        return tv
    }()
    
    private lazy var animalsViewModel = AnimalViewModel()
    private var selectedAnimal: AnimalModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
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
        
        view.addSubview(collectionView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120), // Adjusted height
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension AnimalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let selectedAnimal = selectedAnimal {
            return animalsViewModel.animals.filter { $0.name == selectedAnimal.name }.count
        } else {
            return animalsViewModel.animals.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal: AnimalModel
        if let selectedAnimal = selectedAnimal {
            animal = animalsViewModel.animals.filter { $0.name == selectedAnimal.name }[indexPath.row]
        } else {
            animal = animalsViewModel.animals[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as! AnimalTableViewCell
        cell.configure(with: animal)
        cell.delegate = self
        return cell
    }
}

extension AnimalViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalsViewModel.animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let animal = animalsViewModel.animals[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as? AnimalCollectionViewCell{
            cell.configure(with: animal, isSelected: selectedAnimal?.name == animal.name)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animal = animalsViewModel.animals[indexPath.row]
        if selectedAnimal?.name == animal.name {
            selectedAnimal = nil
        } else {
            selectedAnimal = animal
        }
        collectionView.reloadData()
    }
}

extension AnimalViewController: AnimalTableViewCellDelegate {
    func playSoundButtonTapped(with name: String) {
        let noise = animalNoise(for: name)
        let alert = UIAlertController(title: "\(name) says", message: "\(noise)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    private func animalNoise(for name: String) -> String {
        switch name {
        case "Dog":
            return "bark bark"
        case "Giraffe":
            return "hum hum"
        case "Lion":
            return "roar roar"
        case "Monkey":
            return "ooh ooh aah aah"
        case "Panda":
            return "growl growl"
        case "Peacock":
            return "screech screech"
        case "Squirrel":
            return "squeak squeak"
        default:
            return "unknown noise"
        }
    }
}
