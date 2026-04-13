# Custom message for horizon control communication
# Sent from aero controller to horizon mapper to request horizon adjustments

std_msgs/Header header

# Horizon control parameters
int16 requested_horizon_n    # Requested horizon length N
float64 max_horizon_time     # Maximum horizon time T [s]
bool adaptive_horizon        # Enable adaptive horizon adjustment
bool emergency_horizon       # Emergency horizon reduction flag

# Performance-based horizon adjustment
float64 current_speed        # Current vehicle speed [m/s]
float64 track_curvature      # Current track curvature [1/m]
float64 performance_score    # Current performance score [0.0-1.0]

# Safety-based horizon adjustment
float64 safety_margin        # Safety margin factor [0.0-1.0]
bool obstacle_detected       # Obstacle detection flag
float64 obstacle_distance    # Distance to nearest obstacle [m]
