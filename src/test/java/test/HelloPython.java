package test;

import org.python.core.PyFunction;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;

public class HelloPython {

	public static void main(String[] args) {
		PythonInterpreter interpreter = new PythonInterpreter();
		interpreter.exec("print('hello')");
		interpreter.execfile("C:\\Users\\CYu33\\Desktop\\hello.py");
		PyFunction pyFunction = interpreter.get("hello", PyFunction.class);
		PyObject pyObject = pyFunction.__call__();
		System.out.println(pyObject);
		interpreter.close();
	}

}
