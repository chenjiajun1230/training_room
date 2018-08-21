package com.atsoa.trainingroom.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class Book extends AbstractPersistable<Long> implements Serializable, Cloneable {

    @Override
    protected void setId(Long id) {
        super.setId(id);
    }

    @Column(unique = true)
    @NotNull
    public String bookName;

    @NotNull
    public String authorName;

    @NotNull
    public String ISBN;

    @NotNull
    public Boolean isSaid;

    public String saidUsername;

}
