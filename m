Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE034DCC7
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536607; cv=none; b=tlWj23v8UZw40r8xbqEs4eFZihekuEHk9z8RSMcowU/RJleg+wlkkqzGe9HiXh1iKKTSkzcq69xsMO6CiUa25rDa7J2Ljg1YiHa4Dywl6d/C52hHhTIRzeRvvoudawcqg/b07aI8RyA6KrPC5nioecLejtXVGGJMPJYR6/6u5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536607; c=relaxed/simple;
	bh=35lhpMozp2FemUJxeuU2dzum5DVzDvTC00sMqQZFwo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ECgxxWjozjS/ni2/8nf0rPBrmIWxs16m//brr0ytGdkIHveLibxBb/HW05XLl66PXFjQWD3ZkdvzTSdIPAOk7ybUSPnmGr1JrfGR++9w3eKRhAdY/S4tpjh+7jMZVIMfAFxz5MFZslkaLYh64Ww0r1NWrIWgBKXqMEnH5CZgGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2ZRgAt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2ZRgAt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA74C2BCB0;
	Mon, 11 May 2026 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778536607;
	bh=35lhpMozp2FemUJxeuU2dzum5DVzDvTC00sMqQZFwo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n2ZRgAt9W9dMbDsRJxgq3zm9gf47jU36wqbqfitAzTt2qV0l4YcS+cNhPIszWK8ZC
	 WOT/9ypczZ2l2AsDZ4hFZywf1ljFpYR89qT2sVBhEAajx9EIdgLiL0adeQFIM6v4i9
	 obT++I1pFHU952mq49CwZeAjq2BGKRcb4NtUbUYvEVQV4rvKqki2a1lSYTP+lwWnxn
	 6wIQtOqD+NSjUxd3NXsmRudCt5UouDmRL6hZQUL9t2Q4PKM0ZHAjNm/dTdIV75MAAO
	 TY41cpZuCxiUnZ5k8cDkzZbT89qqrlavxxvaQoGn1T1QJj+ZNDYvmA/QPBfCeDWvMe
	 CGx/LusEeTGKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] clk: Add gpio-locked clock driver
Reply-To: sashiko@lists.linux.dev
To: "Vyacheslav Yurkov via B4 Relay" <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-feature-clock-guard-v2-1-6c25458d5340@bruker.com>
References: <20260510-feature-clock-guard-v2-1-6c25458d5340@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:56:46 +0000
Message-Id: <20260511215647.4EA74C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Bypassing the consumer clock API to use `__clk_get_hw()` on pa=
rent clocks leads to a Use-After-Free condition.
- [High] The `.is_enabled` callback returns inverted boolean states, breaki=
ng CCF state tracking.
- [High] The driver calls `gpiod_get_array_value()` within atomic CCF callb=
acks, triggering a sleep-in-atomic panic for sleepable GPIOs.
- [High] The driver registers multiple input clocks as parents of a multipl=
exer, which permanently disables all but the first input clock.
- [High] The driver incorrectly assigns local consumer connection IDs to `i=
nit.parent_names`, causing CCF parent resolution to fail.
- [Medium] The driver fails to explicitly configure the GPIO pins as inputs=
, potentially reading output latches.
- [Medium] The `is_gpio_ready` function prints warnings inside an atomic co=
ntext and can pass a NULL pointer to a `%s` format specifier.
--

commit 3bd5345760ec5123d8088eb2dc06d995c3669406
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: Add gpio-locked clock driver

A gpio-locked clock aggregates one or more input clocks and/or one or
more GPIOs. Consumers can use the output clock to wait until all input
clocks are locked and only then initialize dependent peripherals.

> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
> index 0000000000000..79098f9b65326
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-locked.c
[ ... ]
> +static int is_gpio_ready(struct gpio_locked_clk_priv *priv)
> +{
> +	unsigned long values[BITS_TO_LONGS(MAX_INPUT_GPIO_COUNT)] =3D {0};
> +	int ret =3D 0;
> +
> +	if (priv->num_gpios =3D=3D 0)
> +		return 0;
> +
> +	ret =3D gpiod_get_array_value(priv->gpios->ndescs,
> +		priv->gpios->desc,
> +		priv->gpios->info,
> +		values);

Will this trigger a sleep-in-atomic panic for sleepable GPIOs?

is_gpio_ready() is called from the .enable and .is_enabled callbacks,
which execute in an atomic context holding the enable_lock spinlock.

If a consumer attaches a GPIO from a sleepable bus controller (e.g., an I2C=
 or
SPI expander), the underlying GPIO driver will attempt to sleep while the
spinlock is held.

> +
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to read GPIOs");
> +		return -EIO;
> +	}
> +
> +	for (int i =3D 0; i < priv->gpios->ndescs; i++) {
> +		if (!test_bit(i, values)) {
> +			dev_warn(priv->dev, "GPIO %s is not ready", priv->gpio_names[i]);

Can this spam the kernel log from an atomic context?

This warning executes under a spinlock during CCF sysfs reads or consumer
polling.

Also, if the gpio-names DT property is missing, priv->gpio_names[i] will
be NULL, which is then passed to the %s format specifier.

> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
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

Does bypassing the consumer clock API lead to a Use-After-Free condition?

The driver acquires consumer clock handles (struct clk *) via
devm_clk_bulk_get_all(). However, this extracts the provider's
struct clk_hw * pointer using the internal API __clk_get_hw().

If the parent clock's provider is unbound (e.g., via sysfs), its clk_hw
memory is freed, but the consumer's struct clk * handle remains valid.
Subsequent state checks will dereference the freed hw pointer.

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

Does this return inverted boolean states?

The Common Clock Framework (CCF) expects the .is_enabled callback to return
a boolean-like integer (non-zero for enabled, 0 for disabled).

This function returns 0 when all inputs are locked and ready, and -EBUSY
(which evaluates to a non-zero, true value) when the inputs are not ready.
This will cause CCF to track the clock as actively enabled when its
dependencies are unavailable, and disabled when it is fully ready.

[ ... ]
> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
> +{
> +	return 0;
> +}
[ ... ]
> +static int gpio_locked_clk_parse_gpios(struct gpio_locked_clk_priv *priv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int i;
> +
> +	priv->gpios =3D devm_gpiod_get_array_optional(dev, "locked", GPIOD_ASIS=
);

Could this read output latches instead of the physical external signal?

The GPIOD_ASIS flag leaves the pins in their current or default state.
If the bootloader or prior configuration left a pin as an output,
gpiod_get_array_value() will read the output latch value.

Explicitly requesting GPIOD_IN configures the pins safely as inputs.

[ ... ]
> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *pr=
iv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct clk_init_data init =3D {};
> +	int ret;
> +
> +	of_property_read_string_index(np, "clock-output-names", 0,
> +		&priv->output_clock_name);
> +
> +	if (!priv->output_clock_name)
> +		priv->output_clock_name =3D dev_name(priv->dev);
> +
> +	init.name =3D priv->output_clock_name;
> +	init.ops =3D &gpio_locked_clk_ops;
> +	init.flags =3D 0;
> +	init.num_parents =3D priv->num_clks;

Does this register multiple input clocks as parents of a multiplexer?

By setting init.num_parents =3D priv->num_clks and defining a .get_parent
callback that strictly returns 0, the driver configures itself as a clock
multiplexer.

In the CCF topology, a multiplexer only activates its currently selected
parent (index 0). Any additional input clocks (parents 1 to N) will never
be prepared or enabled by the framework.

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
> +
> +		init.parent_names =3D parent_names;

Will this cause CCF parent resolution to fail?

The driver assigns priv->clks[j].id to init.parent_names[j]. This id
string populated by devm_clk_bulk_get_all() is the local consumer name from
the device tree's clock-names property.

However, init.parent_names requires the globally registered provider names
of the parent clocks. Supplying the local consumer IDs will cause string
matching to fail, leaving the clock orphaned.

> +	}
> +
> +	priv->output_hw_clk.init =3D &init;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-feature-cl=
ock-guard-v2-0-6c25458d5340@bruker.com?part=3D1
