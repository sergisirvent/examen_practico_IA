(deffacts datos

(capacidadMaxRobot 3)
(almacen lineaPedido cajaNaranjas 0 cajaManzanas 0 cajaCaquis 0 cajaUvas 0 palet cajaNaranjas 2 palet cajaManzanas 4 palet cajaCaquis 2 palet cajaUvas 1 robot 0)
(pedido cajaNaranjas 1 cajaManzanas 2 cajaUvas 1)


)

(defrule coger_caja_naranjas

    (capacidadMaxRobot ?capMax)
    (almacen lineaPedido $?pre0 cajaNaranjas ?naranjas_cogidas $?pre palet cajaNaranjas ?naranjas_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaNaranjas ?naranjas_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?naranjas_existentes 0))
    (test (> ?naranjas_pedidas 0))

    =>

    (assert (almacen lineaPedido $?pre0 cajaNaranjas (+ ?naranjas_cogidas 1) $?pre palet cajaNaranjas (- ?naranjas_existentes 1) $?post $?pre2 robot (+ ?cajas_actuales 1) $?post2))


)

(defrule coger_caja_manzanas

    (capacidadMaxRobot ?capMax)
    (almacen lineaPedido $?pre0 cajaManzanas ?manzanas_cogidas $?pre palet cajaManzanas ?manzanas_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaManzanas ?manzanas_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?manzanas_existentes 0))
    (test (> ?manzanas_pedidas 0))

    =>

    (assert (almacen lineaPedido $?pre0 cajaManzanas (+ ?manzanas_cogidas 1) $?pre palet cajaManzanas (- ?manzanas_existentes 1) $?post $?pre2 robot (+ ?cajas_actuales 1) $?post2))


)

(defrule coger_caja_caquis

    (capacidadMaxRobot ?capMax)
    (almacen lineaPedido $?pre0 cajaCaquis ?caquis_cogidas $?pre palet cajaCaquis ?caquis_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaCaquis ?caquis_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?caquis_existentes 0))
    (test (> ?caquis_pedidas 0))

    =>

    (assert (almacen lineaPedido $?pre0 cajaCaquis (+ ?caquis_cogidas 1) $?pre palet cajaCaquis (- ?caquis_existentes 1) $?post $?pre2 robot (+ ?cajas_actuales 1) $?post2))


)
(defrule coger_caja_uvas

    (capacidadMaxRobot ?capMax)
    (almacen lineaPedido $?pre0 cajaUvas ?uvas_cogidas $?pre palet cajaUvas ?uvas_existentes $?post $?pre2 robot ?cajas_actuales $?post2)
    (pedido $?pre cajaUvas ?uvas_pedidas $?post)
    (test (<= ?cajas_actuales ?capMax))
    (test (> ?uvas_existentes 0))
    (test (> ?uvas_pedidas 0))

    =>

    (assert (almacen lineaPedido $?pre0 cajaUvas (+ ?uvas_cogidas 1) $?pre palet cajaUvas (- ?uvas_existentes 1) $?post $?pre2 robot (+ ?cajas_actuales 1) $?post2))


)

(defrule dejar_cajas_linea_pedido
    (almacen $?pre robot ?cajas_actuales $?post2)
    (capacidadMaxRobot ?capMax)
    (test (= ?capMax ?cajas_actuales))
    =>
    (assert (almacen $?pre robot 0))
)

(defrule comprobar_pedido

    (declare (salience 10))
    (almacen lineaPedido $?lineaPedido $?post)
    (pedido $?lineaPedido)

    =>

    (printout t "Pedido terminado con exito" crlf)
    (halt)

)

