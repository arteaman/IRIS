import { Table } from "antd";
import "antd/dist/antd.css";
import { ApplyOnExcursion } from "./ApplyOnExcursion";

export const ScheduleTable = ({
  schedule,
  userID,
  showApplyButton,
  setSchedule,
}) => {
  const options = {
    year: "numeric",
    month: "short",
    day: "numeric",
    hour: "numeric",
    minute: "numeric",
    hour12: false,
  };
  const dateFormat = new Intl.DateTimeFormat(undefined, options);
  const columns = [
    {
      title: "ID",
      dataIndex: "ID",
      align: "center",
    },
    {
      title: "Location",
      dataIndex: "Location",
      align: "center",
      defaultSortOrder: "descend",
      sorter: (a, b) => {
        const locA = a.Location.toUpperCase(); // ignore upper and lowercase
        var locB = b.Location.toUpperCase(); // ignore upper and lowercase
        if (locA < locB) {
          return -1;
        }
        if (locA > locB) {
          return 1;
        }

        // names must be equal
        return 0;
      },
    },
    {
      title: "Type",
      dataIndex: "ExcursionType",
      align: "center",
    },
    {
      title: "Date",
      dataIndex: "ExcursionDate",
      align: "center",
      render: (timestamp) => dateFormat.format(new Date(timestamp * 1000)),
      defaultSortOrder: "descend",
      sorter: (a, b) => a.ExcursionDate - b.ExcursionDate,
    },
    {
      title: "Guide",
      dataIndex: "GuideFIO",
      align: "center",
    },
    {
      title: "Free Cells",
      dataIndex: "FreeCells",
      align: "center",
    },
  ];
  if (showApplyButton) {
    columns.push({
      title: "Apply",
      dataIndex: "AppliedOn",
      render: (isApplied, record) => (
        <ApplyOnExcursion
          setSchedule={setSchedule}
          isApplied={isApplied}
          userID={userID}
          scheduleRowID={record.ID}
        />
      ),
    });
  }
  const data = schedule.map((v, idx) => {
    return { key: idx, ...v };
  });

  return (
    <Table
      expandable={{ childrenColumnName: Symbol() }}
      dataSource={data}
      columns={columns}
      pagination={false}
      sticky={true}
    />
  );
};
