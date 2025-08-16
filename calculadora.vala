using Gtk;

public class Calculadora : Application {
    private Entry entrada1;
    private Entry entrada2;
    private DropDown operacion;
    private Label resultado;

    public Calculadora() {
        Object(application_id: "org.ejemplo.Calculadora");
    }

    protected override void activate() {
        var ventana = new ApplicationWindow(this) {
            title = "Calculadora en Vala",
            default_width = 300,
            default_height = 200
        };

        var caja = new Box(Orientation.VERTICAL, 10) {
            margin_top = 20,
            margin_bottom = 20,
            margin_start = 20,
            margin_end = 20
        };

        entrada1 = new Entry() { placeholder_text = "Primer número" };
        entrada2 = new Entry() { placeholder_text = "Segundo número" };

        string[] ops = { "+", "-", "*", "/" };
        operacion = new DropDown.from_strings(ops);

        var boton = new Button.with_label("Calcular");
        boton.clicked.connect(calcular);

        resultado = new Label("Resultado: ");

        caja.append(entrada1);
        caja.append(entrada2);
        caja.append(operacion);
        caja.append(boton);
        caja.append(resultado);

        ventana.set_child(caja);
        ventana.present();
    }

    private void calcular() {
        try {
            double num1 = double.parse(entrada1.text);
            double num2 = double.parse(entrada2.text);
            string op = (string) operacion.get_selected_item().get_string();
            double res = 0;

            switch (op) {
                case "+": res = num1 + num2; break;
                case "-": res = num1 - num2; break;
                case "*": res = num1 * num2; break;
                case "/":
                    if (num2 != 0) res = num1 / num2;
                    else {
                        resultado.set_text("Error: división por cero");
                        return;
                    }
                    break;
            }
            resultado.set_text("Resultado: " + res.to_string());
        } catch (Error e) {
            resultado.set_text("Entrada inválida");
        }
    }

    public static int main(string[] args) {
        return new Calculadora().run(args);
    }
}
