# Passo 1 :

Logar-se na máquina

# Passo 2 :

Se tornar adm

```bash
sudo su
```

Atualizar

```bash
yum update -y && yum upgrade -y
```

# Passo 3 :

Instalar e configurar o Postgres 

```bash
yum install postgresql16 postgresql16-server -y
```

Inicializar o Postgres

```bash
sudo postgresql-setup --initdb
```

Iniciar o serviço

```bash
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo systemctl status postgresql
```

Alterar a senha do Postgres

```bash
sudo passwd postgres

su - postgres

psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

exit
```

Fazer um backup Arquivo de Configuração do Postgres

```bash
cp /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.bck
```

Editá-lo

```bash
nano /var/lib/pgsql/data/postgresql.conf
```

Substituir

```bash
de - #listen_addresses = 'localhost'
para - listen_addresses = '*'
```

Fazer um backup do arquivo pg_hba

```bash
cp /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.bck
```

Editá-lo

```bash
nano /var/lib/pgsql/data/pg_hba.conf
```

Adicionar/Substituir

```bash
host     all     all     0.0.0.0/0     md5
```

Reiniciar o Postgres

```bash
sudo systemctl restart postgresql
```

# Passo 4 :

Criar a Base de Dados e a Tabela

```bash
sudo -i -u postgres psql
```

No psql digitar:

```bash
CREATE DATABASE db01;
GRANT ALL PRIVILEGES ON DATABASE db01 TO postgres;
\l

exit
```

Conectar-se:

```bash
psql -h localhost -U postgres -d db01
```


No psql digitar:

```bash
CREATE TABLE frase_do_dia (
    id INT PRIMARY KEY,
    frase TEXT
);
```

Inserir os dados

```bash
INSERT INTO frase_do_dia (id, frase) VALUES
(1, 'Acredite em você mesmo e tudo será possível.'),
(2, 'Cada dia é uma nova chance para ser melhor.'),
(3, 'O sucesso é a soma de pequenos esforços diários.'),
(4, 'Grandes jornadas começam com um único passo.'),
(5, 'O impossível é apenas uma questão de opinião.'),
(6, 'Persista! O esforço de hoje será a vitória de amanhã.'),
(7, 'Seja a mudança que você quer ver no mundo.'),
(8, 'Nunca é tarde para recomeçar.'),
(9, 'A coragem é a chave para abrir novas oportunidades.'),
(10, 'O fracasso é apenas um degrau para o sucesso.'),
(11, 'A disciplina supera a motivação.'),
(12, 'Sonhe grande, trabalhe duro, faça acontecer.'),
(13, 'Foque no progresso, não na perfeição.'),
(14, 'Quem acredita, sempre alcança.'),
(15, 'Aprenda com os erros e siga em frente.'),
(16, 'O esforço de hoje é a recompensa de amanhã.'),
(17, 'A única derrota é desistir sem tentar.'),
(18, 'Você é mais forte do que imagina.'),
(19, 'Nada é impossível para quem se dedica.'),
(20, 'O sucesso começa quando você sai da zona de conforto.'),
(21, 'Cada obstáculo é uma oportunidade disfarçada.'),
(22, 'Tenha fé no seu potencial.'),
(23, 'O segredo do sucesso é a persistência.'),
(24, 'Uma pequena atitude positiva muda o dia inteiro.'),
(25, 'Seja o protagonista da sua própria história.'),
(26, 'O tempo é agora, faça acontecer.'),
(27, 'Não deixe o medo te impedir de crescer.'),
(28, 'Acredite no processo e confie na jornada.'),
(29, 'Pequenas ações diárias geram grandes resultados.'),
(30, 'Seja grato pelo que tem enquanto trabalha pelo que quer.');
```
