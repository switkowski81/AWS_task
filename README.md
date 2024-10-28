Katalogi /home/project_terraform oraz /home/project_ansbile zawierają kod źródłowy który:
1. Tworzy instancję EC2 za pomocą Terraform oraz odpowidnią grupę autoskalowania. A nstepnie instaluje na niej Dockera z ngnix'em z image: nginx:latest ale juz za pomocą ansible.
2. Jeżęli obciązenie instancji EC2 przekracz 90% do CPU to tworzona jest nowa.
3. W tle ( na maszynie służacej do deploymentu - ja robiłem to w shellu konsoli AWS) co 1 minut chodzi skrypt do dynamicznego aktualizowania inventory ansible i uruchamiania ansible

   Zawartosc cron;a
   1 * * * * /home/project_ansible/run_ansible.sh >> /home/project_ansible/ansible_run.log 2>
run_ansible.sh

#!/bin/bash
# Aktualizacja inventory
/home/project_terraform/modules/ec2/inventory.sh
