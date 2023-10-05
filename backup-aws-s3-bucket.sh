#!/bin/bash

# Bucket no Amazon S3 onde o backup será armazenado
S3_BUCKET="s3://bucket-1"

# Prefixo para o diretório de backup no S3 (pode ser vazio para o diretório raiz do bucket)
S3_PREFIX=""

# Nome do arquivo de log
LOG_FILE="/var/log/aws/bucket-1-"`date +\%Y\%m\%d`".log"

# Registra a operação no arquivo de log
echo "Backup incremental iniciado em $(date) para $S3_BUCKET/$S3_PREFIX" >> "$LOG_FILE"

# Diretório local a ser feito o backup
SOURCE_DIR="/home/"

# Sufixo para identificar backups incrementais
TIMESTAMP=

# Diretório temporário para armazenar os arquivos a serem carregados
TMP_DIR="/tmp/aws/home"

# Executa a sincronização incremental
/usr/local/bin/aws s3 sync "$SOURCE_DIR" "$S3_BUCKET/$S3_PREFIX$TIMESTAMP" --exclude "*" --include "*" --delete >> "$LOG_FILE" 2>&1

# Limpa os arquivos antigos do diretório temporário
find "$TMP_DIR" -type f -mtime +7 -exec rm -f {} \;

# Registra a operação no arquivo de log
echo "Backup incremental finalizado em $(date) para $S3_BUCKET/$S3_PREFIX$TIMESTAMP" >> "$LOG_FILE"
