# urls.py
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import CategorieViewSet, ProduitViewSet, AvisViewSet, PanierViewSet, CommandeViewSet, NotificationViewSet, PromotionViewSet, AdresseLivraisonViewSet




router = DefaultRouter()
router.register(r'categories', CategorieViewSet)
router.register(r'produits', ProduitViewSet)
router.register(r'avis', AvisViewSet)
router.register(r'paniers', PanierViewSet)
router.register(r'commandes', CommandeViewSet)
router.register(r'notifications', NotificationViewSet)
router.register(r'promotions', PromotionViewSet)
router.register(r'adresses-livraison', AdresseLivraisonViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
