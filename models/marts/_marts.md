{% docs order_status %}

Der Status einer Bestellung im thelook-System:

- **Processing:** Bestellung angelegt, noch nicht versandt
- **Shipped:** Versand ausgelöst, unterwegs
- **Complete:** geliefert und abgeschlossen
- **Cancelled:** durch Kund:in oder System storniert
- **Returned:** zurück an den Shop

{% enddocs %}

{% docs revenue_definition %}

**Revenue** wird als Summe aller `sale_price`-Werte der zugehörigen
`order_items` berechnet. Storno, Rücksendungen und Rabatte sind in der
Rohquelle nicht verfügbar und somit **nicht herausgerechnet**.

{% enddocs %}
