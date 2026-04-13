# Enhanced vehicle state with MPC constraints
# Contains position, velocity, heading angle, and adaptive bounds for MPC

float64 x           # Position x coordinate [m]
float64 y           # Position y coordinate [m] 
float64 theta       # Heading angle [rad]
float64 v_ref       # Reference velocity [m/s]
float64 left_bound  # Left lateral bound [m]
float64 right_bound # Right lateral bound [m]
float64 confidence  # Confidence/tightness parameter [0.0-1.0]
