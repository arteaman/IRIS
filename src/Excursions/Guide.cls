Class Excursions.Guide Extends (%Library.Persistent, %Library.Populate)
{

Relationship schedules As Excursions.Schedule [ Cardinality = many, Inverse = guide ];

Property FIO As %String;

Storage Default
{
<Data name="GuideDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FIO</Value>
</Value>
</Data>
<DataLocation>^Excursions.GuideD</DataLocation>
<DefaultData>GuideDefaultData</DefaultData>
<IdLocation>^Excursions.GuideD</IdLocation>
<IndexLocation>^Excursions.GuideI</IndexLocation>
<StreamLocation>^Excursions.GuideS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
