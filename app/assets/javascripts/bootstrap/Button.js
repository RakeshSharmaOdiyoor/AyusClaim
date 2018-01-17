import React, { Component } from "react";
import classnames from 'classnames';
import Icon from "./Icon";

export default class Button extends Component {

    render() {
        const { primary, warning, success, danger, icon, className, raised, ...other } = this.props;
        const klass = classnames("md-button", className, {
            "md-primary": primary,
            "md-warning": warning,
            "md-danger": danger,
            "md-success": success,
            "md-default": !primary && !warning && !danger && !success,
            "md-raised": raised
        });

        return (
            <button className={ klass } onClick={this.props.onClick} {...other}>
                { icon ? <Icon icon={icon} /> : null }
                { this.props.children }
            </button>
        );
    }

}

export class IconButton extends React.Component {

    render() {
        const { className, ...other } = this.props;
        const klass = classnames("md-icon-button", className);
        return (
            <Button {...other} className={ klass } ></Button>
        )
    }

}