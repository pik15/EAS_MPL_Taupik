package com.example.uas_mobile_lanjut_pik

import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    // TANTANGAN ANTI-AI: Nama Channel Unik untuk Komunikasi Dart-Kotlin
    private val CHANNEL = "com.utd.uas/nim_verifier"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // Memeriksa apakah nama method yang dipanggil dari Dart cocok
            if (call.method == "reverseNIM") {
                val nim = call.argument<String>("nim")
                
                if (nim != null) {
                    // TANTANGAN ANTI-AI: Membalikkan urutan String NIM secara Native di Kotlin
                    val reversedNim = nim.reversed()
                    
                    // Menampilkan Native Toast Android di HP Anda sesuai perintah EAS
                    Toast.makeText(this, "Native Android: $reversedNim", Toast.LENGTH_LONG).show()
                    
                    // Mengirimkan kembali string yang sudah dibalik ke sisi Flutter (Dart)
                    result.success(reversedNim)
                } else {
                    result.error("INVALID_ARGUMENT", "NIM kosong atau null!", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}