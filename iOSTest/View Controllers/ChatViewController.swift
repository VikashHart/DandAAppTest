//
//  ChatViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.datechnologies.co/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private let apiClient: ChatClientRetrievable = ChatClient()
    private var messages: [MessageModel]?
    private let chatView = ChatView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureView()
        fetchData()
        configureTable(tableView: chatView.tableView)
    }
    
    // MARK: - Private
    private func configureVC() {
        title = "Chat"
    }
    
    private func configureTable(tableView: UITableView) {
        tableView.dataSource = self
    }
    
    private func fetchData() {
        apiClient.getChat { [weak self] result in
            switch result {
            case .success(let messagesData):
                self?.messages = messagesData
                DispatchQueue.main.async {
                    self?.chatView.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func presentDataFetchErrorAlert(error: String) {
        let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    private func configureView() {
        chatView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatView)
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }}

extension ChatViewController: UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        if let messages = messages {
            let currentMessage = messages[indexPath.row]
            cell.setCellData(message: currentMessage)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messageArray = messages else { return 0 }
        return messageArray.count
    }
}
