Class Excursions.Application Extends (%Library.Persistent, %Library.Populate)
{

Relationship Client As Excursions.Client [ Cardinality = one, Inverse = Applications ];

Relationship Schedule As Excursions.Schedule [ Cardinality = one, Inverse = Applications ];

Storage Default
{
<Data name="GroupDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FIO</Value>
</Value>
</Data>
<DataLocation>^Excursions.GroupD</DataLocation>
<DefaultData>GroupDefaultData</DefaultData>
<IdLocation>^Excursions.GroupD</IdLocation>
<IndexLocation>^Excursions.GroupI</IndexLocation>
<StreamLocation>^Excursions.GroupS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
