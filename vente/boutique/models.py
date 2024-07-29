from django.db import models

# Create your models here.
from django.db import models

class Categorie(models.Model):
    nom = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.nom


class Produit(models.Model):
    nom = models.CharField(max_length=100)
    description = models.TextField()
    prix = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='images/')
    categorie = models.ForeignKey(Categorie, on_delete=models.CASCADE)
    stock = models.IntegerField(default=0)

    def __str__(self):
        return self.nom

class Avis(models.Model):
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE, related_name='avis')
    utilisateur = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    note = models.IntegerField(choices=[(i, str(i)) for i in range(1, 6)])
    commentaire = models.TextField(blank=True, null=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.utilisateur.username} - {self.produit.nom}'

class Panier(models.Model):
    utilisateur = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    produits = models.ManyToManyField(Produit, through='PanierProduit')

    def __str__(self):
        return f'Panier de {self.utilisateur.username}'

class PanierProduit(models.Model):
    panier = models.ForeignKey(Panier, on_delete=models.CASCADE)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField(default=1)



class Commande(models.Model):
    STATUS_CHOICES = [
        ('en attente', 'En attente'),
        ('en cours de traitement', 'En cours de traitement'),
        ('expédiée', 'Expédiée'),
        ('livrée', 'Livrée'),
    ]

    utilisateur = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    produits = models.ManyToManyField(Produit, through='CommandeProduit')
    total = models.DecimalField(max_digits=10, decimal_places=2)
    statut = models.CharField(max_length=30, choices=STATUS_CHOICES, default='en attente')
    date_commande = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Commande {self.id} de {self.utilisateur.username}'

class CommandeProduit(models.Model):
    commande = models.ForeignKey(Commande, on_delete=models.CASCADE)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField()
    prix = models.DecimalField(max_digits=10, decimal_places=2)



class Notification(models.Model):
    utilisateur = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    message = models.TextField()
    lue = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Notification pour {self.utilisateur.username}'



class Promotion(models.Model):
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    reduction = models.DecimalField(max_digits=5, decimal_places=2)
    date_debut = models.DateTimeField()
    date_fin = models.DateTimeField()

    def __str__(self):
        return f'Promotion sur {self.produit.nom}'



class AdresseLivraison(models.Model):
    utilisateur = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    adresse = models.CharField(max_length=255)
    ville = models.CharField(max_length=100)
    code_postal = models.CharField(max_length=20)
    pays = models.CharField(max_length=100)

    def __str__(self):
        return f'Adresse de {self.utilisateur.username}'