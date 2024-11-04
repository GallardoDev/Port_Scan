# Port_Scan

Este es un script que permite realizar un escaneo de puertos en una dirección IP específica. Se verifican los puertos del 1 al 1024 y se muestran cuáles están abiertos.

## Descripción

El escáner utiliza la herramienta 'nc' (netcat). La salida del script indicará qué puertos están abiertos en la dirección IP proporcionada por el usuario. Si no se encuentran puertos abiertos, se mostrará un mensaje informando que no existen puertos abiertos.

# Ejemplo se salida
========================================
          ESCÁNER DE PUERTOS           
         ██████╗ ██╗  ██╗██╗██╗       
         ██╔══██╗██║  ██║██║██║       
         ██████╔╝███████║██║██║       
         ██╔═══╝ ██╔══██║██║██║       
         ██║     ██║  ██║██║███████╗  
         ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝  
========================================
   Uso: Escanea puertos de una IP      
   Introduce la dirección IP a escanear:
   
109.218.209.141

Escaneando puertos en la dirección IP: 109.218.209.141
Puertos abiertos:
Puerto 22 está abierto.
Puerto 80 está abierto.
