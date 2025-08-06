# Vehicle model parameters estimated by Dual EKF
# Contains physical parameters of the vehicle model with uncertainties

std_msgs/Header header

# Kinematic parameters
float64 wheelbase                    # Distance between front and rear axles [m]
float64 wheelbase_variance           # Uncertainty in wheelbase estimate [m²]

# Dynamic parameters (for future extension to dynamic models)
float64 front_cornering_stiffness    # Front tire cornering stiffness [N/rad]
float64 front_cornering_variance     # Uncertainty in front cornering stiffness [N²/rad²]

float64 rear_cornering_stiffness     # Rear tire cornering stiffness [N/rad]
float64 rear_cornering_variance      # Uncertainty in rear cornering stiffness [N²/rad²]

# Aerodynamic parameters
float64 drag_coefficient             # Aerodynamic drag coefficient [-]
float64 drag_variance               # Uncertainty in drag coefficient [-]

# Adaptation metadata
uint32 update_count                 # Number of parameter updates performed
float64 last_update_time            # Time of last parameter update [s]
float64 adaptation_rate             # Current adaptation rate [Hz]
float64 innovation_magnitude        # Current innovation magnitude for adaptation
