!SLIDE
# Pourquoi aurais-je besoin de messages ?
## Un exemple

!SLIDE bullets incremental
# Créons une gallerie de photos

* Une page permettant d'uploader des photos
* Une page permettant de visualiser les photos

!SLIDE
# Rien de bien compliqué

!SLIDE bullets incremental
# Jusqu'à ce que le produit évolue
* Notifier les amis de l'utilisateur lorsqu'il envoie une image
* Ajouter un système de badge à donner aux utilisateurs lorsqu'ils uploadent une image

!SLIDE bullets incremental
* Redimensionner les images afin d'optimiser leur affichage
* Une autre application (écrite en Java) a besoin d'accéder aux images
* L'utilisateur ne souhaites pas attendre 45 secondes le redimensionnement de l'image

!SLIDE
# Voyons l'évolution possible du code

!SLIDE small

    @@@ ruby
    image = ImageUploader.new(params[:image]).process

!SLIDE small

    @@@ ruby
    image = ImageUploader.new(params[:image]).process.
      resize

!SLIDE small

    @@@ ruby
    image = ImageUploader.new(params[:image]).process.
      resize.
      notify(current_user.friends)

!SLIDE small

    @@@ ruby
    image = ImageUploader.new(params[:image]).process.
      resize.
      notify(current_user.friends).
      add_badge_to(current_user)

!SLIDE small

    @@@ ruby
    image = ImageUploader.new(params[:image]).process.
      resize.
      notify(current_user.friends).
      add_badge_to(current_user)

    ImageTweeter.new(image).process

!SLIDE bullets incremental
# Et maintenant ...

* Certaines notifications doivent envoyer un push sur l'iphone de l'utilisateur
* On doit redimensionner les images dans plusieurs formats
* On doit améliorer la vitesse de conversion des images

!SLIDE
# Bienvenue dans spaghetti
## L'application que personne ne comprends et impossible à maintenir

!SLIDE
# Peut-on faire mieux ?
## (évidemment ! Sinon je ne serai pas la)
