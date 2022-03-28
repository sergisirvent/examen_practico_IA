(deffacts datos

(capacidadMaxRobot 3)
(almacen lineaPedido palet cajaNaranjas 2 palet cajaManzanas 4 palet cajaCaquis 2 palet cajaUvas 1 robot 0)
(pedido cajaNaranjas 1 cajaManzanas 2 cajaUvas 1)

)

(defrule coger_cajas_naranjas

    (capacidadMaxRobot ?capMax)
    (almacen $?pre palet cajaNaranjas ?naranjas_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaNaranjas ?naranjas_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?naranjas_existentes 0))
    (test (>= ?naranjas_existentes ?naranjas_pedidas))

    =>



)

(defrule comprobar_pedido

    (declare (salience 10))
    (almacen lineaPedido $?lineaPedido palet $?resto)
    (pedido $?lineaPedido)

    =>

    (printout t "Pedido terminado con exito" crlf)
    (halt)

)