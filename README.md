This repository attempts to make it easier to kickstart a local running docker instance of Hashicorp Vault (https://www.hashicorp.com/products/vault).

**Who is this for**
If you're in a hurry to setup a local running Vault instance to play around with then you can use this repository to ideally quickly setup your own environment.

**Requirements**
Unfortunately we need some things installed:
- python
- ansible
- docker
- docker-compose
- bash

sudo access - this is only used to cleanup the generated folders under vault/data

**Setup and Running the code**

1. Update the ansible/configure-vault.yml variables with your own values
2. Run `bash 01-setup-and-run-vault.sh` - this will run docker-compose up --build  and run the ansible-playbook configure-vault.yml
3. Upon a successful run, the unsealing keys and root_token will be saved within the ansible folder
4. You can obtain the secret via the API by running:
 
   `export VAULT_TOKEN=[vault token here]`

   `curl \
    -H "X-Vault-Token: $VAULT_TOKEN" \
    -X GET \
    http://127.0.0.1:8200/v1/kv/ping/data/love`

(See https://www.vaultproject.io/api-docs/auth/userpass &
    https://www.vaultproject.io/api-docs/secret/kv/kv-v2 for more details)

5. You can also access the Vault gui by going to http://127.0.0.1:8200/

**Notes**
There are a LOT of things that could be improved, some that come into mind:

1. The playbook could be separated to different folders/tasks - e.g. Initialization, Core Configuration, Customisation etc
2. The code is far from secure - it writes the unsealing keys (see https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing) and root token on the playbook folder
3. It uses http vs https
4. DataStructure of the variables could be improved