Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784034657F5
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836078; cv=none; b=nFWHsO/SY/CP7BMNX/Rwwm9dzZysyk3dzNfuwsJj+75FxGO7j5/gqWfGsdaQ7Dw3eyhF06QkUgi9bPZrddm4JwX9jpc8NJRdchA/QdAjwQ7Rh2CgPiVHdFfyykWShvBHf3F16mXiBhDdHz8gtLhjMKOXkXNrr7hun8qmPDTgEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836078; c=relaxed/simple;
	bh=uzN8pi7oNjbGKF+kMXAxoJczI1FJObLLKJdiMv2eKGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AQEVixOiQO5UjudR3v3nU5V6iI0b+QjUtpg/MMRDWalJ98owytJnICT2bnAIL2UEad1YyD9vDktje6bEu55uccvoNQkDxLSeU7qaay6o+a985JnmKwTefvW/zETTk09P2cw+eW8CXe/iJ6BypbeUMswo8x1WP9T3Nl7BKIjD8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCCHHCAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCCHHCAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6931F000E9;
	Tue, 30 Jun 2026 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836075;
	bh=2dKSfASe4C1np8K8JMahxpn1mOFVoej1Jl4calFxOxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCCHHCADrZX26uX0NAwXek07MGHZrMI/a+I+FRZBZ3sBXV9C+3aseu4OrVj2Nq/zo
	 JRi9oHUb3I5KHykZ7j8PgbjZFUp7HCaBoOmB02KBqGoD+J0p7CWv1O60BXxCGY3DlH
	 Zed0QfxvechPsQFGntoa5c/42CNksvSIez9pK49tyVTRJKfamMmi+gKyoOSFI+hvqV
	 NEH69He8rXsrERg3MmzP2KutK/yXjQ1ri06X78NR6gfL58LCpCPmDRzfXpHFb69yqX
	 ypDtMsEverZ+ZiJl3Ai89/6mYcnsiNzwR/6fHOdSmgqn7wpTtuO+L7pDP5gr6CXrCk
	 rzpjgRlq+nmYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] clk: cs2600: Add KUnit test for CS2600 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630155549.824059-4-rf@opensource.cirrus.com>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 16:14:34 +0000
Message-Id: <20260630161435.0A6931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] 32-bit integer overflow in the calculation of `fdelta` tightens =
the acceptable error bounds, potentially causing false test failures.
- [Medium] `clk_prepare_enable_kunit()` is repeatedly invoked inside loops,=
 bypassing hardware enable paths after the first iteration and accumulating=
 redundant cleanup actions.
- [Medium] The test verifies the ratio slot using a stale copy of the PLL c=
onfiguration registers read prior to `clk_set_rate()`.
- [Low] Evaluating a device tree node pointer value after dropping its refe=
rence with `of_node_put()`.
- [Low] The Kconfig entry for `COMMON_CLK_CS2600_KUNIT_TEST` fails to `sele=
ct DTC`, leading to potential build failures.
- [Low] The mock I2C transfer function `cs2600_kunit_i2c_xfer` unconditiona=
lly accesses message buffers without validating message count or length.
--

commit da440c9cd81c522da5fe16912468ea26cbaf9db1
Author: Richard Fitzgerald <rf@opensource.cirrus.com>
Date:   Tue Jun 30 15:55:49 2026 +0000

    clk: cs2600: Add KUnit test for CS2600 driver
   =20
This patch adds a KUnit test for the CS2600 clock driver using a mock I2C h=
ost
driver and regmap to partially emulate the hardware. The test relies on har=
dcoded
tables to validate the frequency ratio and PLL configuration settings, and =
uses=20
devicetree overlays to validate different hardware properties.

> diff --git a/drivers/clk/cirrus/Kconfig b/drivers/clk/cirrus/Kconfig
> index 5674d6554f966..a6807cab4b945 100644
> --- a/drivers/clk/cirrus/Kconfig
> +++ b/drivers/clk/cirrus/Kconfig
> @@ -8,3 +8,16 @@ config COMMON_CLK_CS2600
>  	help
>  	  If you say yes here you get support for the CS2600 clock synthesizer
>  	  and multiplier.
> +
> +config COMMON_CLK_CS2600_KUNIT_TEST
> +	tristate "KUnit test for CS2600 clock driver" if !KUNIT_ALL_TESTS
> +	depends on COMMON_CLK_CS2600
> +	depends on KUNIT
> +	depends on REGULATOR
> +	depends on REGULATOR_FIXED_VOLTAGE
> +	default KUNIT_ALL_TESTS

