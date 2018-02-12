package controller.test;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"classpath*:/spring-context.xml", "classpath*:/spring-context-mvc.xml", "classpath*:/mybatis-config.xml"})
@TransactionConfiguration(defaultRollback = false)
@Transactional
public class StoreControllerTest {
    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;
    @Before
    public void setup() {
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @Test
    public void testSave() throws Exception {
        //创建书架创建的请d
        MockHttpServletRequestBuilder mockHttpServletRequestBuilder = MockMvcRequestBuilders.post("/store/save.do");
        mockHttpServletRequestBuilder.param("number", "MockMvc");
        mockHttpServletRequestBuilder.param("level", "2");
        mockMvc.perform(mockHttpServletRequestBuilder).andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testList() throws Exception {
        MockHttpServletRequestBuilder mockHttpServletRequestBuilder = MockMvcRequestBuilders.post("/store/list.do");
        mockHttpServletRequestBuilder.param("page", "1");
        mockHttpServletRequestBuilder.param("rows", "10");
        mockMvc.perform(mockHttpServletRequestBuilder).andExpect(status().isOk())
                .andDo(print());
    }
}  