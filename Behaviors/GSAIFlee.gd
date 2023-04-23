# Calculates acceleration to take an agent directly away from a target agent.
# @category - Individual behaviors
class_name GSAIFlee
extends GSAISeek


func _init(_agent: GSAISteeringAgent, _target: GSAIAgentLocation) -> void:
	agent = _agent
	target = _target


func _calculate_steering(acceleration: GSAITargetAcceleration) -> void:
	acceleration.linear = (
		(agent.position - target.position).normalized()
		* agent.linear_acceleration_max
	)
	acceleration.angular = 0
