import React from "react";

export const UserContext = React.createContext({
  user: null,
  setUser: () => {},
});

export const useUser = () => {
  const { user, setUser } = React.useContext(UserContext);
  if (!user) {
    throw Error("No user provided!");
  }
  return { user: user, setUser: setUser };
};

