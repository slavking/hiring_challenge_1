![Diagram](https://github.com/slavking/hiring_challenge_1/blob/master/2024-03-21-21-59-22.png?raw=true)

# Usage

## Install the following software:

* [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* terraform (standalone or [tfenv](https://github.com/tfutils/tfenv))
* [inkdrop](https://github.com/inkdrop-org/inkdrop-visualizer) to get an automated diagram of AWS resources

```commandline
aws configure
terraform init
terraform plan -out="tfplan.txt"
inkdrop tfplan.txt
```

