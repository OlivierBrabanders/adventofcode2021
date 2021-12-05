package day5;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

record PointInSpace(int x, int y) {

    static List<Integer> range(int start, int end) {
        Stream<Integer> xs;
        if (end > start) {
            xs = IntStream.rangeClosed(start, end).boxed();
        } else {
            xs = IntStream.rangeClosed(end, start)
                .boxed()
                .sorted(Collections.reverseOrder());
        }
        return xs.collect(Collectors.toList());
    }

    public List<PointInSpace> cover(PointInSpace end) {
        List<PointInSpace> result = new ArrayList<PointInSpace>();
        if (this.x == end.x) {
            int min = Math.min(this.y, end.y);
            int max = Math.max(this.y, end.y);
            for (int i = min; i <= max; i++) {
                result.add(new PointInSpace(this.x, i));
            }
        } else if (this.y == end.y) {
            int min = Math.min(this.x, end.x);
            int max = Math.max(this.x, end.x);
            for (int i = min; i <= max; i++) {
                result.add(new PointInSpace(i, this.y));
            }
        } else {
            var xs = range(this.x, end.x);
            var ys = range(this.y, end.y);
            for (int i = 0; i < xs.size(); i++) {
                result.add(new PointInSpace(xs.get(i), ys.get(i)));
            }
        }
        return result;
    }
}

public class Part2 {
    static List<PointInSpace>getPoints(String segment) {
        var ends = Arrays.stream(segment.split(" -> "))
            .map(s -> s.split(","))
            .map(coords -> new PointInSpace(Integer.parseInt(coords[0]), Integer.parseInt(coords[1])))
            .collect(Collectors.toList());
        return ends.get(0).cover(ends.get(1));
    }

    public static void main(String[] args) throws IOException {
        var counter = new HashMap<PointInSpace, Integer>();
        Files.readAllLines(Path.of("day5/input.txt")).stream()
            .map(Part1::getPoints)
            .flatMap(List::stream)
            .forEach(point -> counter.merge(point, 1, Integer::sum));
        var overlappingPoints = counter.values().stream().filter(count -> count > 1).count();
        System.out.println(overlappingPoints);
    }
}