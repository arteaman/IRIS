Class Excursions.Client Extends (%Library.Persistent, %Library.Populate)
{

Relationship Applications As Excursions.Application [ Cardinality = many, Inverse = Client ];

Property FIO As %String;

Property Email As %String;

Property Mobile As %String;

Index EmailIdx On Email [ Type = index, Unique ];

Storage Default
{
<Data name="ClientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FIO</Value>
</Value>
<Value name="3">
<Value>Email</Value>
</Value>
<Value name="4">
<Value>Mobile</Value>
</Value>
</Data>
<DataLocation>^Excursions.ClientD</DataLocation>
<DefaultData>ClientDefaultData</DefaultData>
<IdLocation>^Excursions.ClientD</IdLocation>
<IndexLocation>^Excursions.ClientI</IndexLocation>
<StreamLocation>^Excursions.ClientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
