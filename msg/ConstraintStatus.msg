# Status message for constraint system
std_msgs/Header header
bool constraints_active         # Whether constraints are currently being enforced
bool bounds_violated           # Whether any bounds are currently violated
bool adapting                  # Whether bounds are currently being adapted
float64 avg_left_margin        # Average left margin across trajectory [m]
float64 avg_right_margin       # Average right margin across trajectory [m]
float64 avg_confidence         # Average confidence across trajectory [0.0-1.0]
string status_message          # Human-readable status description
