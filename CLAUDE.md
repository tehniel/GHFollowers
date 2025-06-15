# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Development Commands

- **Build**: Open `GHFollowers.xcodeproj` in Xcode and build with ⌘+B
- **Run**: Use Xcode's run button or ⌘+R to run on simulator/device
- **Clean**: Product → Clean Build Folder in Xcode

## Architecture Overview

This is an iOS UIKit application that displays GitHub followers using the GitHub API. The app follows MVC architecture with programmatic Auto Layout (no Storyboards except LaunchScreen).

### Key Architecture Patterns
- **Singleton NetworkManager**: Handles all GitHub API requests with completion handlers
- **Custom UI Components**: All UI elements are custom subclasses (GF prefix) with programmatic constraints
- **Result-based Error Handling**: Uses `Result<Success, GFError>` for network operations
- **Diffable Data Source**: Collection views use `UICollectionViewDiffableDataSource` for smooth updates
- **Image Caching**: NetworkManager includes NSCache for avatar images

### Core Flow
1. **SearchVC** → Enter GitHub username → **FollowerListVC**
2. **FollowerListVC** → Displays paginated followers in collection view
3. **UserInfoVC** → Shows detailed user information when follower is selected

### Data Models
- `Follower`: Basic user info (login, avatarUrl) - Codable & Hashable
- `User`: Complete user profile with stats and bio information

### Custom Components Structure
- **Buttons/**: `GFButton` - Consistent button styling
- **Labels/**: `GFTitleLabel`, `GFBodyLabel`, `GFSecondaryTitleLabel` - Typography system  
- **TextFields/**: `GFTextField` - Custom text input
- **Cells/**: `FollowerCell` - Collection view cell for follower display
- **ViewControllers/**: `GFAlertVC`, `GFUserInfoHeaderVC` - Reusable modal components
- **Views/**: `GFEmptyStateView` - Empty state UI

### Networking
- Base URL: `https://api.github.com/users/`
- Endpoints: `/followers` (paginated), user profile
- JSON decoding uses `convertFromSnakeCase` strategy
- All network calls happen on background threads with main thread UI updates

### Error Handling
`GFError` enum provides user-friendly error messages for:
- Invalid username/request
- Network connectivity issues  
- Invalid server response
- Invalid data parsing

### Extensions
- `UIViewController+Ext`: Shared alert presentation, loading views, and empty state helpers