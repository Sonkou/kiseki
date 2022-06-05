package kiseki.dto;

import lombok.Data;
import java.util.List;
import kiseki.entity.Orders;
import kiseki.entity.OrderDetail;

@Data
public class OrdersDto extends Orders {
    private String userName;

    private String phone;

    private String address;

    private String consignee;

    private List<OrderDetail> orderDetails;

}
