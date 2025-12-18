# IaC-Terraform-Despliegue-Instancias-EC2
<div>
  <h2>Objetivo del proyecto</h2>
  <p>
    El objetivo de esta infraestructura es <strong>desplegar entornos escalables en AWS</strong> 
    utilizando Terraform. La configuración permite crear y gestionar recursos de red, 
    instancias de cómputo y salidas automatizadas, garantizando que la infraestructura 
    pueda crecer y adaptarse según la demanda.
  </p>
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/724931e0-aadf-41e8-aca0-aa4c7cd057a7" />
 <p>
    En el <strong>documento Word adjunto</strong> se incluye la 
    <em>comprobación y guía detallada</em> del proceso de despliegue, 
    explicando paso a paso cómo aplicar la infraestructura y verificar que los recursos 
    se han creado correctamente en AWS.
  </p>
</div>

<div>
  <h3>ec2.tf</h3>
  <p>
    Define los recursos relacionados con instancias EC2 en AWS. 
    Aquí se especifican cosas como el tipo de instancia, el AMI (imagen base), 
    las claves SSH, los grupos de seguridad y cualquier configuración asociada a las máquinas virtuales.
  </p>
</div>

<div>
  <h3>outputs.tf</h3>
  <p>
    Contiene las salidas (outputs) del despliegue de Terraform. 
    Sirve para mostrar valores importantes una vez aplicado el plan, como la IP pública de una instancia EC2, 
    el ID de una VPC o cualquier otro dato útil que quieras reutilizar o consultar.
  </p>
</div>

<div>
  <h3>provider.tf</h3>
  <p>
    Define el proveedor de infraestructura que se va a usar, en este caso AWS. 
    Incluye la configuración necesaria para autenticarte, como la región y las credenciales. 
    Por ejemplo: <code>provider "aws" { region = "us-east-1" }</code>.
  </p>
</div>

<div>
  <h3>variables.tf</h3>
  <p>
    Declara las variables que Terraform utilizará en los demás archivos. 
    Permite parametrizar el código para hacerlo más reutilizable. 
    Por ejemplo, variables para el tipo de instancia, la región o el nombre del proyecto.
  </p>
</div>

<div>
  <h3>vpc.tf</h3>
  <p>
    Define los recursos de red: la VPC (Virtual Private Cloud), subredes, gateways, tablas de rutas, 
    grupos de seguridad, etc. Es la base de la infraestructura de red donde se desplegarán los demás recursos.
  </p>
</div>
1️⃣ Crear un usuario IAM con permisos

Antes de usar Terraform con AWS, necesitamos un usuario con permisos para crear recursos.

Pasos:

Accede a la Consola de AWS

Ve al servicio IAM

Selecciona Usuarios → Crear usuario

Asigna un nombre (por ejemplo: terraform-user)

Marca Acceso programático

En permisos, puedes:

Asignar la política AdministratorAccess (solo para prácticas)

O crear una política personalizada con permisos sobre EC2, VPC, etc.

Finaliza la creación y guarda el Access Key y Secret Key

⚠️ Importante: No compartas estas credenciales ni las subas a GitHub.

2️⃣ Instalar Terraform y añadirlo como variable de entorno
🔹 Instalación

Descarga Terraform desde: https://developer.hashicorp.com/terraform/downloads

Extrae el binario

Añade la ruta del ejecutable a la variable de entorno PATH

🔹 Verificación

Ejecuta en la terminal:

terraform -version

Si la instalación es correcta, verás la versión instalada.

3️⃣ Configurar credenciales de AWS

Terraform necesita acceder a AWS usando las credenciales del usuario IAM.

Ejecuta:

aws configure

Introduce:

AWS Access Key ID

AWS Secret Access Key

Región (ejemplo: eu-west-1)

Formato de salida: json

Esto creará los archivos necesarios en:

~/.aws/credentials
~/.aws/config
4️⃣ Crear el directorio del proyecto

Creamos una carpeta para el proyecto:

mkdir terraform-aws-ec2
cd terraform-aws-ec2

Dentro de esta carpeta se crearán los archivos .tf.

5️⃣ Crear los archivos de Terraform
📄 main.tf

Define el proveedor y el recurso EC2:

provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "mi_instancia" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"


  tags = {
    Name = "Instancia-Terraform"
  }
}

📌 Notas:

Cambia el ami por una válida en tu región

t2.micro es gratuita en el Free Tier

📄 variables.tf (opcional)
variable "region" {
  description = "Región de AWS"
  default     = "eu-west-1"
}
📄 outputs.tf (opcional)
output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.mi_instancia.public_ip
}
6️⃣ Inicializar Terraform

Ejecuta:

terraform init

Este comando:

Descarga el proveedor de AWS

Prepara el entorno de trabajo

7️⃣ Validar la configuración
terraform validate

Comprueba que la sintaxis es correcta.

8️⃣ Ver el plan de ejecución
terraform plan

Muestra los recursos que Terraform va a crear sin aplicarlos aún.

9️⃣ Desplegar la infraestructura
terraform apply

Confirma escribiendo yes.

Terraform creará la instancia EC2 automáticamente.

🔟 Eliminar la infraestructura

Para borrar todos los recursos creados:

terraform destroy

⚠️ Esto eliminará la instancia EC2.

📁 Estructura final del proyecto
terraform-aws-ec2/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfstate
✅ Conclusión

Este proyecto demuestra cómo usar Terraform para desplegar infraestructura en AWS de forma automatizada, reproducible y segura, siguiendo buenas prácticas de IaC.

Ideal para entornos de DevOps, Cloud y automatización de infraestructuras.
