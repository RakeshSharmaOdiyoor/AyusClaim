import React, { Component } from "react";

const Icon = ({icon}) => {
    const klass = "icon-" + icon;
    return (
        <span className={klass}></span>
    );
}

export default Icon;