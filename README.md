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
