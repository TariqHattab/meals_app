import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;

  var vegan = false;

  var vegetarian = false;

  var lactoseFree = false;
  @override
  initState() {
    super.initState();
    glutenFree = widget.filters['gluten'];
    lactoseFree = widget.filters['lactose'];
    vegetarian = widget.filters['vegetarian'];
    vegan = widget.filters['vegan'];
  }

  SwitchListTile buildSwitchListTile(
      bool currentValue, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      onChanged: updateValue,
      value: currentValue,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegetarian': vegetarian,
                'vegan': vegan,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text('Adjust your meal selection.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(glutenFree, 'Gluten-free',
                    'Only include gluten-free meals.', (newVal) {
                  setState(() {
                    glutenFree = newVal;
                  });
                }),
                buildSwitchListTile(lactoseFree, 'Lactose-free',
                    'Only include lactose-free meals.', (newVal) {
                  setState(() {
                    lactoseFree = newVal;
                  });
                }),
                buildSwitchListTile(
                    vegetarian, 'Vegetarian', 'Only include vegetarian meals.',
                    (newVal) {
                  setState(() {
                    vegetarian = newVal;
                  });
                }),
                buildSwitchListTile(vegan, 'Vegan', 'Only include vegan meals.',
                    (newVal) {
                  setState(() {
                    vegan = newVal;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
