#import "Metadata.i"
#import "Type.i"

#{
#include "SmartPtr.h"
#}

namespace paf
{

#{
	struct Attributes;
	class StaticProperty;
	class Iterator;
	class Variant;

	typedef ErrorCode(*SimpleStaticPropertyGet)(StaticProperty* staticProperty, Variant* value);
	typedef ErrorCode(*SimpleStaticPropertySet)(StaticProperty* staticProperty, Variant* value);

	typedef ErrorCode(*ArrayStaticPropertySize)(StaticProperty* staticProperty, size_t& size);
	typedef ErrorCode(*ArrayStaticPropertyGet)(StaticProperty* staticProperty, size_t index, Variant* value);
	typedef ErrorCode(*ArrayStaticPropertySet)(StaticProperty* staticProperty, size_t index, Variant* value);

	typedef ErrorCode(*CollectionStaticPropertyIterate)(StaticProperty* staticProperty, UniquePtr<Iterator>& iterator);
	typedef ErrorCode(*CollectionStaticPropertyGet)(StaticProperty* staticProperty, Iterator* iterator, Variant* value);
	typedef ErrorCode(*CollectionStaticPropertySet)(StaticProperty* staticProperty, Iterator* iterator, size_t removeCount, Variant* value);
#}

	abstract class(static_property)#PAFCORE_EXPORT StaticProperty : Metadata
	{
		Type type { get* };
		TypeCompound getterTypeCompound{ get };
		TypeCompound setterTypeCompound{ get };
		PropertyCategory propertyCategory{ get };
#{
	public:
		StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
			SimpleStaticPropertyGet get, SimpleStaticPropertySet set);

		StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
			ArrayStaticPropertySize size, ArrayStaticPropertyGet get, ArrayStaticPropertySet set);

		StaticProperty(const char* name, Attributes* attributes, Type* type, TypeCompound getterTypeCompound, TypeCompound setterTypeCompound,
			CollectionStaticPropertyIterate iterate, CollectionStaticPropertyGet get, CollectionStaticPropertySet set);
	public:
		Type* m_type;
		TypeCompound m_getterTypeCompound;
		TypeCompound m_setterTypeCompound;
		PropertyCategory m_propertyCategory;
		union
		{
			struct
			{
				SimpleStaticPropertyGet m_simpleGet;
				SimpleStaticPropertySet m_simpleSet;
			};
			struct
			{
				ArrayStaticPropertySize m_arraySize;
				ArrayStaticPropertyGet m_arrayGet;
				ArrayStaticPropertySet m_arraySet;
			};
			struct
			{
				CollectionStaticPropertyIterate m_collectionIterate;
				CollectionStaticPropertyGet m_collectionGet;
				CollectionStaticPropertySet m_collectionSet;
			};
		};
#}
	};

#{
	inline RawPtr<Type> StaticProperty::get_type() const
	{
		return m_type;
	}

	inline TypeCompound StaticProperty::get_getterTypeCompound() const
	{
		return m_getterTypeCompound;
	}

	inline TypeCompound StaticProperty::get_setterTypeCompound() const
	{
		return m_setterTypeCompound;
	}

	inline PropertyCategory StaticProperty::get_propertyCategory() const
	{
		return m_propertyCategory;
	}
#}


}