import { Button } from "antd";
import React, { useState } from "react";
import { createApplication, getSchedule } from "../services/api";

export const ApplyOnExcursion = ({ isApplied, userID, scheduleRowID, setSchedule }) => {
  if (isApplied === null || isApplied === undefined) {
    isApplied = false;
  } else {
    isApplied = true;
  }

  const [applied, setApplied] = useState(isApplied);
  const applyOnSchedule = () => {
    const createAppAsync = async () => {
      const application = await createApplication({
        ClientID: userID,
        ScheduleID: scheduleRowID,
      });
      console.log(application);
      setApplied(true);
      const schedule = await getSchedule(userID)
      setSchedule(schedule.schedule)
    };
    createAppAsync();
  };
  if (!applied) {
    return <Button onClick={applyOnSchedule}>Apply</Button>;
  } else {
    return "Applied ✅";
  }
};
