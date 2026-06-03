Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85773314B9
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486757; cv=none; b=ZwDVckhmRhrXzXMoJLtybOBkwiW41jz05rZl1KqTSxNFH7IupkM6gu4leNH+m8l4JzyoRQD114xQEsrIOVHsXR2cvS5zblbBJ0wI+c4mW5rf5kLoieYxtU+ls2JdCNzgM0fNUqEk6eyAotR2l9+p5pVmoegnn7J6J++0VGc37TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486757; c=relaxed/simple;
	bh=FJbi9gQlnt27PJW3HHo0cD7xZmV6E6AmWTmZ4+KfFM0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LUkF5o7G+m0jqbvYXh91fZKmGyjoRDobSZLs2DtaNxIcBYJsvTF161Itgus6eOIKYp6NGGwDObKZUlkiBN5N18A2lQACX2POkgQ37ASK6/rrWBf1tbucFHhryyK3jY7Tr8K8v7BHWB68HYBFyq3Igyy1qriMdtnGTOPxOzEAIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge25EDCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge25EDCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9A81F00893;
	Wed,  3 Jun 2026 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486756;
	bh=vngqzfC9X2WBlJ2Y+D5bPzI8kbUon3o08Q/SKFSh0Ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ge25EDCrHV0PwGO4r/g5Eb4VZKQ/4zYcP6/Uy6t/IOqcpU6IUyy5jMepbpV1ePc+O
	 hkj1T4MQpdkCWipjLi6o3rkgjQdo18JQxD+8PtADEo6qGOQmzpD0Mcx1w5z8UFsJRL
	 aUXKHoCVnlJVs+eCzh1Tzqtrytc2QWYcDIxcjkekFt/p/iv2/PUXTb/EOYwEVKa/9v
	 zxY/h7p7U6YSu+7Cbu8HkvwP/nAQM++Z7HZ9AaJSQDez9NEHKfWDQoUr8PPJH0Fowu
	 rrHEpiGpUz+CcYixYtxEPBf7cpmzlf8T4KeUE9Ng5k1MQVt/q9Oyx+ojYv0IE0ZGRT
	 75MXcVrA30YNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov via B4 Relay" <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
References: <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:39:15 +0000
Message-Id: <20260603113915.CA9A81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver fails to probe with `-EINVAL` because it incorrectly us=
es `devm_clk_bulk_get_all` IDs as CCF `parent_names`.
- [High] The driver registers multiple required input clocks as CCF parents=
, causing `clk_enable()` to permanently fail.
- [High] The binding lacks a `clock-frequency` property, resulting in a 0 H=
z clock when no parents are specified.
- [High] The .is_enabled callback incorrectly returns 0 when the clock is r=
eady and a negative error code when it is not.
- [Medium] The driver reads the 'gpio-names' property which is missing from=
 the dt-binding schema.
- [Low] The `clocks` property is missing an array size constraint (`maxItem=
s` or `items`).
- [Low] The example uses a device-specific node name instead of a generic n=
ode name.
--

commit f442ab0fb77267ab8b660fa86301ab0aa027e186
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: dt-bindings: Add GPIO-locked fixed clock

This commit introduces a new device tree binding and corresponding driver
support for a GPIO-locked fixed clock provider. The clock's availability
depends on prerequisite conditions, including parent clocks and GPIO lock
indicators. This allows modeling FPGA-generated clocks that expose lock
status through GPIOs.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.=
yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> @@ -0,0 +1,70 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: gpio-locked-fixed-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    description: Input clocks whose validity is monitored by this provid=
er.

[Severity: Low]
Does the clocks property need an array size constraint such as maxItems
or items? Without it, dt_binding_check might emit a meta-schema validation
error.

