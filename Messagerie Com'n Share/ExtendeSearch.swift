//
//  MapViews.swift
//  Com'n Share
//
//  Created by Medi Olivier on 05/08/2021.
//

import Foundation
import MapKit
import SwiftUI


struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var circleSize: Double
    var annotations: [MKPointAnnotation]
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }


    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = context.coordinator
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        //addAnnotations(to: view)
        addCircle(to: view)
        /*if (view.overlays.count < 1) {
            rebuildOverlays(view)
        }*/
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /*private func rebuildOverlays(_ view: MKMapView)
    {
      withUnsafePointer(to: self) {
          print(String(format: "rebuildOverlays() self=%p", $0))
      }
      
      view.removeOverlays(view.overlays)
        view.addOverlays([MKCircle(center: centerCoordinate, radius: 100.0)])
    }*/
    
    func addCircle(to view: MKMapView) {

        // Lets put a defaut radius of 30 km
        //let radius: Double = 30
        if !view.overlays.isEmpty { view.removeOverlays(view.overlays) }
        
        let aCircle = MKCircle(center: centerCoordinate, radius: circleSize * 1000)
        let mapRect = aCircle.boundingMapRect
        
        view.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
        view.addOverlay(aCircle)
    }
    
    /*func addAnnotations(to view: MKMapView) {
        if let customAnnotation = annotation as? MyCustomPointAnnotation {
            
        }
    }*/
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}



class Coordinator: NSObject {
  var parent: MapView
  let testWithIndex = true // update this to test with index or optional circle
  init(_ parent: MapView) {
    self.parent = parent
  }
}

extension Coordinator : MKMapViewDelegate {
  func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {}
  
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let circleOverlay = overlay as? MKCircle else {return MKOverlayRenderer()}
        let circleRenderer = MKCircleRenderer(circle: circleOverlay)

        withUnsafePointer(to: parent) {
            print(String(format: "mapView rendererFor parent=%p", $0))
        }

        circleRenderer.strokeColor = UIColor(Color("darkO"))
        circleRenderer.fillColor = UIColor(Color("lightP"))
        circleRenderer.alpha = 0.2
        return circleRenderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "goods-annotation") as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "goods-annotation")
        } else {
            annotationView?.annotation = annotation
        }

        if let annotation = annotation as? MapGoodsAnnotation {
            annotationView?.markerTintColor = UIColor(annotation.color)
            if let img = annotation.image {
                annotationView?.glyphImage = img
            }
        }

        return annotationView
    }
}
