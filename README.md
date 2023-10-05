# backup-s3-bucket
Shell script para backup incremental no Amazon S3 Bucket

Uma alternativa com ótimo custo x benefício para realização de backups em servidores Linux é o Amazon S3 Bucket.

Os valores podem ser verificados nesta URL: https://aws.amazon.com/pt/s3/pricing/

<hr>
Acesse sua conta da AWS e crie um <b>usuário IAM</b>. Depois, será necessário a criação da <b>Chave de Acesso</b> que para a configuração da CLI.

Para instalação do <b>AWS CLI</b>, siga as intruções conforme seu Sistema Operacional.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Após a instalação, execute a configuração da seguinte forma: <b>$sudo aws configure</b>

Será realizada algumas perguntas durante a instalação:
AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format: No meu caso, optei por utilizar o formato JSON
