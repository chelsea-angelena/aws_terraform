### Aws Transfer Family SFTP Server

Run the terraform main.tf to create the resource, server, role, user, and ssh keys

- You will need to generate the keys:
`ssh-keygen -t rsa -b 4096 -N "" -f <key name>`

- Copy the public key:
`pbcopy < ~/.ssh/aws_rsa_transfer2.pub`

- Paste into main.tf

- Add keys to the agent:
`ssh-add ~/.ssh/<key name>`

- Run:
`terraform plan`
`terraform apply`

- Then connect to the sever: 
`sftp <user_name>@<server-id>server.transfer.<region>.amazonaws.com`


_note_: The main.tf assumes you have already created an S3 bucket as your home directory. You must update this in your main.tf as your own bucket. Maybe try creating that resource here as well!?