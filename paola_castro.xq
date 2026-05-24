Consulta XPath 1 — Empleados

doc("/db/commerce/data/hr_employees.xml")/HRDatabase/Employees/Employee


Consulta XPath 2 — Nombres de empleados
doc("/db/commerce/data/hr_employees.xml")/HRDatabase/Employees/Employee/FirstName


Consulta XPath 3 — Salario mayor a 10000
doc("/db/commerce/data/hr_employees.xml")/HRDatabase/Employees/Employee[Salary > 10000]


Consulta XPath 4 — Departamentos
doc("/db/commerce/data/hr_employees.xml")/HRDatabase/Departments/Department/DepartmentName






Consulta XQuery 1 — Employees + Departments

let $doc := doc("/db/commerce/data/hr_employees.xml")
for $e in $doc//Employee
for $d in $doc//Department
where data($e/DepartmentID)=data($d/DepartmentID)
return
<EmployeeDepartment>
    <EmployeeName>{data($e/FirstName)}</EmployeeName>
    <DepartmentName>{data($d/DepartmentName)}</DepartmentName>
</EmployeeDepartment>





Consulta XQuery 2 — Combinar Employees + Jobs
let $doc := doc("/db/commerce/data/hr_employees.xml")
for $e in $doc//Employee
for $j in $doc//Job
where data($e/JobID)=data($j/JobID)
return
<EmployeeJob>
    <EmployeeName>{data($e/FirstName)}</EmployeeName>
    <JobTitle>{data($j/JobTitle)}</JobTitle>
    <Salary>{data($e/Salary)}</Salary>
</EmployeeJob>




Consulta XQuery 3 — Ordenar empleados por salario
for $e in doc("/db/commerce/data/hr_employees.xml") /HRDatabase/Employees/Employee
return
<Employeeinfo>
    <Nombre>{ $e/FirstName/text () }</Nombre>
    <Salario>{ $e/Salary/text () }</Salario>
</Employeeinfo>




