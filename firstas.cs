using system;
class Student{
	public string name{get;set;};
	public int Rollnumber{get; set;};
	public string course{get;set;};
    public int age{get;set;};

}
class code{
	public static void Main(){
		Student s1=new Student {name="Prathmesh",Rollnumber=52,course="Data analytics",age=20};
		Student s2=new Student {name="Naman",Rollnumber=40,course="C++",age=19};
		Student s1=new Student {name="Rashi",Rollnumber=58,course="Web development",age=21};


		console.WriteLine("First student's name is "+s1.name +" Rollnumber is "+s1.Rollnumber+" course is "+ s1.course + " and the age is "+ s1.age);
		console.WriteLine("Second student's name is "+s2.name +" Rollnumber is "+s2.Rollnumber+" course is "+ s2.course + " and the age is "+ s2.age);
		console.WriteLine("Third student's name is "+s3.name +" Rollnumber is "+s3.Rollnumber+" course is "+ s3.course + " and the age is "+ s3.age);
	}
}