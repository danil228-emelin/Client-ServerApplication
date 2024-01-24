package itmo.project.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Entry implements Serializable {
    private double x;
    private double y;
    private double r;
    private String requestTime;
    private String responseTime;
    private boolean inRange;
    private String executionTime;
}
