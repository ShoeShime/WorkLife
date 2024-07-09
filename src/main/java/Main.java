import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class Main extends Application {
    @Override
    public void start(Stage primaryStage) {
        // Create a label to display the hours left
        Label label = new Label();
        label.setFont(new Font("Arial", 24));
        label.setTextFill(Color.WHITE);

        // Create a circle to represent the bubble
        Circle bubble = new Circle(150, Color.BLUEVIOLET);
        bubble.setOpacity(0.7);

        // Stack the label on top of the bubble
        StackPane stackPane = new StackPane();
        stackPane.getChildren().addAll(bubble, label);
        stackPane.setAlignment(Pos.CENTER);

        // Create and set the scene
        Scene scene = new Scene(stackPane, 400, 300);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Hours Left in the Week");
        primaryStage.show();

        // Update hours left every minute
        Timeline timeline = new Timeline(new KeyFrame(Duration.minutes(1), e -> updateHoursLeft(label)));
        timeline.setCycleCount(Timeline.INDEFINITE);
        timeline.play();

        // Initial update
        updateHoursLeft(label);
    }

    private void updateHoursLeft(Label label) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime endOfWeek = now.withHour(23).withMinute(59).withSecond(59).withNano(999999999).with(java.time.DayOfWeek.SUNDAY);
        long hoursLeft = ChronoUnit.HOURS.between(now, endOfWeek);
        label.setText("Hours left in the week: " + hoursLeft);
    }

    public static void main(String[] args) {
        launch(args);
    }
}
