// ===== PRODUCTO 1 =====
class EventoFutbol {
    private String nombreEvento;
    private String estadio;
    private int capacidad;
    private boolean VAR;
    private boolean seguridad;
    private boolean iluminacion;

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public void setEstadio(String estadio) {
        this.estadio = estadio;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public void setVAR(boolean VAR) {
        this.VAR = VAR;
    }

    public void setSeguridad(boolean seguridad) {
        this.seguridad = seguridad;
    }

    public void setIluminacion(boolean iluminacion) {
        this.iluminacion = iluminacion;
    }

    @Override
    public String toString() {
        return "EventoFutbol{" +
                "nombreEvento='" + nombreEvento + '\'' +
                ", estadio='" + estadio + '\'' +
                ", capacidad=" + capacidad +
                ", VAR=" + VAR +
                ", seguridad=" + seguridad +
                ", iluminacion=" + iluminacion +
                '}';
    }
}


// ===== PRODUCTO 2 =====
class ManualEvento {
    private String contenido = "";

    public void agregarContenido(String texto) {
        contenido += texto + "\n";
    }

    @Override
    public String toString() {
        return "Manual del Evento:\n" + contenido;
    }
}


// ===== BUILDER INTERFACE =====
interface Builder {
    void reset();
    void setNombreEvento(String nombre);
    void setEstadio(String estadio);
    void setCapacidad(int capacidad);
    void setVAR(boolean var);
    void setSeguridad(boolean seguridad);
    void setIluminacion(boolean iluminacion);
}


// ===== BUILDER CONCRETO (EVENTO) =====
class EventoFutbolBuilder implements Builder {
    private EventoFutbol evento;

    public EventoFutbolBuilder() {
        reset();
    }

    @Override
    public void reset() {
        evento = new EventoFutbol();
    }

    @Override
    public void setNombreEvento(String nombre) {
        evento.setNombreEvento(nombre);
    }

    @Override
    public void setEstadio(String estadio) {
        evento.setEstadio(estadio);
    }

    @Override
    public void setCapacidad(int capacidad) {
        evento.setCapacidad(capacidad);
    }

    @Override
    public void setVAR(boolean var) {
        evento.setVAR(var);
    }

    @Override
    public void setSeguridad(boolean seguridad) {
        evento.setSeguridad(seguridad);
    }

    @Override
    public void setIluminacion(boolean iluminacion) {
        evento.setIluminacion(iluminacion);
    }

    public EventoFutbol getProducto() {
        EventoFutbol resultado = evento;
        reset();
        return resultado;
    }
}


// ===== BUILDER CONCRETO (MANUAL) =====
class ManualEventoBuilder implements Builder {
    private ManualEvento manual;

    public ManualEventoBuilder() {
        reset();
    }

    @Override
    public void reset() {
        manual = new ManualEvento();
    }

    @Override
    public void setNombreEvento(String nombre) {
        manual.agregarContenido("Evento: " + nombre);
    }

    @Override
    public void setEstadio(String estadio) {
        manual.agregarContenido("Estadio: " + estadio);
    }

    @Override
    public void setCapacidad(int capacidad) {
        manual.agregarContenido("Capacidad: " + capacidad);
    }

    @Override
    public void setVAR(boolean var) {
        manual.agregarContenido("VAR: " + (var ? "Incluido" : "No incluido"));
    }

    @Override
    public void setSeguridad(boolean seguridad) {
        manual.agregarContenido("Seguridad: " + (seguridad ? "Alta" : "Básica"));
    }

    @Override
    public void setIluminacion(boolean iluminacion) {
        manual.agregarContenido("Iluminación: " + (iluminacion ? "Nocturna disponible" : "Solo diurna"));
    }

    public ManualEvento getProducto() {
        ManualEvento resultado = manual;
        reset();
        return resultado;
    }
}


// ===== DIRECTOR =====
class Director {

    // Evento tipo FINAL (muy completo)
    public void construirFinal(Builder builder) {
        builder.reset();
        builder.setNombreEvento("Final de Campeonato");
        builder.setEstadio("Estadio Nacional");
        builder.setCapacidad(50000);
        builder.setVAR(true);
        builder.setSeguridad(true);
        builder.setIluminacion(true);
    }

    // Evento tipo AMISTOSO (más simple)
    public void construirAmistoso(Builder builder) {
        builder.reset();
        builder.setNombreEvento("Partido Amistoso");
        builder.setEstadio("Estadio Local");
        builder.setCapacidad(15000);
        builder.setVAR(false);
        builder.setSeguridad(true);
        builder.setIluminacion(false);
    }
}


// ===== CLIENTE =====
public class Aplicacion {
    public static void main(String[] args) {

        Director director = new Director();

        // Construir Evento
        EventoFutbolBuilder eventoBuilder = new EventoFutbolBuilder();
        director.construirFinal(eventoBuilder);
        EventoFutbol evento = eventoBuilder.getProducto();

        System.out.println(evento);

        // Construir Manual del mismo evento
        ManualEventoBuilder manualBuilder = new ManualEventoBuilder();
        director.construirFinal(manualBuilder);
        ManualEvento manual = manualBuilder.getProducto();

        System.out.println("\n" + manual);
    }
}
