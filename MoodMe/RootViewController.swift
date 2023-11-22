//
//  ViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//

import UIKit

class RootViewController: UIViewController {
    private weak var tabBar: UITabBarController!

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white

        let overviewViewController = OverviewViewController()
        let overviewViewNavigationController = UINavigationController(rootViewController: overviewViewController)
        overviewViewNavigationController.tabBarItem.title = "Overview"
        overviewViewNavigationController.tabBarItem.image = UIImage(systemName: "face.smiling")
        
        let moodViewController = MoodViewController()
        let moodViewNavigationController = UINavigationController(rootViewController: moodViewController)
        moodViewNavigationController.tabBarItem.title = "Mood"
        moodViewNavigationController.tabBarItem.image = UIImage(systemName: "figure.mind.and.body")
        
        let todoViewController = TodoListViewController()
        let todoViewNavigationController = UINavigationController(rootViewController: todoViewController)
        todoViewNavigationController.tabBarItem.title = "ToDo"
        todoViewNavigationController.tabBarItem.image = UIImage(systemName: "calendar.badge.clock")
        
        let notesViewController = NotesViewController()
        let notesViewNavigationController = UINavigationController(rootViewController: notesViewController)
        notesViewNavigationController.tabBarItem.title = "Notes"
        notesViewNavigationController.tabBarItem.image = UIImage(systemName: "square.and.pencil.circle")

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            overviewViewNavigationController,
            moodViewNavigationController,
            todoViewNavigationController,
            notesViewNavigationController
        ]
        embedController(tabBarController)
        self.tabBar = tabBarController
    }
}

