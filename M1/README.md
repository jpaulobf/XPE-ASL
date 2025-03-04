# Demo PostgreSQL

# Requisitos

- Router Privado roteando para a Internet

## Instalar o PostgreSQL no Server DB

```bash
sudo dnf update

sudo dnf install postgresql16.x86_64 postgresql16-server -y
```

## Instalar o PostgreSQL no WEB DB (para conectividade somente)

```bash
sudo dnf update

sudo dnf install postgresql16.x86_64 postgresql16-server -y
```

# Remover o link para a Internet

- Router Privado sem roteamento para a Internet

## Inicializar o PostgreSQL

```bash
sudo postgresql-setup --initdb

sudo systemctl start postgresql

sudo systemctl enable postgresql

sudo systemctl status postgresql
```

## Alterar a Senha do Usuário Postgres

```bash
sudo su

sudo -u postgres psql

ALTER USER postgres WITH PASSWORD 'postgres';

\q
```

## Cria Banco, Tabela e Dados...

```bash
sudo -u postgres psql

CREATE DATABASE pos_asl;

\l

\c pos_asl;

CREATE TABLE cars (
  brand VARCHAR(255),
  model VARCHAR(255),
  year INT
);

insert into cars (brand, model, year) values ('ford', 'focus', 2020);
```

## Altera configurações do Postgres para permitir conexões

```bash
nano /var/lib/pgsql/data/postgresql.conf
```

## Editar a linha de/para:

```bash
#listen_addresses = 'localhost'
listen_addresses = '*'
```

```bash
nano /var/lib/pgsql/data/pg_hba.conf
```

## Adicionar a linha:
```bash
host     all     all     0.0.0.0/0     md5
```

Reiniciar

```bash
sudo systemctl restart postgresql
```

