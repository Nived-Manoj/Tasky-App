import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _searchController2;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _searchAnimation;

  String _selectedFilter = 'All';
  bool _isSearching = false;
  String _searchQuery = '';

  final List<String> _filters = [
    'All',
    'Tasks',
    'Projects',
    'Teams',
    'Documents'
  ];

  final List<Map<String, dynamic>> _searchResults = [
    {
      'title': 'Mobile App Development',
      'subtitle': 'Flutter project with team collaboration',
      'type': 'Project',
      'priority': 'High',
      'dueDate': '2024-01-15',
      'members': 3,
      'progress': 0.7,
      'icon': Icons.mobile_friendly,
      'color': Colors.blue,
    },
    {
      'title': 'Design Review Meeting',
      'subtitle': 'Review UI/UX designs with stakeholders',
      'type': 'Task',
      'priority': 'Medium',
      'dueDate': '2024-01-10',
      'members': 5,
      'progress': 0.4,
      'icon': Icons.design_services,
      'color': Colors.purple,
    },
    {
      'title': 'Backend API Integration',
      'subtitle': 'Connect frontend with REST APIs',
      'type': 'Task',
      'priority': 'Critical',
      'dueDate': '2024-01-12',
      'members': 2,
      'progress': 0.9,
      'icon': Icons.api,
      'color': Colors.orange,
    },
    {
      'title': 'Marketing Campaign',
      'subtitle': 'Launch social media marketing strategy',
      'type': 'Project',
      'priority': 'Low',
      'dueDate': '2024-01-20',
      'members': 4,
      'progress': 0.3,
      'icon': Icons.campaign,
      'color': Colors.green,
    },
    {
      'title': 'Database Optimization',
      'subtitle': 'Improve query performance and indexing',
      'type': 'Task',
      'priority': 'High',
      'dueDate': '2024-01-14',
      'members': 1,
      'progress': 0.6,
      'icon': Icons.storage,
      'color': Colors.red,
    },
    {
      'title': 'User Testing Session',
      'subtitle': 'Conduct usability testing with real users',
      'type': 'Task',
      'priority': 'Medium',
      'dueDate': '2024-01-18',
      'members': 3,
      'progress': 0.2,
      'icon': Icons.group,
      'color': Colors.teal,
    },
    {
      'title': 'Documentation Update',
      'subtitle': 'Update technical documentation and guides',
      'type': 'Task',
      'priority': 'Low',
      'dueDate': '2024-01-25',
      'members': 2,
      'progress': 0.8,
      'icon': Icons.description,
      'color': Colors.indigo,
    },
  ];

  List<Map<String, dynamic>> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _filteredResults = _searchResults;
    _searchController.addListener(_onSearchChanged);
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _searchController2 = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _searchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _searchController2,
      curve: Curves.easeInOut,
    ));

    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
    _searchController2.repeat();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _searchController2.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _isSearching = _searchQuery.isNotEmpty;
      _filterResults();
    });
  }

  void _filterResults() {
    _filteredResults = _searchResults.where((item) {
      final matchesSearch = _searchQuery.isEmpty ||
          item['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item['subtitle'].toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesFilter = _selectedFilter == 'All' ||
          item['type'] ==
              _selectedFilter.substring(0, _selectedFilter.length - 1);

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.mainbg?.withOpacity(0.1) ??
                  Colors.grey.withOpacity(0.1),
              Colors.blue.withOpacity(0.05),
              Colors.purple.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAnimatedHeader(),
              _buildSearchBar(),
              _buildFilterChips(),
              _buildSearchStats(),
              Expanded(child: _buildSearchResults()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedHeader() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstant.Black,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "Search & Discover",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.Black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Find tasks, projects, and more",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.Black?.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _searchAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _searchAnimation.value * 2 * 3.14159,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          decoration: InputDecoration(
            hintText: "Search tasks, projects, teams...",
            hintStyle: TextStyle(
              color: ColorConstant.Black?.withOpacity(0.5),
              fontSize: 16,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.search,
                color: ColorConstant.Black?.withOpacity(0.7),
                size: 24,
              ),
            ),
            suffixIcon: _isSearching
                ? GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      _searchFocusNode.unfocus();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.clear,
                        color: ColorConstant.Black?.withOpacity(0.7),
                        size: 20,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.mic,
                      color: ColorConstant.Black?.withOpacity(0.5),
                      size: 20,
                    ),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
          style: TextStyle(
            color: ColorConstant.Black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = _selectedFilter == filter;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                  _filterResults();
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorConstant.primaryColor ?? Colors.blue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected
                        ? ColorConstant.primaryColor ?? Colors.blue
                        : Colors.grey.withOpacity(0.3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? (ColorConstant.primaryColor ?? Colors.blue)
                              .withOpacity(0.3)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected ? Colors.white : ColorConstant.Black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchStats() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${_filteredResults.length} results found",
            style: TextStyle(
              color: ColorConstant.Black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (_isSearching)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Searching...",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_filteredResults.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _filteredResults.length,
      itemBuilder: (context, index) {
        return _buildSearchResultItem(_filteredResults[index], index);
      },
    );
  }

  Widget _buildSearchResultItem(Map<String, dynamic> item, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: item['color'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          item['icon'],
                          color: item['color'],
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.Black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subtitle'],
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorConstant.Black?.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildPriorityBadge(item['priority']),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildInfoChip(Icons.category, item['type']),
                      const SizedBox(width: 8),
                      _buildInfoChip(
                          Icons.people, "${item['members']} members"),
                      const SizedBox(width: 8),
                      _buildInfoChip(Icons.calendar_today, item['dueDate']),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Progress",
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorConstant.Black?.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${(item['progress'] * 100).toInt()}%",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: item['color'],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: ColorConstant.Black?.withOpacity(0.3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: item['progress'],
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(item['color']),
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPriorityBadge(String priority) {
    Color color;
    switch (priority) {
      case 'Critical':
        color = Colors.red;
        break;
      case 'High':
        color = Colors.orange;
        break;
      case 'Medium':
        color = Colors.blue;
        break;
      case 'Low':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        priority,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorConstant.mainbg?.withOpacity(0.5) ??
            Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: ColorConstant.Black?.withOpacity(0.6),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: ColorConstant.Black?.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.search_off,
              size: 80,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _searchQuery.isEmpty ? "Start searching..." : "No results found",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorConstant.Black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isEmpty
                ? "Type something to search for tasks, projects, and more"
                : "Try adjusting your search or filters",
            style: TextStyle(
              fontSize: 16,
              color: ColorConstant.Black?.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
