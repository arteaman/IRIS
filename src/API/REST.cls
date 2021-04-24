Class API.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CONTENTTYPE = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/clients" Method="POST" Call="AddClient"/>
    <Route Url="/clients" Method="GET" Call="GetClientByEmail"/>
    <Route Url="/clients/:UserID/schedules" Method="GET" Call="GetSchedulesByUser"/>
    <Route Url="/applications" Method="POST" Call="AddApplication"/>
    <Route Url="/schedules" Method="GET" Call="GetSchedules"/>
    <Route Url="/schedules/:scheduleID" Method="GET" Call="GetScheduleByID"/>
</Routes>
}

ClassMethod GetClientByEmail()
{

	Set sc = $$$OK
    Set email = $GET(%request.Data("email",1))

	try {
		set client = ##class(Excursions.Client).EmailIdxOpen(email)
		set reutrnValue = {
			"ID": ($NUM(client.%Id())),
			"FIO": (client.FIO),
			"mobile": (client.Mobile),
			"email": (client.Email)
		}
		write reutrnValue.%ToJSON()
	} catch ex {
		Set errText = $SYSTEM.Status.GetErrorText(ex.AsStatus())
		Write errText
		return ex
	}
	return sc
}

ClassMethod GetSchedules() As %Status
{
	Set sc = $$$OK
	Set statusBy = $NUM($GET(%request.Data("userID",1)))
	Set sql = "select JSON_OBJECT('ID': schedules.ID, 'GuideFIO': guides.FIO, 'FreeCells': FreeCell - COALESCE(NonFreeCells, 0), 'ExcursionDate': UNIX_TIMESTAMP(DateTime), 'Location': Location, 'ExcursionType': Type, 'AppliedOn': apps.Schedule ) as schedule FROM Excursions.Schedule as schedules LEFT JOIN (SELECT DISTINCT Schedule FROM Excursions.Application WHERE Client = 1) as apps on schedules.ID = apps.Schedule LEFT JOIN (SELECT Schedule, COUNT(*) as NonFreeCells FROM Excursions.Application GROUP BY Schedule) as schedule_counts on schedule_counts.Schedule = schedules.ID JOIN Excursions.Excursion as excursions on excursions.ID = schedules.excursion JOIN  Excursions.Guide as guides on guides.ID = schedules.guide WHERE DateTime > NOW()" 
	Set rs = ##class(%SQL.Statement).%ExecDirect(, sql)
	Set obj = {"schedule": []}
	while rs.%Next() {
		Set schedule = {}.%FromJSON(rs.schedule)
		Do obj.schedule.%Push(schedule)
	}
	Write obj.%ToJSON()
	Return sc
}

ClassMethod GetSchedulesByUser(UserID As %Integer) As %Status
{
	Set sc = $$$OK
	Set sql = "select JSON_OBJECT('ID': schedules.ID, 'GuideFIO': guides.FIO, 'FreeCells': FreeCell - COALESCE(NonFreeCells, 0), 'ExcursionDate': UNIX_TIMESTAMP(DateTime), 'Location': Location, 'ExcursionType': Type ) as schedule FROM Excursions.Schedule as schedules LEFT JOIN (SELECT Schedule, COUNT(*) as NonFreeCells FROM Excursions.Application GROUP BY Schedule) as schedule_counts on schedule_counts.Schedule = schedules.ID JOIN Excursions.Excursion as excursions on excursions.ID = schedules.excursion JOIN Excursions.Guide as guides on guides.ID = schedules.guide JOIN Excursions.Application as apps on apps.Schedule = schedules.ID WHERE DateTime > NOW() and apps.Client = ?" 
	Set rs = ##class(%SQL.Statement).%ExecDirect(, sql, UserID)
	Set obj = {"schedule": []}
	while rs.%Next() {
		Set schedule = {}.%FromJSON(rs.schedule)
		Do obj.schedule.%Push(schedule)
	}
	Write obj.%ToJSON()
	Return sc
}

ClassMethod AddApplication() As %Status
{
	Set sc = $$$OK
	Try {
		set jo = {}.%FromJSON(%request.Content)
		set application = ##class(Excursions.Application).%New()
		do application.ClientSetObjectId(jo.ClientID)
		do application.ScheduleSetObjectId(jo.ScheduleID)
		set sc = application.%Save()
	} catch ex {
		Set errText = $SYSTEM.Status.GetErrorText(ex.AsStatus())
		Write errText
		return ex
	}
    Set applicationResult = {
		"ClientID": ($NUM(application.Client.%Id())),
		"ScheduleID": ($NUM(application.Schedule.%Id()))
	}
	Write applicationResult.%ToJSON()
	Return sc
}

ClassMethod AddClient() As %Status
{
	Set sc = $$$OK
	Try {
		set jo = {}.%FromJSON(%request.Content)
		set client = ##class(Excursions.Client).%New()
		set client.FIO = jo.FIO
		set client.Email = jo.Email
		set client.Mobile = jo.Mobile
		set sc = client.%Save()
	} catch ex {
		Set errText = $SYSTEM.Status.GetErrorText(ex.AsStatus())
		Write errText
		return ex
	}
    Set cClient = {
		"ClientId": ($NUM(client.%Id())),
		"FIO": (client.FIO ),
		"email": (client.Email),
		"mobile": (client.Mobile)
	}
	Write cClient.%ToJSON()
	Return sc
}

}
