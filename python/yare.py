import boto3 

# Initialize the EC2 resource
ec2_resource = boto3.resource('ec2', region_name='us-east-1')

# Loop through all instances
for instance in ec2_resource.instances.all():
    print(f"ID: {instance.id} | State: {instance.state['Name']} | Type: {instance.instance_type}")
