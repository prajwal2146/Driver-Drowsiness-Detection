package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.github.florent37.assetsaudioplayer.AssetsAudioPlayerPlugin;
import xyz.luan.audioplayers.AudioplayersPlugin;
import io.flutter.plugins.camera.CameraPlugin;
import io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin;
import io.flutter.plugins.firebaseauth.FirebaseAuthPlugin;
import io.flutter.plugins.firebase.core.FirebaseCorePlugin;
import io.flutter.plugins.firebasemlvision.FirebaseMlVisionPlugin;
import io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin;
import io.inway.ringtone.player.FlutterRingtonePlayerPlugin;
import com.aloisdeniel.geocoder.GeocoderPlugin;
import com.noeatsleepdev.geoflutterfire.GeoflutterfirePlugin;
import com.baseflow.geolocator.GeolocatorPlugin;
import com.baseflow.googleapiavailability.GoogleApiAvailabilityPlugin;
import io.flutter.plugins.googlemaps.GoogleMapsPlugin;
import io.flutter.plugins.googlesignin.GoogleSignInPlugin;
import io.github.itzmeanjan.intent.IntentPlugin;
import com.lyokone.location.LocationPlugin;
import com.baseflow.location_permissions.LocationPermissionsPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.ly.permission.PermissionPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import pl.ukaszapps.soundpool.SoundpoolPlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AssetsAudioPlayerPlugin.registerWith(registry.registrarFor("com.github.florent37.assetsaudioplayer.AssetsAudioPlayerPlugin"));
    AudioplayersPlugin.registerWith(registry.registrarFor("xyz.luan.audioplayers.AudioplayersPlugin"));
    CameraPlugin.registerWith(registry.registrarFor("io.flutter.plugins.camera.CameraPlugin"));
    CloudFirestorePlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin"));
    FirebaseAuthPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebaseauth.FirebaseAuthPlugin"));
    FirebaseCorePlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.core.FirebaseCorePlugin"));
    FirebaseMlVisionPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemlvision.FirebaseMlVisionPlugin"));
    FlutterAndroidLifecyclePlugin.registerWith(registry.registrarFor("io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin"));
    FlutterRingtonePlayerPlugin.registerWith(registry.registrarFor("io.inway.ringtone.player.FlutterRingtonePlayerPlugin"));
    GeocoderPlugin.registerWith(registry.registrarFor("com.aloisdeniel.geocoder.GeocoderPlugin"));
    GeoflutterfirePlugin.registerWith(registry.registrarFor("com.noeatsleepdev.geoflutterfire.GeoflutterfirePlugin"));
    GeolocatorPlugin.registerWith(registry.registrarFor("com.baseflow.geolocator.GeolocatorPlugin"));
    GoogleApiAvailabilityPlugin.registerWith(registry.registrarFor("com.baseflow.googleapiavailability.GoogleApiAvailabilityPlugin"));
    GoogleMapsPlugin.registerWith(registry.registrarFor("io.flutter.plugins.googlemaps.GoogleMapsPlugin"));
    GoogleSignInPlugin.registerWith(registry.registrarFor("io.flutter.plugins.googlesignin.GoogleSignInPlugin"));
    IntentPlugin.registerWith(registry.registrarFor("io.github.itzmeanjan.intent.IntentPlugin"));
    LocationPlugin.registerWith(registry.registrarFor("com.lyokone.location.LocationPlugin"));
    LocationPermissionsPlugin.registerWith(registry.registrarFor("com.baseflow.location_permissions.LocationPermissionsPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    PermissionPlugin.registerWith(registry.registrarFor("com.ly.permission.PermissionPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    SoundpoolPlugin.registerWith(registry.registrarFor("pl.ukaszapps.soundpool.SoundpoolPlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
