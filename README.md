Katalogi /home/project_terraform oraz /home/project_ansbile zawierają kod źródłowy który:
1. Tworzy instancję EC2 za pomocą Terraform oraz odpowidnią grupę autoskalowania. A nstepnie za pomocą ansible instaluje na niej Dockera z ngnix'em z image: nginx:latest ale juz za pomocą ansible.
   a) wszystkie operacja wykonywane są z konsoli shell AWS.
   b) na poziomie konsoli AWS tworzymy klucz dla maszyn EC2 o nazwie project_key.pem(pem) i przegrywamy go to katalogu /home/project_ansbile/ nadając uprawnienia 400
   c) /home/project_terraform >> terraform init/plan/apply
   d)  uruchamiamy /home/project_terraform/modules/ec2/inventory.sh aby wytworzyc inventory dla ansible
   e /home/project_ansbile/ansible-playbook -i inventory ansible-playbook.yml
   
2. Domyslnie tworzona jest 1 maszyna EC2 , można więcej korzystająć z parametru:  terraform apply -var="instance_count=3"
