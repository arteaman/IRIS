import React from "react";

import { UserContext } from "../user";
import { getUserSchedule } from "../services/api";
import { ScheduleTable } from "../components/ScheduleTable";

import { useHistory } from "react-router-dom";

export const MySchedulePage = () => {
  const { user } = React.useContext(UserContext);
  const [schedule, setSchedule] = React.useState([]);
  const history = useHistory();
  React.useEffect(() => {
    if (!user) {
      history.push("/sign_in");
      return;
    }
    const fetch = async () => {
      const schedules = await getUserSchedule(user.ID);
      console.log(schedules);
      setSchedule(schedules.schedule);
    };
    fetch();
  }, [user, history]);

  console.log(schedule);
  if (user) {
    return (
      <ScheduleTable
        setSchedule={setSchedule}
        showApplyButton={false}
        schedule={schedule}
        userID={user.ID}
      />
    );
  }
  return null;
};
