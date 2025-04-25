using GLib;

void main() {
    stdout.printf("Calculadora en Vala\n");
    stdout.printf("Ingrese el primer número: ");
    string? input1 = stdin.read_line();
    stdout.printf("Ingrese el segundo número: ");
    string? input2 = stdin.read_line();
    stdout.printf("Seleccione operación (+, -, *, /): ");
    string? operacion = stdin.read_line();

    if (input1 != null && input2 != null && operacion != null) {
        double num1 = double.parse(input1);
        double num2 = double.parse(input2);
        double resultado = 0;

        switch (operacion) {
            case "+":
                resultado = num1 + num2;
                break;
            case "-":
                resultado = num1 - num2;
                break;
            case "*":
                resultado = num1 * num2;
                break;
            case "/":
                if (num2 != 0) {
                    resultado = num1 / num2;
                } else {
                    stderr.printf("Error: División por cero\n");
                    return;
                }
                break;
            default:
                stderr.printf("Operación no válida\n");
                return;
        }
        stdout.printf("Resultado: %f\n", resultado);
    } else {
        stderr.printf("Entrada inválida\n");
    }
}
