# Sprint 1
Este proyecto contiene:
- Makefile con targets para build, run, test, clean y pack
- Scripts en src/
- Pruebas en tests/ usando Bats
- Documentación en docs/

## Instalar dependencias principales

```bash
sudo yum update -y
sudo yum install -y git make bind-utils
```

## Clonar repositorio
```bash
git clone https://github.com/AriusJoel1/PC1-Proyecto3-Grupo13.git
cd PC1-Proyecto3-Grupo13
```

## Verificar dependencias
```bash
make tools
```

## Habilitar permisos de ejecución
```bash
chmod +x src/*.sh
```
## Uso de variables de entorno
El pipeline permite configurar los endpoints y dominio a validar usando variables de entorno:

### Dominio para test DNS
`export DOMAIN=example.com`

### URL para test GET
`export URL=https://example.com`

### URL para test POST
`export POST_URL=https://httpbin.org/post`

### Servidor DNS específico
`export DNS_SERVER=8.8.8.8`

## Ejecutar pipeline principal
```bash
make run
# revisar resultados
less out/http.log
less out/dns.log
```

**Ejecutar pruebas**
```bash
make test
```

**Empaquetar el proyecto**
```
make pack RELEASE=v1.0.0
```

**Verificar artefacto generado**
```bash
ls dist/
tar -tzf dist/project-v1.0.0.tar.gz
```

**Videos:**
https://drive.google.com/drive/folders/1FVltHS51iFUOYDvnedyIVdgD2fKb96E0?usp=sharing

**Video-Sprint-1**:

**Video-Sprint-2**:

**Video-Sprint-3**: