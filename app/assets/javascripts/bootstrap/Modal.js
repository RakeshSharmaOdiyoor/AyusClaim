import React from 'react';
import ReactDOM from 'react-dom';
import classnames from "classnames";

 class ModalX extends React.Component {

    componentDidMount() {
        this.modalTarget = document.createElement('div');
        this.modalTarget.className = 'modal modal-react';
        document.body.appendChild(this.modalTarget);

        this.modalBackdrop = document.createElement('div');
        this.modalBackdrop.className = 'modal-backdrop fade in';
        document.body.appendChild(this.modalBackdrop);

        this._render();
    }

    componentWillUnmount() {
        ReactDOM.unmountComponentAtNode(this.modalTarget);
        document.body.removeChild(this.modalTarget);

        ReactDOM.unmountComponentAtNode(this.modalBackdrop);
        document.body.removeChild(this.modalBackdrop);
    }

    _render() {
        const klass = classnames("modal-dialog", this.props.className);

        let element = (
        <div>
            <div className={ klass }>
                { this.props.children }                    
            </div>
        </div>
        );
        ReactDOM.render(element, this.modalTarget);
    }

    render() {
        return null;
    }

}

export default class Modal extends React.Component {
    constructor(props) {
        super(props);
        this.modalRoot = document.getElementById("modal-root");
        this.el = document.createElement('div');
    }
  
    componentDidMount() {
        this.modalRoot.appendChild(this.el);
    }
  
    componentWillUnmount() {
        this.modalRoot.removeChild(this.el);
    }
  
    render() {
        const klass = classnames("modal-dialog", this.props.className);
        
        return ReactDOM.createPortal(
            <div>
                <div className="modal-backdrop fade in"></div>
                <div className="modal modal-react">
                    <div className={ klass }>
                        { this.props.children}
                    </div>
                </div>
            </div>,
            this.el,
        );
    }
  }

export const ModalContent = ({children}) => (
    <div className="modal-content">
        { children }
    </div>
);

export const ModalBody = ({children, className}) => (
    <div className={ classnames("modal-body", className) }>
        { children }
    </div>
);

export const ModalFooter = ({children, className}) => (
    <div className={ classnames("modal-footer", className) }>
        <div className="pull-right">
        { children }
        </div>
    </div>
);

export const ModalTitle = ({children, className}) => (
    <h4 className={ classnames("modal-title", className) }>
        { children }
    </h4>
);

export const ModalHeader = ({children, className, title}) => (
    <div className={ classnames("modal-header", className) }>
        { title ? <ModalTitle>{ title }</ModalTitle> : null }
        { children }
    </div>
);