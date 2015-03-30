package com.caviar.core.model;

import javax.validation.constraints.NotNull;

/**
 *
 *
 * @author Dimitris Zakas
 */
public class CaviarDataModel {

    @NotNull
    private String id;

    private String source;

    private String content;
}
