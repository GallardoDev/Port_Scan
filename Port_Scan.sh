#!/bin/bash

# Banner de hacker
echo "========================================"
echo "          ESCÁNER DE PUERTOS           "
echo "         ██████╗ ██╗  ██╗██╗██╗       "
echo "         ██╔══██╗██║  ██║██║██║       "
echo "         ██████╔╝███████║██║██║       "
echo "         ██╔═══╝ ██╔══██║██║██║       "
echo "         ██║     ██║  ██║██║███████╗  "
echo "         ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝  "
echo "========================================"
echo "   Uso: Escanea puertos de una IP      "
echo "   Introduce la dirección IP a escanear:"
echo ""

# Función para escanear puertos
escanear_puertos() {
    ip=$1
    puertos_abiertos=()
    echo "Escaneando puertos en la dirección IP: $ip"
    
    for puerto in $(seq 1 1024); do
        # Escaneo sigiloso usando nc
        nc -z -v -w 1 $ip $puerto 2>&1 | grep succeeded > /dev/null
        if [ $? -eq 0 ]; then
            puertos_abiertos+=($puerto)
        fi
    done

    # Mostrar resultados
    if [ ${#puertos_abiertos[@]} -eq 0 ]; then
        echo "No existen puertos abiertos."
    else
        echo "Puertos abiertos:"
        for p in "${puertos_abiertos[@]}"; do
            echo "Puerto $p está abierto."
        done
    fi
}

# Leer la dirección IP del usuario
read ip_objetivo

# Validar que se ha introducido una dirección IP
if [[ -z "$ip_objetivo" ]]; then
    echo "Error: No se ha introducido ninguna dirección IP."
    exit 1
fi

# Validar el formato de la dirección IP
if ! [[ "$ip_objetivo" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: La dirección IP introducida no es válida."
    exit 1
fi

# Llamar a la función de escaneo de puertos
escanear_puertos $ip_objetivo
