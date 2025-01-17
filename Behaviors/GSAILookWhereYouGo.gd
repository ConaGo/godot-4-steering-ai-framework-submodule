# Calculates an angular acceleration to match an agent's orientation to its
# direction of travel.
# @category - Individual behaviors
class_name GSAILookWhereYouGo
extends GSAIMatchOrientation


func _init(_agent: GSAISteeringAgent, _use_z := false)-> void:
	agent = _agent
	use_z = _use_z

func _calculate_steering(accel: GSAITargetAcceleration) -> void:
	if agent.linear_velocity.length_squared() < agent.zero_linear_speed_threshold:
		accel.set_zero()
	else:
		var orientation := (
			GSAIUtils.vector3_to_angle(agent.linear_velocity)
			if use_z
			else GSAIUtils.vector2_to_angle(GSAIUtils.to_vector2(agent.linear_velocity))
		)
		_match_orientation(accel, orientation)
