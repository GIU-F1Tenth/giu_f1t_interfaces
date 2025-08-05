# Bound adjustment message for runtime adaptation
std_msgs/Header header
float64 left_bound_adjustment   # Adjustment to left bound [m] (positive = tighter)
float64 right_bound_adjustment  # Adjustment to right bound [m] (positive = tighter)
float64 confidence_adjustment   # Adjustment to confidence [0.0-1.0]
bool reset_to_default          # Reset all adjustments to default values
