import React from 'react';
import classnames from 'classnames';

export default class Alert extends React.Component {

    render() {
        const { text, danger, className } = this.props;
        const klass = classnames("alert", { "alert-danger": danger }, className);

        return (
            <p className={ klass }>
                { text }
            </p>
        )
    }

}