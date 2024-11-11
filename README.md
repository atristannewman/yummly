//
//  README.md
//  YumList
//
//  Created by Tristan Newman on 11/9/24.
//

## Table of Content
- Design Considerations
- Project Structure Overview

## Design Considerations
- This structure not only facilitates collaboration among team members but also allows for efficient scaling as the application grows.
- I briefly considered choosing a networking library for the YumList app, I opted for **Alamofire** over **Moya**. Alamofire is better maintained, having an update 11 days ago, versus Moya in August. Alamofire, Moya, and URLRequests require boilter plate to make scalabl. It made sense to go with Alamofire, because you get the benefits of just enough data task abstraction.

## Project Structure Overview

This folder structure is designed to support scalability and maintainability in a SwiftUI application.

- Features: Contains distinct modules for each feature, promoting separation of concerns and modular development. This allows for easier testing and future enhancements.
  
- Services: Centralizes network calls and data management, ensuring that business logic is decoupled from UI components. This enhances reusability and simplifies updates.

- Coordinators: Manages navigation and flow between views, providing a clear structure for user interactions and improving code readability.

- Utilities: Houses common functions and extensions that can be reused across the application, reducing code duplication.

- Resources: Contains assets like images and colors, organized for easy access and modification.

- Tests: Ensures that each component is thoroughly tested, promoting reliability and confidence in the application’s functionality.

