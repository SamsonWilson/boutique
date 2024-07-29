from django.shortcuts import render

# Create your views here.
# views.py
from rest_framework import viewsets
from .models import Categorie, Produit, Avis, Panier, Commande, Notification, Promotion, AdresseLivraison
from .serializers import CategorieSerializer, ProduitSerializer, AvisSerializer, PanierSerializer, CommandeSerializer, NotificationSerializer, PromotionSerializer, AdresseLivraisonSerializer

class CategorieViewSet(viewsets.ModelViewSet):
    queryset = Categorie.objects.all()
    serializer_class = CategorieSerializer

class ProduitViewSet(viewsets.ModelViewSet):
    queryset = Produit.objects.all()
    serializer_class = ProduitSerializer

class AvisViewSet(viewsets.ModelViewSet):
    queryset = Avis.objects.all()
    serializer_class = AvisSerializer

class PanierViewSet(viewsets.ModelViewSet):
    queryset = Panier.objects.all()
    serializer_class = PanierSerializer

class CommandeViewSet(viewsets.ModelViewSet):
    queryset = Commande.objects.all()
    serializer_class = CommandeSerializer

class NotificationViewSet(viewsets.ModelViewSet):
    queryset = Notification.objects.all()
    serializer_class = NotificationSerializer

class PromotionViewSet(viewsets.ModelViewSet):
    queryset = Promotion.objects.all()
    serializer_class = PromotionSerializer

class AdresseLivraisonViewSet(viewsets.ModelViewSet):
    queryset = AdresseLivraison.objects.all()
    serializer_class = AdresseLivraisonSerializer
