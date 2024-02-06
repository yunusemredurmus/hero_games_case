import 'package:flutter/material.dart';
import 'package:hero_games_case/core/utils/base_provider.dart';

import 'package:provider/provider.dart';

class AppScaffold<T extends BaseProvider> extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Drawer? drawer;

  const AppScaffold({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.body,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: backgroundColor ?? Colors.white,
            appBar: appBar,
            body: body,
            drawer: drawer,
          ),
          Selector<T, bool>(
            selector: (_, provider) => provider.isLoading,
            builder: (context, isLoading, child) {
              return Visibility(
                visible: isLoading,
                child: Stack(
                  children: [
                    ModalBarrier(
                        dismissible: false,
                        color: Colors.black.withOpacity(.62)),
                    const Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
