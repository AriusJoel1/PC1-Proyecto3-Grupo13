# Sprint 1 - Makefile
SHELL := /bin/bash

.PHONY: clean

tools:
	@echo "Verificando dependencias..."
	@command -v bats >/dev/null 2>&1 || { echo "Instala bats-core"; exit 1; }
	@command -v curl >/dev/null 2>&1 || { echo "Instala curl"; exit 1; }
	@command -v dig >/dev/null 2>&1 || { echo "Instala dig (bind-utils o dnsutils)"; exit 1; }
	@echo "Dependencias OK"

build:
	@echo "Construyendo artefactos..."
	@mkdir -p out
	@echo "Build completado" > out/build.log
	@echo "Done"

test:
	@echo "Ejecutando pruebas Bats..."
	@mkdir -p out
	@bats tests/

run:
	@echo "Ejecutando pipeline..."
	@mkdir -p out
	@./src/check_http.sh
	@./src/check_dns.sh
	@echo "Pipeline terminado"

pack:
	@echo "Empaquetando en release: ${RELEASE} ..."
	@mkdir -p dist
	@tar --exclude='./dist' --exclude='./out' --exclude='./.git' --exclude='*.log' \
	    -czf dist/project-${RELEASE}.tar.gz .
	@echo "Paquete creado en dist/project-${RELEASE}.tar.gz"

clean:
	@echo "Limpiando..."
	@rm -rf out dist
	@echo "Limpieza completada"

help:
	@echo "Uso:"
	@echo "  make tools     - Verificar dependencias"
	@echo "  make build     - Construir artefactos"
	@echo "  make test      - Ejecutar pruebas Bats"
	@echo "  make run       - Ejecutar pipeline"
	@echo "  make pack      - Empaquetar en release"
	@echo "  make clean     - Limpiar"
	@echo "  make help      - Mostrar este mensaje"
