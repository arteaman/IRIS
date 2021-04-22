Class Excursions.Schedule Extends (%Library.Persistent, %Library.Populate)
{

Relationship excursion As Excursions.Excursion [ Cardinality = one, Inverse = schedules ];

Relationship guide As Excursions.Guide [ Cardinality = one, Inverse = schedules ];

Property FreeCell As %Integer;

Property DateTime As %String;

Storage Default
{
<Data name="GuideDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FreeCell</Value>
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
