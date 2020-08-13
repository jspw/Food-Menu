package com.example.sylhetrestaurant;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity2 extends AppCompatActivity {

    int [] restauranticon={
            R.drawable.arko,
            R.drawable.artisan,
            R.drawable.coffeeclub,
            R.drawable.hungrystation,
            R.drawable.lavista,
            R.drawable.peepers
    };

    ImageView iconview;
    Animation iconanimationview;
    ListView resttaurantlist;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        iconview=findViewById(R.id.restauranticonlist);
        resttaurantlist=(ListView)findViewById(R.id.listview);
        iconanimationview= AnimationUtils.loadAnimation(getApplicationContext(),R.anim.iconanimation);
        iconview.startAnimation(iconanimationview);

        CustomAdapter customAdapter=new CustomAdapter();
        resttaurantlist.setAdapter(customAdapter);
    }

    class CustomAdapter extends BaseAdapter{

        @Override
        public int getCount() {
            return restauranticon.length;
        }

        @Override
        public Object getItem(int i) {
            return null;
        }

        @Override
        public long getItemId(int i) {
            return 0;
        }

        @Override
        public View getView(int i, View view, ViewGroup viewGroup) {
            view=getLayoutInflater().inflate(R.layout.customlistlayout,null);
            ImageView restaurantlogo=(ImageView)view.findViewById(R.id.restauranticonview);
            TextView restaurantname=(TextView)view.findViewById(R.id.restaurantname);
            TextView restaurantaddress=(TextView)view.findViewById(R.id.restaurantaddress);

            restaurantlogo.setImageResource(restauranticon[i]);

            return view;
        }
    }
}