[ ... ]
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    clk_gpio_locked: gpio-locked-fixed-clock {

[Severity: Low]
Is gpio-locked-fixed-clock the appropriate node name here? Standard device
tree rules typically require generic node names (e.g., clock-controller { or
clock {) rather than device-specific names.

> +        compatible =3D "gpio-locked-fixed-clock";
[ ... ]
> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-locked.c
> @@ -0,0 +1,306 @@
[ ... ]
> +static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct gpio_locked_clk_priv *priv =3D to_gpio_locked_clk_priv(hw);
> +	int ret =3D 0;
> +
> +	if (priv->num_gpios > 0) {
> +		ret =3D is_gpio_ready(priv);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	// Now check for the clocks
> +	for (int i =3D 0; i < priv->num_clks; i++) {
> +		struct clk_hw *hw_clk =3D __clk_get_hw(priv->clks[i].clk);
> +
> +		if (!clk_hw_is_enabled(hw_clk)) {
> +			dev_dbg(priv->dev, "Clock %i (%s) is not ready",
> +				i, priv->clks[i].id);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does .is_enabled correctly return the clock status here?

The Common Clock Framework expects this callback to return a non-zero value
(true) when the clock is ready, and 0 (false) when it is disabled. Returning
0 on success and negative error codes (like -EBUSY) on failure might cause
CCF to implicitly cast the negative error codes to true, falsely assuming
the clock is enabled when it is actually unavailable.

[ ... ]
> +static const struct clk_ops gpio_locked_clk_ops =3D {
> +	.enable =3D	gpio_locked_clk_enable,
> +	.is_enabled =3D	gpio_locked_clk_is_enabled,
> +	.get_parent =3D	gpio_locked_clk_get_parent,
> +};

[Severity: High]
The commit message mentions this provider exposes a fixed-rate clock, but
the clock-frequency property is missing from the binding, and .recalc_rate
is not implemented here.=20

If the clocks property is omitted in the device tree (which the schema
allows), won't the root clock default to 0 Hz? How will downstream consumers
know the correct clock rate without a way to define it?

[ ... ]
> +static int gpio_locked_clk_parse_gpios(struct gpio_locked_clk_priv *priv)
> +{
[ ... ]
> +	for (i =3D 0; i < priv->num_gpios; i++) {
> +		of_property_read_string_index(np, "gpio-names", i,
> +				&priv->gpio_names[i]);

[Severity: Medium]
Will this logic cause dt_binding_check to fail if a device tree includes
gpio-names?

The driver attempts to read the gpio-names property, but it is missing
from the dt-binding schema, which strictly enforces additionalProperties:
false. If it is omitted from the device tree to pass validation, won't
priv->gpio_names[i] remain NULL and cause debug warnings?

[ ... ]
> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *pr=
iv)
> +{
[ ... ]
> +	init.name =3D priv->output_clock_name;
> +	init.ops =3D &gpio_locked_clk_ops;
> +	init.flags =3D 0;
> +	init.num_parents =3D priv->num_clks;

[Severity: High]
Can clk_enable() permanently fail if there are multiple input clocks?

By setting init.num_parents =3D priv->num_clks, this configures the clock as
a CCF multiplexer. However, CCF's clk_core_enable() only enables the
single active parent returned by .get_parent() (which the driver hardcodes
to return 0). Since the .is_enabled() callback mandates that all input
clocks must be enabled, won't the check fail and return -EBUSY for the other
unenabled parents?

> +
> +	if (priv->num_clks) {
> +		const char **parent_names;
> +		int j;
> +
> +		parent_names =3D devm_kcalloc(dev, priv->num_clks,
> +					    sizeof(*parent_names),
> +					    GFP_KERNEL);
> +		if (!parent_names)
> +			return -ENOMEM;
> +
> +		for (j =3D 0; j < priv->num_clks; j++)
> +			parent_names[j] =3D priv->clks[j].id;

[Severity: High]
Is it safe to assign priv->clks[j].id to parent_names[j] here?

Since devm_clk_bulk_get_all() populates clks[i].id from the clock-names
property, and clock-names is explicitly omitted from the DT binding schema
(and forbidden by additionalProperties: false), won't clks[i].id evaluate
to NULL?

This could cause clk_core_populate_parent_map() to emit a WARN and return
-EINVAL during registration. Would using .parent_hws instead of
.parent_names be a more reliable approach?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-feature-cl=
ock-guard-v3-0-01cca0aa04a5@bruker.com?part=3D1
