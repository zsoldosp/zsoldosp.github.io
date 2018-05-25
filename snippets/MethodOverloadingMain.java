import java.lang.reflect.Method;
import java.lang.IllegalArgumentException;

public class MethodOverloadingMain {

    public static void main(String[] args) throws Exception {
        Class<?> c = Class.forName("MethodOverloadingArity");
        Method[] declaredMethods = c.getDeclaredMethods();
        for(Method method : declaredMethods) {
            if (method.getName() != "join") 
                continue;
            System.out.println(method.toString());
            try {
                Object result = method.invoke(c, "first", "second");
                System.out.format("... invocation result (2 args): %s\n", result);
            } catch(IllegalArgumentException e) {
                System.out.format("... (2 args) %s\n", e);
            }
            try {
                Object result = method.invoke(c, "first", "second", " - ");
                System.out.format("... invocation result (3 args): %s\n", result);
            } catch(IllegalArgumentException e) {
                System.out.format("... (3 args) %s\n", e);
            }
        }
    }
}

