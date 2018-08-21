package com.atsoa.trainingroom.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;

@Entity
@Table(name = "user")
public class User extends AbstractPersistable<Long> implements Serializable, Cloneable {

    private static final long serialVersionUID = -1;

    @Override
    public void setId(Long id) {
        super.setId(id);
    }

    @Column(unique = true)
    @NotNull
    public String username;

    @NotNull
    public String password;

    public ArrayList<Book> books;

    public Boolean disabled;

}
