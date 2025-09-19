# Sprint 1 - Makefile
SHELL := /bin/bash

tools:
	@echo "Verificando dependencias..."

build:
	@echo "Construyendo artefactos..."

test:
	@echo "Ejecutando pruebas Bats..."

run:
	@echo "Ejecutando pipeline..."

pack:
	@echo "Empaquetando en release: ${RELEASE} ..."

clean:
	@echo "Limpiando..."

help:
	@echo "Uso:"
	@echo "  make tools     - Verificar dependencias"
	@echo "  make build     - Construir artefactos"
	@echo "  make test      - Ejecutar pruebas Bats"
	@echo "  make run       - Ejecutar pipeline"
	@echo "  make pack      - Empaquetar en release"
	@echo "  make clean     - Limpiar"
	@echo "  make help      - Mostrar este mensaje"
