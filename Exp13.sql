SQL> BEGIN
  2    DBMS_XMLSCHEMA.registerSchema(
  3      schemaurl => 'my_schema.xsd',
  4      schemadoc => '<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  5  <xs:element name="shiporder"><xs:complexType><xs:sequence>
  6  <xs:element name="orderperson" type="xs:string"/>
  7  <xs:element name="shipto"><xs:complexType><xs:sequence>
  8  <xs:element name="name" type="xs:string"/>
  9  <xs:element name="address" type="xs:string"/>
 10  <xs:element name="city" type="xs:string"/>
 11  <xs:element name="country" type="xs:string"/>
 12  </xs:sequence></xs:complexType></xs:element>
 13  <xs:element name="item" maxOccurs="unbounded"><xs:complexType><xs:sequence>
 14  <xs:element name="title" type="xs:string"/>
 15  <xs:element name="note" type="xs:string" minOccurs="0"/>
 16  <xs:element name="quantity" type="xs:positiveInteger"/>
 17  <xs:element name="price" type="xs:decimal"/>
 18  </xs:sequence></xs:complexType></xs:element>
 19  </xs:sequence><xs:attribute name="orderid" type="xs:string" use="required"/></xs:complexType></xs:element>
 20  </xs:schema>',
 21      local     => TRUE,
 22      gentypes  => FALSE,
 23      gentables => FALSE);
 24  END;
 25  /

PL/SQL procedure successfully completed.

SQL> CREATE TABLE t1 (id NUMBER, xml_doc XMLTYPE);

Table created.

SQL> INSERT INTO t1 VALUES (1, XMLTYPE(q'[<?xml version="1.0" encoding="UTF-8"?>
  2  <shiporder orderid="889923">
  3  <orderperson>John Smith</orderperson>
  4  <shipto><name>Ola Nordmann</name><address>Langgt 23</address><city>4000 Stavanger</city><country>Norway</country></shipto>
  5  <item><title>Empire Burlesque</title><note>Special Edition</note><quantity>1</quantity><price>10.90</price></item>
  6  <item><title>Hide your heart</title><quantity>1</quantity><price>9.90</price></item>
  7  </shiporder>]'));

1 row created.

SQL> INSERT INTO t1 VALUES (2, XMLTYPE(q'[<?xml version="1.0" encoding="UTF-8"?>
  2  <shiporder orderid="889923">
  3  <orderperson>John Smith</orderperson>
  4  <shipto><name1>Ola Nordmann</name1><address>Langgt 23</address><city>4000 Stavanger</city><country>Norway</country></shipto>
  5  <item><title>Empire Burlesque</title><note>Special Edition</note><quantity>1</quantity><price>10.90</price></item>
  6  <item><title>Hide your heart</title><quantity>1</quantity><price>9.90</price></item>
  7  </shiporder>]'));

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SET LINESIZE 100

SQL> SELECT t.id, t.xml_doc.isSchemaValid('my_schema.xsd') AS is_valid FROM t1 t;

        ID   IS_VALID
---------- ----------
         1          1
         2          0