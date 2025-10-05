# Terraform — VPC mínima + EC2 “Hola” (AWS)

Infraestructura como Código básica: se crea una **VPC pública**, **subnet**, **IGW**, **route table** y una **EC2** Amazon Linux 2023 que sirve “Hola desde Terraform” vía Apache.

## Arquitectura
- VPC `10.0.0.0/16`
- Subnet pública `10.0.1.0/24` + Route `0.0.0.0/0 -> IGW`
- SG HTTP(80) y SSH(22)
- EC2 con `user_data` para instalar Apache

```mermaid
graph LR
  U[Usuario] -->|HTTP 80| EC2[EC2 Apache]
  subgraph AWS
    VPC --- SubnetP[Subnet Publica]
    SubnetP --- IGW[Internet Gateway]
    SubnetP --- RT[RT 0.0.0.0/0 -> IGW]
    EC2 --- SubnetP
  end
