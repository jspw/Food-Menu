package com.example.sylhetrestaurant;


import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    private static int time=10000;
    Animation topAnim,blink;
    ImageView imageview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_main);

        topAnim= AnimationUtils.loadAnimation(getApplicationContext(),R.anim.topanimation);
        blink=AnimationUtils.loadAnimation(getApplicationContext(),R.anim.bounceanimation);
        imageview=findViewById(R.id.splashscreenitem);
        imageview.startAnimation(topAnim);
        imageview.startAnimation(blink);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent SplashIntent=new Intent(MainActivity.this,MainActivity2.class);
                startActivity(SplashIntent);
                finish();

            }
        },time);
    }
}