[Severity: Low]
Does this Kconfig entry need to select DTC? The test's Makefile builds Devi=
ce
Tree overlays (.dtbo files), which could cause build failures if CONFIG_DTC
is disabled.

> +	help
> +		Build the KUnit tests for the Cirrus Logic CS2600
> +		clock driver.
> +
> +		If unsure say N.

[ ... ]

> diff --git a/drivers/clk/cirrus/clk-cs2600-kunit.c b/drivers/clk/cirrus/c=
lk-cs2600-kunit.c
> new file mode 100644
> index 0000000000000..9631801ac553b
> --- /dev/null
> +++ b/drivers/clk/cirrus/clk-cs2600-kunit.c

[ ... ]

> +static void cs2600_kunit_synth_ratio(struct kunit *test)
> +{
> +	const struct cs2600_kunit_params *params =3D test->param_value;
> +	const struct cs2600_kunit_ratio_config *ratios =3D params->s_ratios;
> +	struct cs2600_kunit_priv *priv =3D test->priv;
> +	unsigned int ratio_sel, pll_cfg2, ratio;
> +	int i;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, ratios);
> +
> +	for (i =3D 0; ratios[i].clk_out !=3D 0; i++) {
> +		/* 6 MHz is out-of-range for some input clocks */
> +		if (ratios[i].r =3D=3D 0) {
> +			KUNIT_ASSERT_EQ(test, ratios[i].clk_out, 6000000);
> +			continue;
> +		}
> +
> +		KUNIT_EXPECT_EQ_MSG(test, 0,
> +				    clk_set_rate(priv->clkout, ratios[i].clk_out),
> +				    "clk_out:%u s:%#x\n",
> +				    ratios[i].clk_out, ratios[i].r);
> +		KUNIT_EXPECT_EQ_MSG(test, 0,
> +				    clk_prepare_enable_kunit(test, priv->clkout),

[Severity: Medium]
Is it intentional to call clk_prepare_enable_kunit() in every loop iteration
without a matching disable? This will repeatedly increment the clock's refe=
rence
count and accumulate deferred cleanup actions, which might bypass the actual
hardware enable paths on subsequent loop iterations. This also appears to h=
appen
in cs2600_kunit_mult_ratio() and cs2600_kunit_smart_ratio().

> +				    "clk_out:%u s:%#x\n",
> +				    ratios[i].clk_out, ratios[i].r);
> +
> +		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &r=
atio_sel));

[ ... ]

> +static void cs2600_kunit_change_parent_same_clkout(struct kunit *test)
> +{
> +	const struct cs2600_kunit_params *params =3D test->param_value;
> +	struct cs2600_kunit_priv *priv =3D test->priv;
> +	struct clk *refclk =3D clk_hw_get_clk_kunit(test, priv->refclk_hw, NULL=
);
> +	struct clk *clkin =3D clk_hw_get_clk_kunit(test, priv->clkin_hw, NULL);
> +	unsigned int ratio_sel, pll_cfg1, pll_cfg2, pll_cfg3, ratio;
> +	int i;

[ ... ]

> +		/* clk_set_rate() should recalculate based on new parent frequency */
> +		KUNIT_EXPECT_EQ_MSG(test, 0,
> +				    clk_set_rate(priv->clkout, params->m_ratios[i].clk_out),
> +				    "clk_out:%u\n", params->m_ratios[i].clk_out);
> +
> +		ratio_sel =3D FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);

[Severity: Medium]
Does pll_cfg2 contain the updated register state here? The test appears to
validate the ratio slot using a stale copy of the PLL configuration registe=
rs
(pll_cfg2, and later pll_cfg1) read prior to the clk_set_rate() call, which
might fail to verify the newly updated hardware state.

> +		ratio =3D cs2600_kunit_get_ratio_val(test, ratio_sel);
> +		KUNIT_EXPECT_EQ_MSG(test, params->m_ratios[i].r, ratio,
> +				    "clk_out:%u\n", params->m_ratios[i].clk_out);
> +
> +		/*
> +		 * Change back to default parent and it should be synth mode again
> +		 */
> +		KUNIT_EXPECT_EQ(test, 0, clk_set_parent(priv->pllout, refclk));
> +
> +		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &p=
ll_cfg1));
> +		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &p=
ll_cfg2));
> +		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &p=
ll_cfg3));
> +
> +		KUNIT_EXPECT_EQ(test, 0, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
> +		KUNIT_EXPECT_EQ(test, FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1),
> +				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2));
> +
> +		/* Ratio should have changed if reference frequency has changed */
> +		if (clk_get_rate(refclk) !=3D clk_get_rate(clkin)) {
> +			ratio_sel =3D FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
> +			ratio =3D cs2600_kunit_get_ratio_val(test, ratio_sel);
> +			KUNIT_EXPECT_NE_MSG(test, params->m_ratios[i].r, ratio,
> +					    "clk_out:%u\n", params->s_ratios[i].clk_out);
> +		}
> +
> +		/* clk_set_rate() should recalculate based on new parent frequency */
> +		KUNIT_EXPECT_EQ_MSG(test, 0,
> +				    clk_set_rate(priv->clkout, params->s_ratios[i].clk_out),
> +				    "clk_out:%u\n", params->s_ratios[i].clk_out);
> +
> +		ratio_sel =3D FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);

