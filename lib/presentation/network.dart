
import 'package:dev_tools/extensions/extensions.dart';
import 'package:dev_tools/presentation/individual_network.dart';
import 'package:dev_tools/services/network_services.dart';
import 'package:flutter/material.dart';

class NetworkView extends StatefulWidget {
  const NetworkView({super.key});

  @override
  State<NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends State<NetworkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            onPressed: () => NetworkServies.instance.clearCalls(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: switch ('${NetworkServies.instance.calls}') {
        '[]' => const Center(
            child: Text('No calls!', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        _ => ListView.separated(
            itemCount: NetworkServies.instance.calls.length,
            separatorBuilder: (BuildContext context, int _) => const Divider(color: Colors.white24).pxy(y: 8),
            itemBuilder: (BuildContext context, int _) {
              return ListTile(
                onTap: () => context.push(Theme(data: Theme.of(context), child: IndividualNetworkView(networkEntity: NetworkServies.instance.calls[_]))),
                title: Text('${NetworkServies.instance.calls[_].uri}'),
              );
            },
          ),
      },
    );
  }
}
