package itmo.project.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Data
public class EntriesBean {
    private List<Entry> entryList;
public EntriesBean(){
    entryList=new ArrayList<>();
}
    public void add(Entry element) {
        System.out.println("Add element in EntriesBean");
        entryList.add(element);
    }

}