[Severity: Medium]
Similar to the issue above, is pll_cfg1 stale here because it was read befo=
re
clk_set_rate() updated the hardware?

> +		ratio =3D cs2600_kunit_get_ratio_val(test, ratio_sel);
> +		KUNIT_EXPECT_EQ_MSG(test, params->s_ratios[i].r, ratio,
> +				    "clk_out:%u\n", params->m_ratios[i].clk_out);
> +	}
> +}

[ ... ]

> +static void cs2600_kunit_bclk_divider(struct kunit *test)
> +{
> +	struct cs2600_kunit_priv *priv =3D test->priv;
> +	unsigned int out_cfg1, bclk_div, fdelta;
> +	int i;
> +
> +	for (i =3D 0; cs2600_kunit_bclk_divs[i].pll_out !=3D 0; i++) {

[ ... ]

> +		/*
> +		 * Actual reported frequency can be slightly out because of
> +		 * PLL resolution, but should be within worst-case PPM.
> +		 */
> +		fdelta =3D (cs2600_kunit_bclk_divs[i].bf_out * CS2600_20_12_PPM) >> 20;

[Severity: Medium]
Can this multiplication overflow a 32-bit integer? The maximum bf_out value=
 is
24,576,000, and CS2600_20_12_PPM is 224, making their product 5,505,024,000,
which exceeds the 32-bit UINT_MAX. This could evaluate to an artificially t=
ight
tolerance range, potentially causing false test failures.

> +		KUNIT_EXPECT_GE_MSG(test, clk_get_rate(priv->bclk),
> +				    cs2600_kunit_bclk_divs[i].bf_out - fdelta,
> +				    "clk_out:%u bclk:%u\n",
> +				    cs2600_kunit_bclk_divs[i].pll_out,
> +				    cs2600_kunit_bclk_divs[i].bf_out);

[ ... ]

> +static int cs2600_kunit_i2c_xfer(struct i2c_adapter *adap, struct i2c_ms=
g *msgs, int num)
> +{
> +	struct cs2600_kunit_priv *priv =3D i2c_get_adapdata(adap);
> +	unsigned int addr, val;
> +	__be16 *bebuf;
> +	int ret;
> +
> +	/* First word of first message is always the register address */
> +	bebuf =3D (__force __be16 *)msgs[0].buf;
> +	addr =3D be16_to_cpu(bebuf[0]);

[Severity: Low]
Could this unconditionally dereference memory? The code appears to access
msgs[0].buf without first verifying that num >=3D 1 and msgs[0].len >=3D
sizeof(__be16).

> +
> +	/* A second word in the first message is a data write */
> +	if (msgs[0].len >=3D 2 * sizeof(__be16)) {
> +		val =3D be16_to_cpu(bebuf[1]);
> +		ret =3D cs2600_kunit_i2c_write(priv, addr, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		return 1;
> +	}

[ ... ]

> +static int cs2600_kunit_case_common_init(struct kunit *test)
> +{
> +	const struct cs2600_kunit_params *params =3D test->param_value;
> +	struct cs2600_kunit_priv *priv;
> +	struct device_node *np;

[ ... ]

> +	/* Wait for probes if the test case init already loaded the overlay */
> +	np =3D of_find_node_by_name(NULL, "cs2600-test-consumer");
> +	of_node_put(np);
> +	if (!IS_ERR_OR_NULL(np))

[Severity: Low]
Is it safe to evaluate np with IS_ERR_OR_NULL() after its reference has been
dropped by of_node_put()? Although IS_ERR_OR_NULL() only performs address
evaluation, relying on a conceptually dangling pointer value might lead to
unintended behavior.

> +		cs2600_kunit_wait_for_probes(test);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630155549.8240=
59-1-rf@opensource.cirrus.com?part=3D3
