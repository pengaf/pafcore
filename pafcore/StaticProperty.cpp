#include "StaticProperty.h"
#include "StaticProperty.mh"
#include "StaticProperty.ic"
#include "StaticProperty.mc"

BEGIN_PAFCORE


StaticProperty::StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
	StaticPropertyGet get, StaticPropertySet set) :
	Metadata(name, attributes)
{
	m_type = type;
	m_getterTypeCompound = getterTypeCompound;
	m_setterTypeCompound = setterTypeCompound;
	m_propertyCategory = PropertyCategory::simple_property;
	m_simpleGet = get;
	m_simpleSet = set;
}

StaticProperty::StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
	ArrayStaticPropertySize size, ArrayStaticPropertyGet get, ArrayStaticPropertySet set)
{
	m_type = type;
	m_getterTypeCompound = getterTypeCompound;
	m_setterTypeCompound = setterTypeCompound;
	m_propertyCategory = PropertyCategory::array_property;
	m_arraySize = size;
	m_arrayGet = get;
	m_arraySet = set;
}

StaticProperty::StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
	StaticPropertyIterate iterate, StaticPropertyDereference dereference, StaticPropertyInsert insert, StaticPropertyErase erase) :
	Metadata(name, attributes)
{
	m_type = type;
	m_getterTypeCompound = getterTypeCompound;
	m_setterTypeCompound = setterTypeCompound;
	m_propertyCategory = PropertyCategory::collection_property;
	m_collectionIterate = iterate;
	m_collectionGet = get;
	m_collectionSet = set;
}

END_PAFCORE