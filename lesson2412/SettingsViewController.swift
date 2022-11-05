//
//  SettingsViewController.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var colors: [Informative] =
    [BackgroundTheme.red,
     BackgroundTheme.green,
     BackgroundTheme.yellow
    ]

    
    private lazy var colorsTableView: UITableView = {
        let tableView = UITableView()

        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private lazy var previewColorView: UIView = {
        let view = UITableView()
        view.backgroundColor = cellColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        setupSubviews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Notification.Name("setColor"), object: nil)
    }
   
    func setupSubviews() {
        
        view.addSubview(colorsTableView)
        colorsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(previewColorView)
        previewColorView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50)
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalTo(150)
            make.height.equalTo(50)
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
        switch colors[indexPath.row].getTitle() {
        case "Red":
            cellColor = UIColor.red
        case "Green":
            cellColor = UIColor.green
        case "Yellow":
            cellColor = UIColor.yellow
        default:
            ()
        }
        
        previewColorView.backgroundColor = cellColor
    }
}
