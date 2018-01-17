import React from 'react';
import classnames from 'classnames';
import PropTypes, { defaultProps } from 'prop-types';

export default class Form extends React.Component {

    render() {
        const { vertical, className } = this.props;
        const klass = classnames(className, {
            "form-vertical": vertical,
            "form-horizontal": !vertical
        })

        return (
            <form className={ klass }>
                { this.props.children }
            </form>
        )
    }

}

export class FormInput extends React.Component {

    render() {
        const { label, labelClass, errorText, inputRef, ...other } = this.props;
        
        
        return (
            <ControlGroup label={ label } labelClass={ labelClass } errorText={ errorText } >
                <input ref={ inputRef } {...other} />
            </ControlGroup>
        )
    }

}

FormInput.defaultProps = {
    type: "text"
  };
  

export class FormSelect extends React.Component {
    
    render() {
        const { label, labelClass, errorText, options, ...other } = this.props;
        
        
        return (
            <ControlGroup label={ label } labelClass={ labelClass } errorText={ errorText } >
                <select {...other}>
                    <option value=""></option>
                    {
                        options.map((x) => {
                            return <option key={ x.id } value={ x.id }>{ x.name }</option>
                        })
                    }
                </select>
            </ControlGroup>
        )
    }

}

export class FormTextarea extends React.Component {
        
    render() {
        const { label, labelClass, errorText, inputRef, ...other } = this.props;
        
        
        return (
            <ControlGroup label={ label } labelClass={ labelClass } errorText={ errorText } >
                <textarea ref={ inputRef } {...other} />
            </ControlGroup>
        )
    }

}

export class ControlGroup extends React.Component {

    render() {
        const { label, errorText, labelClass } = this.props;
        const klass = classnames("control-group", { "error": errorText && errorText != "" });
        const labelKlass = classnames("control-label", labelClass);

        return (
            <div className={ klass }>
                <label className={ labelKlass }>{ label }</label>
                <div className="controls">
                    { this.props.children }
                    {
                        errorText &&
                        <span className="help-block">{ errorText }</span>
                    }
                    
                </div>
            </div>
        )
    }

}