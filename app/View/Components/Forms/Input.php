<?php

namespace App\View\Components\Forms;

use Illuminate\View\Component;

class Input extends Component
{
    public $type;

    public $name;

    public $id;

    public $class;

    public $value;

    public $placeholder;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($type, $name, $id = null, $class = null, $value = null, $placeholder = null)
    {
        $this->type = $type;
        $this->name = $name;
        $this->id = $id;
        $this->class = $class;
        $this->value = $value;
        $this->placeholder = $placeholder;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.forms.input');
    }
}
