# giu_f1t_interfaces

Custom ROS2 interface definitions for F1Tenth autonomous racing systems. This package provides message types for vehicle state representation, frontier exploration, and racing-specific data structures.

## 📋 Table of Contents

- [Overview](#overview)
- [Message Definitions](#message-definitions)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

The `giu_f1t_interfaces` package contains custom message definitions used across the F1Tenth racing stack. These interfaces standardize communication between different components of the autonomous racing system, including:

- **Vehicle State Management**: Position, velocity, and steering data
- **Frontier Detection**: Exploration and mapping interfaces
- **Racing Control**: High-level racing command structures

## 📨 Message Definitions

### VehicleState.msg

Represents the complete state of a racing vehicle:

```msg
# Custom message for vehicle state
# Contains position, velocity, and steering angle

float64 x       # Position x coordinate [m]
float64 y       # Position y coordinate [m]
float64 delta   # Steering angle [rad]
float64 v       # Velocity [m/s]
```

**Usage**: Used by MPC controllers, trajectory planners, and state estimators.

### VehicleStateArray.msg

Collection of vehicle states for trajectory representation:

```msg
# Custom message for array of vehicle states
# Contains multiple vehicle state data points

VehicleState[] states
```

**Usage**: Trajectory publishing, path planning, and multi-point control.

### Frontier.msg

Defines exploration frontiers for SLAM and mapping:

```msg
# Frontier exploration message
# Contains frontier boundary information

# Add your frontier message fields here
```

### FrontierList.msg

Collection of frontiers for exploration algorithms:

```msg
# List of exploration frontiers
# Used by exploration and mapping nodes

# Add your frontier list fields here
```

## 🚀 Installation

### Prerequisites

- ROS2 Humble
- Ubuntu 22.04 LTS
- Standard ROS2 message dependencies

### Build Instructions

```bash
# Navigate to your ROS2 workspace
cd /path/to/your/ws

# Clone the repository (if not already done)
git clone <repository-url> src/race_stack/myDev/giu_f1t_interfaces

# Install dependencies
rosdep install --from-paths src --ignore-src -r -y

# Build the interface package
colcon build --packages-select giu_f1t_interfaces

# Source the workspace
source install/setup.bash
```

### Verify Installation

```bash
# Check available interfaces
ros2 interface list | grep giu_f1t_interfaces

# Inspect message structure
ros2 interface show giu_f1t_interfaces/msg/VehicleState
ros2 interface show giu_f1t_interfaces/msg/VehicleStateArray
```

## 💻 Usage

### Python Usage

```python
import rclpy
from rclpy.node import Node
from giu_f1t_interfaces.msg import VehicleState, VehicleStateArray

class VehiclePublisher(Node):
    def __init__(self):
        super().__init__('vehicle_publisher')

        # Create publisher
        self.publisher = self.create_publisher(
            VehicleState,
            'vehicle_state',
            10
        )

        # Create and publish message
        msg = VehicleState()
        msg.x = 1.0
        msg.y = 2.0
        msg.v = 5.0
        msg.delta = 0.1

        self.publisher.publish(msg)
```

### C++ Usage

```cpp
#include "rclcpp/rclcpp.hpp"
#include "giu_f1t_interfaces/msg/vehicle_state.hpp"

class VehiclePublisher : public rclcpp::Node
{
public:
    VehiclePublisher() : Node("vehicle_publisher")
    {
        publisher_ = this->create_publisher<giu_f1t_interfaces::msg::VehicleState>(
            "vehicle_state", 10);

        auto message = giu_f1t_interfaces::msg::VehicleState();
        message.x = 1.0;
        message.y = 2.0;
        message.v = 5.0;
        message.delta = 0.1;

        publisher_->publish(message);
    }

private:
    rclcpp::Publisher<giu_f1t_interfaces::msg::VehicleState>::SharedPtr publisher_;
};
```

### Command Line Usage

```bash
# Publish a vehicle state message
ros2 topic pub /vehicle_state giu_f1t_interfaces/msg/VehicleState \
  "{x: 1.0, y: 2.0, v: 5.0, delta: 0.1}"

# Echo vehicle state messages
ros2 topic echo /vehicle_state giu_f1t_interfaces/msg/VehicleState

# Get message info
ros2 interface show giu_f1t_interfaces/msg/VehicleState
```

## 📦 Dependencies

### Build Dependencies

- `ament_cmake`
- `rosidl_default_generators`
- `std_msgs`
- `geometry_msgs`

### Runtime Dependencies

- `rosidl_default_runtime`
- `std_msgs`
- `geometry_msgs`

### Test Dependencies

- `ament_lint_auto`
- `ament_lint_common`

## 🛠️ Development

### Package Structure

```
giu_f1t_interfaces/
├── CMakeLists.txt          # Build configuration
├── package.xml             # Package metadata
├── README.md              # This file
├── LICENCE               # LICENCE file
└── msg/                   # Message definitions
    ├── VehicleState.msg
    ├── VehicleStateArray.msg
    ├── Frontier.msg
    └── FrontierList.msg
```

### Adding New Messages

1. Create new `.msg` file in the `msg/` directory
2. Add the message to `CMakeLists.txt`:
   ```cmake
   rosidl_generate_interfaces(${PROJECT_NAME}
     "msg/YourNewMessage.msg"
     # ... other messages
     DEPENDENCIES std_msgs geometry_msgs
   )
   ```
3. Rebuild the package:
   ```bash
   colcon build --packages-select giu_f1t_interfaces
   ```

### Message Design Guidelines

- Use clear, descriptive field names
- Include units in comments (e.g., `[m]`, `[rad]`, `[m/s]`)
- Follow ROS2 naming conventions (snake_case)
- Add comprehensive header comments
- Specify coordinate frames when applicable

## 🔧 Integration

This package integrates with:

- **MPC Controller** (`mpc_controller`): Uses `VehicleState` and `VehicleStateArray`
- **Trajectory Planner**: Consumes vehicle state messages
- **SLAM Systems**: Uses frontier messages for exploration
- **Visualization Tools**: RViz plugins for message display

## 🧪 Testing

```bash
# Build with tests
colcon build --packages-select giu_f1t_interfaces

# Run tests
colcon test --packages-select giu_f1t_interfaces

# View test results
colcon test-result --verbose
```

## 📈 Performance

- **Message Size**: Optimized for minimal bandwidth usage
- **Serialization**: Efficient binary serialization via rosidl
- **Compatibility**: Compatible with DDS middleware implementations

## 🐛 Troubleshooting

### Common Issues

1. **Interface not found**: Ensure package is built and workspace is sourced

   ```bash
   source install/setup.bash
   ros2 interface list | grep giu_f1t_interfaces
   ```

2. **Build failures**: Check dependencies are installed

   ```bash
   rosdep install --from-paths src --ignore-src -r -y
   ```

3. **Import errors**: Verify Python path includes install directory
   ```bash
   echo $PYTHONPATH
   ```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-message`)
3. Add your message definitions
4. Update documentation
5. Test your changes
6. Submit a pull request

### Message Review Checklist

- [ ] Clear field names and types
- [ ] Comprehensive comments with units
- [ ] Updated CMakeLists.txt
- [ ] Documentation updated
- [ ] Integration tested

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏁 F1Tenth Racing

Part of the F1Tenth autonomous racing ecosystem:

- High-speed autonomous navigation
- Real-time control and planning
- Competition-ready implementations
- Educational robotics platform

**🏎️ Built for speed, designed for precision, optimized for racing! 🏁**
