Class Excursions.Excursion Extends (%Library.Persistent, %Library.Populate)
{

Relationship schedules As Excursions.Schedule [ Cardinality = many, Inverse = excursion ];

Property Location As %String;

Property Type As %String;

Storage Default
{
<Data name="ExcursionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Location</Value>
</Value>
<Value name="3">
<Value>Type</Value>
</Value>
<Value name="4">
<Value>guide</Value>
</Value>
</Data>
<DataLocation>^Excursions.ExcursionD</DataLocation>
<DefaultData>ExcursionDefaultData</DefaultData>
<IdLocation>^Excursions.ExcursionD</IdLocation>
<IndexLocation>^Excursions.ExcursionI</IndexLocation>
<StreamLocation>^Excursions.ExcursionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
