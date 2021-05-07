import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  useHistory,
} from "react-router-dom";
import { Layout, Menu, Avatar } from "antd";
import "antd/dist/antd.css";
import { useLocalStorage } from "./localStorage";
import { UserContext } from "./user";
import { AuthPage } from "./pages/AuthPage";
import { SchedulePage } from "./pages/Schedule";
import { MySchedulePage } from "./pages/MySchedule";

const App = () => {
  const [user, setUser] = useLocalStorage("user", null);
  return (
    <UserContext.Provider value={{ user: user, setUser: setUser }}>
      <Router>
        <Layout>
          <Switch>
            <Route exact path="/">
              <Header selected={["home"]} />
              <Layout.Content className="content">
                <SchedulePage />
              </Layout.Content>
            </Route>
            <Route path="/myschedule">
              <Header selected={["myschedule"]} />
              <Layout.Content className="content">
                <MySchedulePage />
              </Layout.Content>
            </Route>
            <Route path="/sign_in">
              <Header selected={[]} />
              <Layout.Content className="content">
                <h1>Sign In</h1>
                <AuthPage signIn={true} />
              </Layout.Content>
            </Route>
            <Route path="/sign_up">
              <Header selected={[]} />
              <Layout.Content className="content">
                <h1>Sign Up</h1>
                <AuthPage signIn={false} />
              </Layout.Content>
            </Route>
          </Switch>
        </Layout>
      </Router>
    </UserContext.Provider>
  );
};

const Header = ({ selected }) => {
  const { user, setUser } = React.useContext(UserContext);
  const loggedIn = user !== null;
  const history = useHistory();
  console.log(user);

  const onMenuClick = ({ key }) => {
    console.log(key);
    if (key === "sign_out") {
      setUser(null);
      history.push("/");
    }
  };
  return (
    <Layout.Header>
      <Menu
        mode="horizontal"
        theme="dark"
        defaultSelectedKeys={["1"]}
        selectedKeys={selected}
        onClick={onMenuClick}
      >
        <Menu.Item key="home">
          <Link to="/">Home</Link>
        </Menu.Item>
        {loggedIn ? (
          <>
            <Menu.Item key="myschedule">
              <Link to="/myschedule">My Schedule</Link>
            </Menu.Item>
            <Menu.SubMenu key="user" icon={<Avatar>{user?.email[0]}</Avatar>}>
              <>
                <Menu.Item>{user?.Email}</Menu.Item>
                <Menu.Item key="sign_out">Sign Out</Menu.Item>
              </>
            </Menu.SubMenu>
          </>
        ) : (
          <>
            <Menu.Item key="sign_in">
              <Link to="/sign_in">Sign In</Link>
            </Menu.Item>
            <Menu.Item key="sign_up">
              <Link to="/sign_up">Sign Up</Link>
            </Menu.Item>
          </>
        )}
      </Menu>
    </Layout.Header>
  );
};

export default App;
