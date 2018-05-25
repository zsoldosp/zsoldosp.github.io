public class MethodOverloadingArity {

    public static String join(String a, String b) {
        return join(a, b, " ");
    }

    public static String join(String a, String b, String sep) {
        return String.format("%s%s%s", a, sep, b);
    }
}
