package com.atsoa.trainingroom.repository;

import com.atsoa.trainingroom.model.Book;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BookRepository extends PagingAndSortingRepository<Book,Long>, JpaSpecificationExecutor<Book> {

}
