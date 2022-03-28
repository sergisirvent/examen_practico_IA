(deffacts datos

(capacidadMaxRobot 3)
(almacen lineaPedido cajaNaranjas 0 cajaManzanas 0 cajaCaquis 0 cajaUvas 0 palet cajaNaranjas 2 palet cajaManzanas 4 palet cajaCaquis 2 palet cajaUvas 1 robot 0 cajaNaranjas 0 cajaManzanas 0 cajaCaquis 0 cajaUvas 0)
(pedido cajaNaranjas 1 cajaManzanas 2 cajaUvas 1)


)

(defrule coger_caja_naranjas

    (capacidadMaxRobot ?capMax)
    (almacen lineaPedido cajaNaranjas ?naranjas_cogidas $?pre palet cajaNaranjas ?naranjas_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaNaranjas ?naranjas_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?naranjas_existentes 0))
    (test (> ?naranjas_pedidas 0))

    =>

    (assert (almacen $?pre palet cajaNaranjas (- ?naranjas_existentes 1) $?post $?pre2 robot (+ ?cajas_actuales 1) $?post2))


)

(defrule dejar_cajas_linea_pedido
    (almacen $?pre robot ?cajas_actuales $?post2)
    (capacidadMaxRobot ?capMax)
    (test (= ?capMax ?cajas_actuales))
    =>
    (assert (almacen $?pre robot 0 $?post2))
)

(defrule comprobar_pedido

    (declare (salience 10))
    (almacen lineaPedido $?lineaPedido $?post)
    (pedido $?lineaPedido)

    =>

    (printout t "Pedido terminado con exito" crlf)
    (halt)

)

