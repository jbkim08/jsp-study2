package com.mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

	public static List<Student> getStudents() {
		
		// create an empty list
		List<Student> students = new ArrayList<>();
		
		// add sample data
		students.add(new Student("Mary", "Public", "mary@naver.com"));
		students.add(new Student("John", "Doe", "john@naver.com"));
		students.add(new Student("Ajay", "Rao", "ajay@naver.com"));
		
		// return the list
		return students;
	}
}







