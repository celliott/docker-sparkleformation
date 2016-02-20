SparkleFormation.new(:compute, :provider => :aws) do
  AWSTemplateFormatVersion '2010-09-09'
  description 'Sparkle Compute Template'

  parameters do
    sparkle_image_id.type 'String'
    sparkle_ssh_key_name.type 'String'
    sparkle_flavor do
      type 'String'
      default 'm1.small'
      allowed_values ['m1.small', 'm1.medium']
    end
  end

  dynamic!(:ec2_instance, :sparkle) do
    properties do
      image_id ref!(:sparkle_image_id)
      instance_type ref!(:sparkle_flavor)
      key_name ref!(:sparkle_ssh_key_name)
    end
  end

  outputs.sparkle_public_address do
    description 'Compute instance public address'
    value attr!(:sparkle_ec2_instance, :public_ip)
  end

end