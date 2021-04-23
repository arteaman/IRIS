Class Excursions.Schedule Extends (%Library.Persistent, %Library.Populate)
{

Relationship excursion As Excursions.Excursion [ Cardinality = one, Inverse = schedules ];

Relationship guide As Excursions.Guide [ Cardinality = one, Inverse = schedules ];

Relationship Applications As Excursions.Application [ Cardinality = many, Inverse = Schedule ];

Property FreeCell As %Integer;

Property DateTime As %PosixTime;

Storage Default
{
<Data name="ScheduleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>excursion</Value>
</Value>
<Value name="3">
<Value>guide</Value>
</Value>
<Value name="4">
<Value>FreeCell</Value>
</Value>
<Value name="5">
<Value>DateTime</Value>
</Value>
</Data>
<DataLocation>^Excursions.ScheduleD</DataLocation>
<DefaultData>ScheduleDefaultData</DefaultData>
<IdLocation>^Excursions.ScheduleD</IdLocation>
<IndexLocation>^Excursions.ScheduleI</IndexLocation>
<StreamLocation>^Excursions.ScheduleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
