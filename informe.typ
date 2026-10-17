#import "@preview/splash:0.5.0": tol-light
#let permit = table.cell(fill: tol-light.mint)[Permitido]
#let block = table.cell(fill: tol-light.pink)[Bloqueado]
#let block_by_defect = table.cell(fill: tol-light.pink)[Bloqueado\*]
#let limited = table.cell(fill: tol-light.light-yellow )[Limitado]
#let na = table.cell(fill: tol-light.pale-grey)[-] // Para conexiones consigo mismo


= Trabajo final integrador - Infraestructura

== 1.

Diagrama de la topología implementada:

#image("diagrama_infra.png")

Para este diagrama fijé las ips de las vms LAN, ADMIN, SERV_A y SERV_B, ya que previamente se asignaban por dhcp.

== 2.
#align(center)[
  #table(
    columns: 2, 
    [*Lugar*], [*Dirección IP*],
    [Interfaz WAN],[10.41.107.172],
    [Interfaz LAN],[192.168.10.1],
    [Interfaz ADMINISTRACION],[192.168.30.1],
    [Interfaz SERVIDORESA],[192.168.20.1],
    [Interfaz SERVIDORESB],[44.0.51.1],
    [VM WAN],[10.41.107.10],
    [VM USUARIOS],[192.168.10.10],
    [VM ADMINISTRACION],[192.168.30.10],
    [VM SERVIDORESA],[192.168.20.10],
    [VM SERVIDORESB],[44.0.51.10],
  )
]

#pagebreak()

== 3.

#align(center)[
  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 or x == 0 { luma(240) } else { none },
    stroke: 0.5pt + luma(150),
    
    [Desde \\ Hacia], [*WAN*], [*LAN*], [*Admin.*], [*Servidores A*], [*Servidores B*],
    
    [*WAN*], na, block, block, limited, limited,
    [*LAN*], permit, na, block, block_by_defect, block_by_defect,
    [*Admin.*], limited, block_by_defect, na, permit, permit,
    [*Servidores A*], permit, block, block, na, block_by_defect,
    [*Servidores B*], permit, block, block, block_by_defect, na,
  )
]
Bloqueado\*: Implica que esta bloqueado por defecto ya que no se especificó queda con la configuración inicial.

Los limitados de WAN a servidores A y B  implican que solo se puede acceder mediante TCP por el puerto 8000.

El limitado de Admin a WAN es porque solo permito ciertos servicios (http, https, DNS, icmp) que son los fundamentales para tareas de actualización o diagnóstico.

== 4.


