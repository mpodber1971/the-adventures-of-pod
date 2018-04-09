def subNets = ['vpc-devops-eqp-stage-private-us-east-1a', 'vpc-devops-eqp-stage-private-us-east-1b',                        'vpc-devops-eqp-stage-private-us-east-1c','vpc-devops-eqp-stage-private-us-east-1d']

if (Environment == 'Staging') {
    subNets = ['vpc-devops-eqp-stage-private-us-east-1a', 'vpc-devops-eqp-stage-private-us-east-1b',                        'vpc-devops-eqp-stage-private-us-east-1c','vpc-devops-eqp-stage-private-us-east-1d']
}
else
{
subNets = ['vpc-devops-eqp-stage-private-us-east-1a', 'vpc-devops-eqp-stage-private-us-east-1b',                        'vpc-devops-eqp-stage-private-us-east-1c','vpc-devops-eqp-stage-private-us-east-1d']
}

return subNets