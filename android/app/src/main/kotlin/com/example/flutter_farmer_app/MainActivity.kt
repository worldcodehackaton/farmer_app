package com.example.flutter_farmer_app

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("e6a18f4f-8575-4704-9a20-8b0c6dc55ff6") 
    super.configureFlutterEngine(flutterEngine)
  }
}