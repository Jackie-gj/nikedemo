package test;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.function.IntBinaryOperator;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class TestStream {

	public static void main(String[] args) {
		// Group By 
		Map<String, List<Person>> personGroups = Stream.generate(new PersonSupplier()).limit(8)
				.collect(Collectors.groupingBy(Person::getName));
		
		Iterator<Entry<String, List<Person>>> it = personGroups.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, List<Person>> persons = (Map.Entry<String, List<Person>>) it.next();
			for (Person person : persons.getValue()) {
				System.out.println(person.getName() + ":" + person.getAge());
			}
			// Avg
			Stream<Person> pStream = persons.getValue().stream();
			double avg = pStream.mapToInt(p -> p.getAge()).average().getAsDouble();
			// SD
			Stream<Person> pStream2 = persons.getValue().stream();
			double sd = Math.sqrt(pStream2.map(p -> Math.pow(p.getAge() - avg, 2.0)).mapToDouble(p -> p).average().getAsDouble());
			// DIFFSUM
			Stream<Person> pStream3 = persons.getValue().stream();
			int diffsum = pStream3.mapToInt(p -> p.getAge()).reduce(new IntBinaryOperator() {
				private int sum, pre, flag = 0;
				public int applyAsInt(int left, int right) {
					if (flag-- == 0){
						sum += Math.abs(right - left);
					} else {
						sum += Math.abs(right - pre);
					}
					pre = right;
					return sum;
				}
			}).getAsInt();
			System.out.println(persons.getKey() + " = " + avg + ", " +  sd + ", " + diffsum);
		}
	}

}

class PersonSupplier implements Supplier<Person> {
	private int index = 0;
	private Random random = new Random();

	@Override
	public Person get() {
		return new Person(index++, "StormTestUser" + index / 4, random.nextInt(10));
	}
}

class Person {
	int id;
	String name;
	int age;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Person(int id, String name, int age) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
	}
}