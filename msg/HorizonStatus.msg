# Custom message for horizon mapper status
# Published by horizon mapper to inform aero controller about current horizon state

std_msgs/Header header

# Current horizon configuration
int16 current_horizon_n      # Current horizon length N
float64 current_horizon_time # Current horizon time T [s]
bool horizon_ready           # Horizon is ready for use

# Trajectory information
int32 trajectory_length      # Total trajectory length
int32 current_index         # Current trajectory index
float64 lookahead_distance  # Current lookahead distance [m]

# Performance metrics
float64 trajectory_quality  # Trajectory quality score [0.0-1.0]
float64 update_frequency    # Horizon update frequency [Hz]
bool adaptive_mode          # Adaptive horizon mode enabled

# Status flags
bool trajectory_valid        # Trajectory is valid
bool bounds_adjusted        # Bounds have been adjusted
string status_message       # Human-readable status message

# Aero controller integration status
bool adaptive_horizon_enabled           # Adaptive horizon mode enabled
float64 current_aero_performance_score # Current performance score from aero controller
float64 current_aero_safety_margin     # Current safety margin from aero controller
bool current_aero_obstacle_detected    # Obstacle detection status from aero controller
float64 current_aero_obstacle_distance # Obstacle distance from aero controller
float64 current_aero_track_curvature   # Track curvature from aero controller
bool current_aero_adaptive_horizon     # Adaptive horizon status from aero controller
