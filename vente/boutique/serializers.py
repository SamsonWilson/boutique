# serializers.py
from rest_framework import serializers
from .models import Categorie, Produit, Avis, Panier, PanierProduit, Commande, CommandeProduit, Notification, Promotion, AdresseLivraison

class CategorieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categorie
        fields = '__all__'

class ProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produit
        fields = '__all__'

class AvisSerializer(serializers.ModelSerializer):
    class Meta:
        model = Avis
        fields = '__all__'

class PanierProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = PanierProduit
        fields = '__all__'

class PanierSerializer(serializers.ModelSerializer):
    produits = PanierProduitSerializer(many=True, read_only=True)

    class Meta:
        model = Panier
        fields = '__all__'

class CommandeProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommandeProduit
        fields = '__all__'

class CommandeSerializer(serializers.ModelSerializer):
    produits = CommandeProduitSerializer(many=True, read_only=True)

    class Meta:
        model = Commande
        fields = '__all__'

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = '__all__'

class PromotionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Promotion
        fields = '__all__'

class AdresseLivraisonSerializer(serializers.ModelSerializer):
    class Meta:
        model = AdresseLivraison
        fields = '__all__'
