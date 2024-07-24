# Demo Steps

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