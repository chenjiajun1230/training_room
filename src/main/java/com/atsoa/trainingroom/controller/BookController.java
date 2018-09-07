package com.atsoa.trainingroom.controller;

import com.atsoa.trainingroom.model.Book;
import com.atsoa.trainingroom.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

import static com.atsoa.trainingroom.util.CollectionUtil.*;

@Controller
@RequestMapping(value = "/book")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @RequestMapping(value = "/list")
    public String index() {
        return "/book";
    }

    @RequestMapping(value = "/list/data", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public @ResponseBody Map<String, Object> listData(@RequestParam int page, @RequestParam int rows,
                                 @RequestParam String sord, @RequestParam String sidx,
                                 @RequestParam Optional<String> bookname) {
        PageRequest pageRequest = new PageRequest(page-1, rows,
                sord.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC,
                !StringUtils.isEmpty(sidx) ? sidx : "id");

        Specifications<Book> spec = Specifications
                .where((root, query, cb) ->
                        StringUtils.isEmpty(bookname) ? cb.like(root.get("bookname"), "%"+bookname+"%") : null);

        Page<Book> pageData = bookRepository.findAll(spec, pageRequest);
        return map(
                entry("total", pageData.getTotalPages()),
                entry("page", pageData.getNumber()+1),
                entry("records", pageData.getTotalElements()),
                entry("rows", pageData.getContent())
        );
    }

    @RequestMapping(value = "/loanBook/{bookId}", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> loanBook(@PathVariable Long bookId) {
        Book entity = bookRepository.findOne(bookId);
        if (entity.isSaid.equals(true)) {
            return map(
                    entry("ret", 1)
            );
        }
        entity.isSaid = true;
        bookRepository.save(entity);
        return map(
                entry("ret", 0)
        );
    }

    @RequestMapping(value = "/returnBook/{bookId}", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> returnBook(@PathVariable Long bookId) {
        Book entity = bookRepository.findOne(bookId);
        if (entity.isSaid.equals(false)) {
            return map(
                    entry("ret", 1)
            );
        }
        entity.isSaid = false;
        bookRepository.save(entity);
        return map(
                entry("ret", 0)
        );
    }

}
