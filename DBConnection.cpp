/*#include "DBConnection.h"
#include <conio.h>
#include <iostream>
using namespace sql;
using namespace std;


DBConnection::DBConnection() {

  try {
    mysql::MySQL_Driver* driver = mysql::get_mysql_driver_instance();

    connection = driver->connect("localhost", "root", "Chooi456_");
    //database address, username, password

    connection->setSchema("sushi_restaurant_menu_suggestion_system"); //database name
    stmt = nullptr;
    res = nullptr;
  }
  catch (sql::SQLException& e) {
    if (e.getErrorCode() == 0) {
      system("cls");
      cout << "Unable to connect to database";
      _getch();
      exit(0);
      return;
    }
    cout << "# ERR: SQLException in " << FILE;
    cout << "(" << FUNCTION << ") on line " << LINE << endl;
    cout << "# ERR: " << e.what();
    cout << " (MySQL error code: " << e.getErrorCode();
    cout << ", SQLState: " << e.getSQLState() << " )" << endl;
    _getch();
  }
}

DBConnection::~DBConnection() {
  try {
    if (connection) {
      connection->close();
    }
    if (stmt) {
      stmt->close();
    }
    if (res) {
      res->close();
    }
  }
  catch (sql::SQLException& e) {
    cout << "# ERR: SQLException in " << FILE;
    cout << "(" << FUNCTION << ") on line " << LINE << endl;
    cout << "# ERR: " << e.what();
    cout << " (MySQL error code: " << e.getErrorCode();
    cout << ", SQLState: " << e.getSQLState() << " )" << endl;
    _getch();
  }
}

void DBConnection::prepareStatement(string query) {
  stmt = connection->prepareStatement(query);
}

void DBConnection::QueryStatement() {

  try {
    stmt->executeUpdate();
  }
  catch (sql::SQLException& e) {
    cout << "# ERR: SQLException in " << FILE;
    cout << "(" << FUNCTION << ") on line " << LINE << endl;
    cout << "# ERR: " << e.what();
    cout << " (MySQL error code: " << e.getErrorCode();
    cout << ", SQLState: " << e.getSQLState() << " )" << endl;
    _getch();
  }
}
  void DBConnection::QueryResult() {
    try {
      res = stmt->executeQuery();
    }
    catch (sql::SQLException& e) {
      cout << "# ERR: SQLException in " << FILE;
      cout << "(" << FUNCTION << ") on line " << LINE << endl;
      cout << "# ERR: " << e.what();
      cout << " (MySQL error code: " << e.getErrorCode();
      cout << ", SQLState: " << e.getSQLState() << " )" << endl;
      _getch();
    }
}*/

#include "DBConnection.h"
#include <iostream>
#include <conio.h>

using namespace std;
using namespace sql;

DBConnection::DBConnection() {
    try {
        mysql::MySQL_Driver* driver = mysql::get_mysql_driver_instance();
        connection = driver->connect("tcp://127.0.0.1:3306", "root", "Chooi456_");
        connection->setSchema("sushi_restaurant_menu_suggestion_system");
        stmt = nullptr;
        res = nullptr;
    }
    catch (SQLException& e) {
        cout << "Database connection error: " << e.what() << endl;
        exit(1);
    }
}

DBConnection::~DBConnection() {
    try {
        if (res) res->close();
        if (stmt) stmt->close();
        if (connection) connection->close();
    }
    catch (SQLException& e) {
        cout << "Destructor error: " << e.what() << endl;
    }
}

void DBConnection::prepareStatement(string query) {
    stmt = connection->prepareStatement(query);
}

void DBConnection::QueryStatement() {
    stmt->executeUpdate();
}

void DBConnection::QueryResult() {
    res = stmt->executeQuery();
}