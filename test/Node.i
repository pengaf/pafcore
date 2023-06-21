#import "../pafcore/Utility.i"

#{
#include <string>
class Scene;
#}

class Node : paf::Introspectable
{
	Node();
	void addChild(Node* node);
	void addSibling(Node* node);
	bool isFreeNode() const;
#{
public:
	void check__(Scene* scene, Node* parent, int depth);
public:
	paf::SharedPtr<Node> m_nextSibling;
	paf::WeakPtr<Node> m_prevSibling;
	paf::SharedPtr<Node> m_childHead;
	paf::WeakPtr<Node> m_childTail;
	paf::WeakPtr<Node> m_parent;
	paf::WeakPtr<Scene> m_scene;
	std::string m_name;
//public:
//	static paf::BorrowedPtr<Node> PushBack(paf::UniquePtr<Node>&& node, paf::BorrowedPtr<Node> parentNode);
//	static paf::BorrowedPtr<Node> InsertBefore(paf::UniquePtr<Node>&& node, paf::BorrowedPtr<Node> siblingNode);
//	static paf::UniquePtr<Node> RemoveFromParent(paf::BorrowedPtr<Node> node);
#}
};

#{
//inline void Node::addChild(Node* node)
//{
//}

inline void Node::addSibling(Node* node)
{
}

inline bool Node::isFreeNode() const
{
	return !bool(m_parent);
}

#}