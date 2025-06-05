# Azure

## Adicionar Disco

### Passo 1 - Criar o disco na cloud 

All Services -> Storage -> Disk

Após a criação do disco, associar à máquina virtual desejada (na criação da VM escolher o disco criado como 2º disco)


### Passo 2 - Montar o disco na máquina

Faça seu login na VM e execute os seguintes comandos:

Vire super usuário: 

```bash
sudo su
```

Veja onde o disco foi montado (normalmente em /dev/sdc):

```bash
fdisk -l
```

Informações dos discos

```bash
lsblk
```

Crie a pasta que queira destinar o disco:

```bash
mkdir /meudisco
```

Particione o disco:

```bash
sudo parted /dev/sdc --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/sdc1
sudo partprobe /dev/sdc1
```

Monte o disco:

```bash
mount /dev/sdc1 /meudisco
```

## Criação da Azure Storage Account

- Configs
- Blob
- Files
- Static WebSite

----

# AWS

## Adicionar Disco EBS

### Passo 1 - Criar o disco na cloud 

Crie o volume no menu EC2 -> EBS

Crie a Máquina Virtual

Volte ao menu do EBS, marque o disco e escolha "Attach"


### Passo 2 - Montar o disco na máquina

Faça seu login na VM e execute os seguintes comandos:

Vire super usuário: 

```bash
sudo su
```

Veja onde o disco foi montado (normalmente em /dev/sdc):

```bash
lsblk
```

Monte o sistema de arquivos:

```bash
sudo file -s /dev/xvdf
```

Monte a partição:

```bash
mkfs -t ext4 /dev/xvdf
```

Crie a pasta que receberá seu disco:

```bash
mkdir /newvolume
```

Monte o disco:

```bash
mount /dev/xvdf /newvolume/
```

Valide se o disco está montado com o comando df:

```bash
cd /newvolume
df -h .
```

## Montar o disco de rede (EFS)

### Passo 1 - Crie o disco particionado

Services -> Storage -> EFS

Crie o disco EFS (atente-se para a região)

### Passo 2 - Crie a máquina virtual

Na criação da máquina virtual, associe (em File Systems - edit) o EFS à VM criada.


### Passo 3 - Associe o disco corretamente

Crie a pasta desejada na raíz da VM (por exemplo mkdir /efs)

Execute o script disponível no disco EFS criado, apontando para a pasta destino, por exemplo:

```bash
sudo mount -t efs -o tls fs-04a9d615330a44261:/ /efs
```

O script encontra-se no botão "Attach" do EFS criado.

Há versões para Windows/Linux e Mac.


## Demonstração do S3

S3 (website, inteligent tier)


### Police para liberação do WebSite Estático

```bash
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::nome-do-meu-bucket/*"
        }
    ]
}
```
