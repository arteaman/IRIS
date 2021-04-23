Class Excursions.Application Extends (%Library.Persistent, %Library.Populate)
{

Relationship Client As Excursions.Client [ Cardinality = one, Inverse = Applications ];

Relationship Schedule As Excursions.Schedule [ Cardinality = one, Inverse = Applications ];

Storage Default
{
<Data name="ApplicationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Client</Value>
</Value>
<Value name="3">
<Value>Schedule</Value>
</Value>
</Data>
<DataLocation>^Excursions.ApplicationD</DataLocation>
<DefaultData>ApplicationDefaultData</DefaultData>
<IdLocation>^Excursions.ApplicationD</IdLocation>
<IndexLocation>^Excursions.ApplicationI</IndexLocation>
<StreamLocation>^Excursions.ApplicationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
