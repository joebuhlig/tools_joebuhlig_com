<?php

/* @Installation/_systemCheckLegend.twig */
class __TwigTemplate_51ec205b9f581949fd80aa170d5194d075df1bdca230b25df07562d762bcfa95 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<div class=\"system-check-legend\">
    <h2>";
        // line 2
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("Installation_Legend")), "html", null, true);
        echo "</h2>

    <p>
        <span class=\"icon-ok\"></span>
        ";
        // line 6
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("General_Ok")), "html", null, true);
        echo "
    </p>
    <p>
        <span class=\"icon-warning\"></span>
        ";
        // line 10
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("General_Warning")), "html", null, true);
        echo ": ";
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("Installation_SystemCheckWarning")), "html", null, true);
        echo "
    </p>
    <p>
        <span class=\"icon-error\"></span>
        ";
        // line 14
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("General_Error")), "html", null, true);
        echo ": ";
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("Installation_SystemCheckError")), "html", null, true);
        echo "
    </p>
</div>

<p class=\"next-step\">
    <a href=\"";
        // line 19
        echo twig_escape_filter($this->env, (isset($context["url"]) ? $context["url"] : $this->getContext($context, "url")), "html", null, true);
        echo "\">";
        echo twig_escape_filter($this->env, call_user_func_array($this->env->getFilter('translate')->getCallable(), array("General_RefreshPage")), "html", null, true);
        echo " &raquo;</a>
</p>
";
    }

    public function getTemplateName()
    {
        return "@Installation/_systemCheckLegend.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  55 => 19,  45 => 14,  36 => 10,  29 => 6,  22 => 2,  19 => 1,);
    }
}
