# Demo Steps
## Cloud Shell Editor e clonare il Repository

1. tramite [questo link](https://shell.cloud.google.com/?pli=1&show=ide&environment_deployment=ide) e' possibile acceder a cloud shell editor

2.Configurare lo username e l'email per git
```bash
git config --global user.name "your-github-user"
```

```bash
git config --global user.email "your-github-emaiil"
```
3. Premere (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>G</kbd>) oppure dalle icone di sinistra selezionare *Source Control* oppure premere  (<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>) e scrrivere nel box che compare *Source Control* e selezionare *Source Control: Focus on Source Control View*

4. da qui e' possibiile accedere a github clickando su *Clone Repository* ed inserendo l'url del repository da clonare, nei box a seguire viene dato un **codice da inserire nella pagina di github per l'autenticazione**
5. una volta inserito il codiice di autenticazione il repository viene clonato ed e' possibile procedere con prossimi step

![source control auth prompt](https://code.visualstudio.com/assets/docs/sourcecontrol/github/auth-prompt.png)

## inizializzazione con stato locale
1. Andare nella cartella di Terraform

```bash
cd /home/janoradini/terraform_demo_test/terraform
```

2. Inizializzare Terraform
```bash
terraform init
```

## Creazione del Bucket per la Cloud Function e per lo Statefile

1. Creare il bucket lanciando
```bash
terraform apply
```

2. Per aggiungere il remote state in [terraform.tf](terraform/terraform.tf) scommentare la parte relariva al backend, inserire il nome del bucket appena creato (non e' possibile usare le variabili) e lanciare

```bash
terraform init
```
3. Per creare la Cloud Function definita in [main.py](cloud_functions/test_function/main.py) scommentare la parte relariva alla Cloud function in [main.tf](terraform/main.tf)  e lanciare 
```bash
terraform apply
```
