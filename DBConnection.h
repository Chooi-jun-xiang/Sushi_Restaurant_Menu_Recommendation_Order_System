/*#pragma once
#ifndef DBConnection_H
#define DBConnection_H
#include <mysql/jdbc.h>
#include <string>
class DBConnection
{

public :
  DBConnection();
  ~DBConnection();
  void prepareStatement(std::string query);
  sql::PreparedStatement* stmt;
  sql::ResultSet* res;
  void QueryStatement(); // have no result
  void QueryResult(); // it has result

private:
  sql::Connection* connection;

};



#endif // !DBConnection_H

*/

#pragma once
#ifndef DBCONNECTION_H
#define DBCONNECTION_H

#include <mysql/jdbc.h>
#include <string>

class DBConnection {
public:
	DBConnection();
	~DBConnection();
	void prepareStatement(std::string query);
	void QueryStatement();  // For queries without results (INSERT, UPDATE, DELETE)
	void QueryResult();     // For queries that return results (SELECT)
	sql::PreparedStatement* stmt;
	sql::ResultSet* res;

private:
	sql::Connection* connection;
};

#endif
