# IaC-Terraform-Despliegue-Instancias-EC2
Utilizaré terraform como Infraestructure as code (IaC) para realizar despliegues automatizados de máquinas virtuales/instancias en Amazon Web Services
Para este proyecto necesitaremos una cuenta de AWS e instalar terraform en nuestro equipo local
Estructura y objetivo:
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/724931e0-aadf-41e8-aca0-aa4c7cd057a7" />
Terraform se encargará de:
Crear y configurar las instancias EC2.
Automatizar implementaciones de entornos ágilmente.
Configurar redes (VPC, subnets, grupos de seguridad, etc.).
Gestionar claves SSH, etiquetas y volúmenes.
Permitir destrucción y recreación controlada del entorno.
1.Crear usuario IAM en AWS con permisos
<img width="886" height="344" alt="image" src="https://github.com/user-attachments/assets/463dc5f9-0ac4-4fb5-9133-c51993723fa3" />
<img width="886" height="344" alt="image" src="https://github.com/user-attachments/assets/3c95eddf-fcfd-4366-8924-9b6dd3929dd8" />
<img width="886" height="391" alt="image" src="https://github.com/user-attachments/assets/94fdae2e-defe-4084-96f2-42023d87bd0f" />
<img width="886" height="499" alt="image" src="https://github.com/user-attachments/assets/89921da8-3854-4a9e-a898-bdf69022c4db" />
<img width="886" height="369" alt="image" src="https://github.com/user-attachments/assets/3a2ff0cf-fff5-43ff-b002-09d89df6df2b" />
<img width="432" height="197" alt="image" src="https://github.com/user-attachments/assets/f1cb12e4-09ef-47b5-9f1d-775a5fcdcb30" />
<img width="886" height="545" alt="image" src="https://github.com/user-attachments/assets/a6c83eec-f31e-4175-a2b8-037b64f496c2" />
<img width="641" height="767" alt="image" src="https://github.com/user-attachments/assets/b71217ff-f8e4-40ed-8b87-766516b662c5" />
<img width="886" height="969" alt="image" src="https://github.com/user-attachments/assets/64305f9c-e9ca-4a4b-a416-36afcf032950" />
<img width="886" height="326" alt="image" src="https://github.com/user-attachments/assets/d82239bf-aac5-4261-9a8a-4070f98960be" />
<img width="886" height="145" alt="image" src="https://github.com/user-attachments/assets/cac6f60b-fcb2-4cbc-a8a7-55e2a10357cc" />
<img width="695" height="215" alt="image" src="https://github.com/user-attachments/assets/abe1f5cd-b748-46d3-a1d4-3dfb878f5fff" />
<img width="886" height="225" alt="image" src="https://github.com/user-attachments/assets/5f9c2ddf-c37d-45e0-80f2-48d47527e8c6" />
<img width="675" height="145" alt="image" src="https://github.com/user-attachments/assets/50af9b8f-2691-4c9c-9ab2-bd6affa64699" />
<img width="886" height="112" alt="image" src="https://github.com/user-attachments/assets/0b5eaea2-7e01-4dc3-b483-a58eafe1edbc" />
<img width="886" height="399" alt="image" src="https://github.com/user-attachments/assets/a3a33062-a8c4-46c2-b6e8-e4dfbdec9b53" />
<img width="886" height="255" alt="image" src="https://github.com/user-attachments/assets/4082a840-9e5d-444b-a667-e42c5d6d30c4" />
<img width="886" height="394" alt="image" src="https://github.com/user-attachments/assets/962c4350-4dbf-40ed-8ff2-10845ba16e3e" />
<img width="886" height="208" alt="image" src="https://github.com/user-attachments/assets/6280d5bf-696c-4435-9170-d76ba4876e4b" />
<img width="813" height="124" alt="image" src="https://github.com/user-attachments/assets/4393641c-9bed-4a97-b5ae-a8b86ae131ce" />
<img width="886" height="166" alt="image" src="https://github.com/user-attachments/assets/4de9dc21-593c-4989-8a15-b9ac125dfb9f" />
<img width="886" height="177" alt="image" src="https://github.com/user-attachments/assets/dd4f9f3e-1fb3-45dc-8963-d669a1fe8ca9" />
<img width="886" height="319" alt="image" src="https://github.com/user-attachments/assets/607e5350-24e5-4bef-a4ec-5b0d703f65f6" />

