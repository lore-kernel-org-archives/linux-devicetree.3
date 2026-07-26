Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0993BCD13
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785088289; cv=none; b=bAtQfhoRkT8eostFBGuolmnoIS/rvZEu2K3EiKrGyoxJbxIrUVSZ8UM70vCpssf1QTD3lrF1sc1IwiORw06Ck2TfucmMx/advPu6FDMyzGjcTa6rxEGsNqigG+wAStk+qoLWVcH1wJQd4WYaBUaJwg6s6OZOnkzrXFLAbL26Aek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785088289; c=relaxed/simple;
	bh=Gno4iRnuBWr3fcnJF/atwihSM3Jewrv9g3F+gPz6e3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m1ge5dXp1m45rHtUusqKR2l3gxxs6z4jYgCyQP7b68RaRZavTeL2EO9EQNY4tV607yRVDRgWs8iLe6Y3Hyw71z0Qjut8UjRZ+Fl5JTQcSEtcFMNNAtBxF/8J9RljaAX4rBnLZBFZgxA2M+5JoTcL7zuNbnajf84FAceBD9EB8z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/3UWfer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/3UWfer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B171F000E9;
	Sun, 26 Jul 2026 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785088287;
	bh=WGYtEdtRlNjdNX0SY6FTh9I2o0YNKZZpBs4nkJHP86g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/3UWferLXZPXja2aRHiG8jY1gDmaap080PpU9WLJE5odVf34xN5zOHF4w7z33/1r
	 mWHVwGc2ZnlYx7jRMyLBTXm33P5R2UevMghaqWq2clw0fFNHwSn0McJa71JiFs6uki
	 lvLxYGPm0btyhtaFkmLl6p519ngsm1dIdA0/oUcK5TXVj5k6BDMfTXzUAEuPff0mvt
	 GOXXXEhnAAJl5hwfSzuBRHlakFOO4W3/2PkjyPsJ67cqnPGeYyibk9bRorY+Ac+nWp
	 bIBtr+n2VSsXAQZurVdBgo4njYCDcLZ231PzdZlcEz0y3cWBWa/2kiHVgCPWcE5QOc
	 EQYeTfGwZHomg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: Add gpio-locked fixed clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260726-feature-clock-guard-v4-2-e9c8b372b71c@bruker.com>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-2-e9c8b372b71c@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 17:51:26 +0000
Message-Id: <20260726175127.67B171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] The `.is_enabled` callback completely inverts the clock status=
 logic, returning error codes instead of boolean state.
- [High] The driver attempts to aggregate multiple dependent input clocks b=
y registering them as CCF parents, causing a TOCTOU race and failing to ena=
ble parents.
- [High] Using local DT connection IDs to populate `init.parent_names` caus=
es global clock matching to fail and risks NULL pointer dereferences.
- [High] The `enable` callback returns `-EBUSY` immediately rather than wai=
ting for the hardware lock, contradicting CCF semantics.
- [High] The driver requests the lock GPIOs with `GPIOD_ASIS` rather than `=
GPIOD_IN`, potentially failing to read the pin state correctly.
- [High] The driver fails to validate that provided GPIOs are non-sleeping,=
 risking a kernel panic if slow GPIO controllers are used.
- [Medium] Calling `dev_warn` from a spinlocked, atomic context causes seve=
re latencies.
--

--- Patch [2]: [PATCH v4 2/2] clk: Add gpio-locked fixed clock driver ---
commit 86eabe35b2750726ea6024147b3e2f51a67773ca
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

clk: Add gpio-locked fixed clock driver

This commit introduces a new clock driver that aggregates input clocks and
GPIOs to expose a clock-valid/PLL-lock status for FPGA-assisted clocking
designs.

> diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
> new file mode 100644
> index 0000000000000..79098f9b65326
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-locked.c
> @@ -0,0 +1,306 @@
[ ... ]
> +static int is_gpio_ready(struct gpio_locked_clk_priv *priv)
> +{
> +	unsigned long values[BITS_TO_LONGS(MAX_INPUT_GPIO_COUNT)] =3D {0};
> +	int ret =3D 0;
[ ... ]
> +	for (int i =3D 0; i < priv->gpios->ndescs; i++) {
> +		if (!test_bit(i, values)) {
> +			dev_warn(priv->dev, "GPIO %s is not ready", priv->gpio_names[i]);

[Severity: Medium]
Is it safe to call dev_warn() while holding the clock framework's enable_lo=
ck?

Because is_gpio_ready() is called from the .enable and .is_enabled callback=
s,
it executes under a spinlock with hard interrupts disabled. Unconditionally
logging to the console from this context can cause severe IRQ latencies or
hard lockups, especially if a consumer polls the clock state.

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
> +
> +		if (!clk_hw_is_enabled(hw_clk)) {
> +			dev_dbg(priv->dev, "Clock %i (%s) is not ready",
> +				i, priv->clks[i].id);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;

[Severity: Critical]
Does this function invert the expected return logic for .is_enabled?

The clock framework expects .is_enabled to return a non-zero value when the
clock is enabled, and 0 when it is disabled. By returning -EBUSY when not
ready and 0 when ready, the framework will consider the clock enabled when
it is actually not ready, and disabled when it is ready.

> +}
> +
> +/* We can't enable the clock, but the Common Clock Framework calls only
> + * enable() not is_enabled()
> + */
> +static int gpio_locked_clk_enable(struct clk_hw *hw)
> +{
> +	return gpio_locked_clk_is_enabled(hw);

[Severity: High]
Should the enable callback block until the hardware lock is acquired?

Standard clock consumers do not poll clk_prepare_enable(). By doing a single
non-blocking check and failing immediately with -EBUSY, consumer driver pro=
bes
will fail if the hardware lock is not instantaneously ready at the moment of
enablement.

> +}
> +
> +/* We have to implement it, but we are not going to control
> + * parent clock selection
> + */
> +static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
> +{
> +	return 0;

[Severity: High]
Does hardcoding the parent to index 0 break the aggregation of multiple inp=
uts?

When a clock is registered with num_parents > 1 and implements get_parent,
the clock framework treats it as a multiplexer where only one parent is act=
ive.

By always returning 0, the framework is told to abandon tracking for all ot=
her
parents. This means parents 1 through N will not be enabled when this clock
is enabled.

> +}
> +
> +static const struct clk_ops gpio_locked_clk_ops =3D {
> +	.enable =3D	gpio_locked_clk_enable,
> +	.is_enabled =3D	gpio_locked_clk_is_enabled,
> +	.get_parent =3D	gpio_locked_clk_get_parent,
> +};
[ ... ]
> +static int gpio_locked_clk_parse_gpios(struct gpio_locked_clk_priv *priv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int i;
> +
> +	priv->gpios =3D devm_gpiod_get_array_optional(dev, "locked", GPIOD_ASIS=
);

[Severity: High]
Could requesting the GPIO array with GPIOD_ASIS leave the pins in an undefi=
ned
state?

Without enforcing the input direction using GPIOD_IN, the hardware
configuration relies on the bootloader. If the bootloader leaves the pins
floating or configured as outputs, reading the pin state may fail to detect
the lock correctly.

[Severity: High]
Does the driver need to verify that these GPIOs are non-sleeping?

The clock framework's .enable and .is_enabled callbacks run in an atomic
context with interrupts disabled. If the device tree provides a sleeping GP=
IO
(such as an I2C or SPI expander), calling gpiod_get_array_value() from
is_gpio_ready() will trigger a scheduling-while-atomic BUG.

Could the probe function check !gpiod_cansleep() to reject sleeping GPIOs?

> +	if (IS_ERR(priv->gpios)) {
> +		dev_err(dev, "failed to get GPIO array: %ld\n",
> +				PTR_ERR(priv->gpios));
[ ... ]
> +static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *pr=
iv)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct clk_init_data init =3D {};
> +	int ret;
[ ... ]
> +	init.flags =3D 0;
> +	init.num_parents =3D priv->num_clks;
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
Does this assignment pass local device tree connection IDs to the clock
framework instead of globally registered provider names?

During probe, devm_clk_bulk_get_all() populates the id field with local
consumer names from the device tree. The clock framework expects
init.parent_names to contain global provider names. This mismatch will
cause the output clock to fail to match its parents.

Additionally, if the optional clock-names property is missing in the DT,
priv->clks[j].id will be NULL, causing a NULL pointer dereference when the
framework evaluates init.parent_names.

> +
> +		init.parent_names =3D parent_names;
> +	}
> +
> +	priv->output_hw_clk.init =3D &init;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-feature-cl=
ock-guard-v4-0-e9c8b372b71c@bruker.com?part=3D2
