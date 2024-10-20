import json
import requests
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.spinner import Spinner
from kivy.uix.mapview import MapView, MapMarker

class MainApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical')

        # MapView
        self.map_view = MapView(zoom=12, lat=37.7749, lon=-122.4194)  # San Francisco coordinates
        layout.add_widget(self.map_view)

        # Zoom buttons
        zoom_layout = BoxLayout(orientation='vertical', size_hint=(None, None), width=50, height=100)
        zoom_in_button = Button(text='+', on_press=lambda x: self.zoom(self.map_view, 1))
        zoom_out_button = Button(text='-', on_press=lambda x: self.zoom(self.map_view, -1))
        zoom_layout.add_widget(zoom_in_button)
        zoom_layout.add_widget(zoom_out_button)
        self.map_view.add_widget(zoom_layout)

        # Choice lists
        choices_layout = BoxLayout(orientation='horizontal', size_hint_y=None, height=50)

        self.truck_type_spinner = Spinner(
            text='Both',
            values=('Truck', 'Push cart', 'Both'),
            on_text=self.update_map
        )
        self.food_type_spinner = Spinner(
            text='Any',
            values=self.get_food_types(),
            on_text=self.update_map
        )

        choices_layout.add_widget(self.truck_type_spinner)
        choices_layout.add_widget(self.food_type_spinner)
        layout.add_widget(choices_layout)

        # Fetch food truck data
        self.fetch_food_truck_data()

        return layout

    def zoom(self, map_view, zoom_delta):
        map_view.zoom = max(1, min(20, map_view.zoom + zoom_delta))

    def get_food_types(self):
        # UNDER CONTRUCTION
        # Placeholder for fetching food types
        # Using API, gather a list of all the types of food offered from "FoodItems" field.  
        # Use this to populate the "choice list" that user can use to filter out the trucks thy don't care about
        return ('Any', 'Mexican', 'Chinese', 'Italian', 'Indian')

    def fetch_food_truck_data(self):
        # SF food truck data API URL, See https://dev.socrata.com/foundry/data.sfgov.org/rqzj-sfat
        # CSV output is also available.  Replace ../json with .../csv
        url = "https://data.sfgov.org/resource/rqzj-sfat/json"
        params = {
            'truck_type': self.truck_type_spinner.text if self.truck_type_spinner.text != 'Both' else '',
            'food_type': self.food_type_spinner.text if self.food_type_spinner.text != 'Any' else ''
        }
        response = requests.get(url, params=params)

        if response.status_code == 200:
            data = response.json()
            self.update_map_with_data(data)
        else:
            print("Failed to fetch data")

    def update_map_with_data(self, data):
        self.map_view.clear_widgets()
        for truck in data:
            lat = truck['latitude']
            lon = truck['longitude']
            marker = MapMarker(lat=lat, lon=lon)
            self.map_view.add_marker(marker)

    def update_map(self, *args):
        self.fetch_food_truck_data()

if __name__ == '__main__':
    MainApp().run()
