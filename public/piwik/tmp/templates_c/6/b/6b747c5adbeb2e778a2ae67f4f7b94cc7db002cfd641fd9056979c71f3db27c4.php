<?php

/* @CoreHome/_siteSelectHeader.twig */
class __TwigTemplate_6b747c5adbeb2e778a2ae67f4f7b94cc7db002cfd641fd9056979c71f3db27c4 extends Twig_Template
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
        echo "<div class=\"top_bar_sites_selector piwikTopControl\">
    <div piwik-siteselector class=\"sites_autocomplete\"></div>
</div>";
    }

    public function getTemplateName()
    {
        return "@CoreHome/_siteSelectHeader.twig";
    }

    public function getDebugInfo()
    {
        return array (  19 => 1,);
    }
}
