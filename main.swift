func menu() {
    print("""
    --- Menú de Inventario ---
    1. Registrar un artículo
    2. Ver la lista de artículos
    3. Consultar artículos en existencia
    4. Salir
    Seleccione una opción:
    """)
}

var inventario = [(String, Int)]() 

while true {
    menu()
    if let opcion = readLine(), let seleccion = Int(opcion) {
        switch seleccion {
        case 1:
            print("Nombre del artículo:")
            if let nombre = readLine(), !nombre.isEmpty {
                print("Cantidad:")
                if let cantidadStr = readLine(), let cantidad = Int(cantidadStr), cantidad >= 0 {
                    inventario.append((nombre, cantidad))
                    print("Artículo registrado.")
                } else {
                    print("Cantidad inválida.")
                }
            } else {
                print("Nombre inválido.")
            }
        case 2:
            print("\n--- Lista de artículos ---")
            if inventario.isEmpty {
                print("No hay artículos registrados.")
            } else {
                for (nombre, cantidad) in inventario {
                    print("\(nombre) - Cantidad: \(cantidad)")
                }
            }
        case 3:
            print("\n--- Artículos en existencia ---")
            let existentes = inventario.filter { $0.1 > 0 }
            if existentes.isEmpty {
                print("No hay artículos en existencia.")
            } else {
                for (nombre, cantidad) in existentes {
                    print("\(nombre) - Cantidad: \(cantidad)")
                }
            }
        case 4:
            print("Saliendo del programa. ¡Hasta luego!")
            break
        default:
            print("Opción no válida.")
        }
    } else {
        print("Entrada inválida.")
    }
}
