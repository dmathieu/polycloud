!SLIDE
# Messaging Pattern

!SLIDE
# Voyons l'évolution possible du code

!SLIDE small

    @@@ ruby
    # Images Controller
    image = ImageUploader.new(params[:image]).process
    Publisher.publish('new_image', image)

!SLIDE small

    @@@ ruby
    # Images Controller
    image = ImageUploader.new(params[:image]).process
    Publisher.publish('new_image', image)

    # Resizer
    queue.subscribe do |image|
      image.resize
    end

!SLIDE small

    @@@ ruby
    # Images Controller
    image = ImageUploader.new(params[:image]).process
    Publisher.publish('new_image', image)

    # Resizer
    queue.subscribe do |image|
      ImageResizer.new(image).process
    end

    # Notifier
    queue.subscribe do |image|
      ImageNotifier.new(image).process
    end

!SLIDE small

    @@@ ruby
    # Images Controller
    image = ImageUploader.new(params[:image]).process
    Publisher.publish('new_image', image)

    # Resizer
    queue.subscribe do |image|
      ImageResizer.new(image).process
    end

    # Notifier
    queue.subscribe do |image|
      ImageNotifier.new(image).process
    end

    # Badges
    queue.subscribe do |image|
      ImageBadges.new(image).process
    end

!SLIDE bullets incremental
# Et maintenant ...

* Chaque subscriber peut évoluer comme vous le souhaitez
* Votre application reste lisible et maintenable

!SLIDE bullets incremental
# Messaging

* Partagez des données entre différents processus
* Les processus peuvent être des parties de différente applications
* Les applications peuvent être situées sur des machines différentes
* La communication est asynchrone

!SLIDE
# Patterns

!SLIDE
# Worker Pattern

![worker](worker.png)

!SLIDE
# Publisher/Subscriber Pattern

![Publisher Subscriber](publisher-subscriber.png)

!SLIDE
# Topic Pattern

![Topic](topic.png)

!SLIDE
# RPC Pattern

![RPC](rpc.png)
