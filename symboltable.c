#include "symboltable.h"

struct symbol* createTable()
{
	struct symbol* root = (struct symbol*)malloc(sizeof(struct symbol));

	root->symbol_name = NULL;

	return root;
}

struct symbol* addSymbol(struct symbol* node, char* symbol_name)
{
	/* We've reached a node that's unallocated, it will be our new leaf */
	if (node == NULL)
	{
		printf("win?\n");
		struct symbol* root = (struct symbol*)malloc(sizeof(struct symbol));

		root->symbol_name = symbol_name;

		return root;
	}

	/* Compare strings so we know where to put our new node */
	enum ComparisonValue comparison = compareStrings(symbol_name, node->symbol_name);

	if (comparison == LESS_THAN)
	{
		/* if left is open, put it there, else, let's kill going down the tree */
		if (node->left == NULL)
		{
			node->left = (struct symbol*)malloc(sizeof(struct symbol));

			node->left->symbol_name = symbol_name;

			return node->left;
		}
		else
		{
			return addSymbol(node->left, symbol_name);
		}

	} 
	else if (comparison == GREATER_THAN)
	{
		/* if right is open, put it there, else, let's kill going down the tree */
		if (node->right == NULL)
		{
			node->right = (struct symbol*)malloc(sizeof(struct symbol));

			node->right->symbol_name = symbol_name;

			return node->right;
		}
		else
		{
			return addSymbol(node->right, symbol_name);
		}

	}
	else /* comparison is equal */
	{
		return NULL;
	}
}

uint16_t calculateHeight(struct symbol* node)
{
	/* we've reached the end, return 0 */
	if (node == NULL)
	{
		return 0;
	}

	uint16_t left_subtree_height = calculateHeight(node->left);
	uint16_t right_subtree_height = calculateHeight(node->right);

	if (left_subtree_height < right_subtree_height)
		return right_subtree_height + 1;
	else
		return left_subtree_height + 1;
}

/* Return a value from the ComparisonValue enum relative between first term and second term */
enum ComparisonValue compareStrings(const char* first_term, const char* second_term)
{
	uint32_t first_term_length = strlen(first_term);
	uint32_t second_term_length = strlen(second_term);
	uint32_t comparison_length;

	/* Find the smaller length */
	if (first_term_length < second_term_length)
		comparison_length = first_term_length;
	else
		comparison_length = second_term_length;

	/* We need to compare up to the smaller length number of characters */
	for (uint32_t index = 0; index < comparison_length; index++)
	{
		if (first_term[index] > second_term[index])
			return GREATER_THAN;
		else if (first_term[index] < second_term[index])
			return LESS_THAN;
	}


	if (first_term_length == second_term_length)
		return EQUAL_TO;
	else if (first_term_length < second_term_length)
		return LESS_THAN;
	else
		return GREATER_THAN;
}
