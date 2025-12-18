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
<img width="886" height="355" alt="image" src="https://github.com/user-attachments/assets/5bcb24fc-1318-4e85-9505-27d46fdad90b" />


Asigna un nombre (por ejemplo: terraform-user)

Marca Acceso programático

En permisos, puedes:

Asignar la política AdministratorAccess (solo para prácticas)

O crear una política personalizada con permisos sobre EC2, VPC, etc.
<img width="886" height="410" alt="image" src="https://github.com/user-attachments/assets/fe074da9-13cf-4d74-8e41-ba1faa1acd8d" />


Finaliza la creación y guarda el Access Key y Secret Key
<img width="886" height="128" alt="image" src="https://github.com/user-attachments/assets/aa35b8bd-441a-479f-a8e1-e2ea2c588910" />
<img width="886" height="391" alt="image" src="https://github.com/user-attachments/assets/da173d01-87da-4295-a67d-d79337481024" />
<img width="886" height="499" alt="image" src="https://github.com/user-attachments/assets/abe3d3a9-2e9f-425c-aecd-50fca0f730d0" />
<img width="886" height="369" alt="image" src="https://github.com/user-attachments/assets/34feecc2-5b00-4e2b-ad28-4cccc9c2a4ca" />
<img width="886" height="47" alt="image" src="https://github.com/user-attachments/assets/c083085a-8c7e-4f36-ae3f-02624a7a81f3" />
<img width="567" height="255" alt="image" src="https://github.com/user-attachments/assets/bf8734f2-c672-4666-9718-b64936c0aa13" />




⚠️ Importante: No compartas estas credenciales ni las subas a GitHub.

2️⃣ Instalar Terraform y añadirlo como variable de entorno
🔹 Instalación

Descarga Terraform desde: https://developer.hashicorp.com/terraform/downloads

Extrae el binario

Añade la ruta del ejecutable a la variable de entorno PATH
<img width="641" height="767" alt="image" src="https://github.com/user-attachments/assets/42bb3b5d-cc55-4068-aa49-b08cc9eca5ef" />
<img width="886" height="969" alt="image" src="https://github.com/user-attachments/assets/19e56157-5f62-40ac-b407-00f21a58ebb4" />
<img width="886" height="326" alt="image" src="https://github.com/user-attachments/assets/fa25a0b4-9736-48ad-9b86-01a9f408d818" />




🔹 Verificación

Ejecuta en la terminal:

```terraform -version```
<img width="886" height="145" alt="image" src="https://github.com/user-attachments/assets/4152868d-3767-4912-9e01-a0038d7974c9" />


Si la instalación es correcta, verás la versión instalada.

3️⃣ Configurar credenciales de AWS

Terraform necesita acceder a AWS usando las credenciales del usuario IAM.

Ejecuta:

```aws configure```

Introduce:

AWS Access Key ID

AWS Secret Access Key

Región (ejemplo: eu-west-1)

Formato de salida: json

Esto creará los archivos necesarios en:

~/.aws/credentials
~/.aws/config
4️⃣ Crear el directorio del proyecto
<img width="695" height="215" alt="image" src="https://github.com/user-attachments/assets/c1efa6e1-9e7f-4213-a506-671710c88c03" />


Creamos una carpeta para el proyecto:

```mkdir terraform-aws-ec2```
```cd terraform-aws-ec2```
Dentro de esta carpeta se crearán los archivos .tf.
<img width="886" height="225" alt="image" src="https://github.com/user-attachments/assets/caf7a5c6-65f9-4329-aec1-78dc4517d4af" />


5️⃣ Crear los archivos de Terraform
<h3>provider.tf</h3>
<h3>ec2.tf</h3>
<h3>outputs.tf</h3>
<h3>s3.tf</h3>
<h3>variables.tf</h3>
<i>Todo el código de estos ficheros se encuentra incluido en el repositorio del proyecto</i>

6️⃣ Inicializar Terraform
<img width="886" height="567" alt="image" src="https://github.com/user-attachments/assets/23d454b0-4b66-41bc-939f-ece982da9639" />


Ejecuta:

```terraform init```

Este comando:

Descarga el proveedor de AWS

Prepara el entorno de trabajo

7️⃣ Validar la configuración
<img width="675" height="145" alt="image" src="https://github.com/user-attachments/assets/3289110c-6ea2-4c1d-96dc-993967738685" />

```terraform validate```

Comprueba que la sintaxis es correcta.

8️⃣ Ver el plan de ejecución
<img width="886" height="399" alt="image" src="https://github.com/user-attachments/assets/58be6437-117a-45d6-900d-7af1d71dee04" />

```terraform plan```

Muestra los recursos que Terraform va a crear sin aplicarlos aún.

9️⃣ Desplegar la infraestructura
<img width="886" height="112" alt="image" src="https://github.com/user-attachments/assets/8d115889-d745-496b-a4de-f60a1d4bf692" />

```terraform apply```
<img width="886" height="255" alt="image" src="https://github.com/user-attachments/assets/3393374b-3654-4ee8-89bf-229836259abd" />


Confirma escribiendo yes.

Terraform creará la instancia EC2 automáticamente.
<img width="886" height="394" alt="image" src="https://github.com/user-attachments/assets/45ec16c1-2386-457c-9db4-a377de980c80" />
<img width="886" height="208" alt="image" src="https://github.com/user-attachments/assets/62b33b25-f802-49a2-a5e9-447244af75f4" />
<img width="886" height="316" alt="image" src="https://github.com/user-attachments/assets/da1013a9-d73a-4ec2-b46f-1ad6b057ddcf" />
<img width="813" height="124" alt="image" src="https://github.com/user-attachments/assets/63841d6c-2005-4fb7-b942-c5115b76f6be" />
<img width="886" height="166" alt="image" src="https://github.com/user-attachments/assets/ef1d2d54-f956-47fd-8e57-d7a17527b1a2" />




🔟 Eliminar la infraestructura
<img width="886" height="177" alt="image" src="https://github.com/user-attachments/assets/21f8a897-aebe-4c1b-aa39-aadb9020095d" />
<img width="886" height="319" alt="image" src="https://github.com/user-attachments/assets/dc21a768-ca35-41d6-86ac-a61a97d928fd" />



Para borrar todos los recursos creados:

```terraform destroy```

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
