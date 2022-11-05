//
//  SettingsViewController.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var colors: [Informative] =
    [BackgroundTheme.green,
     BackgroundTheme.red]
    
    private lazy var colorsTableView: UITableView = {
        let tableView = UITableView()

        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        //delegate? = self
        
        setupColors()
    }
   
    func setupColors() {
        view.addSubview(colorsTableView)
        colorsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = colors[indexPath.row].getTitle()
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellColor = UIColor.red
    }
}
