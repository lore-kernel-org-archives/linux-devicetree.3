Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96E03932C6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798562; cv=none; b=j/+6u1wzZlK0N1INK8CM4TChANu8FON9NAefPJiiKMESZAEvCsk1kWBDTZY2Il86cNtIMCmFy6DmC3ZDtQOz+6daieueIuDJX2UQ3Cw8QkdBQ1xBA4klaNlXnIs6QR88o7CzhE8wjR5J6913AkcKgySQ0oBD85GVxHJaJFDn5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798562; c=relaxed/simple;
	bh=TLb9CBPPJcXvS0ddu36Mz2kPX1XsbIH7ebAE9m/0pr8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=unsDfxlURofMXsQbTBiDu586XLfA03mcLbgAneRmQLsfkAN2QaunBNAU33PQNZgROp3BCSRUFYfZBVLGAbp+19JXQxUvkngG6GNm+uRIhzhfDjrjcTkvgvhHtENBYGCJSFI3lReJ/8pZzcAZK7dKJyEnUK49kFLCpnhTGGXPJ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAeZifgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAeZifgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE621F000E9;
	Thu, 23 Jul 2026 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798560;
	bh=B1gByql6LIdDIQxwvuQ1GGZx4qU8J/Zwz7Y3ANryl4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lAeZifgpt2mxs2+kj99JjHKcOiELCfoNRT8tgY316M8gyta6CrcchXuIZXpULxP2h
	 EiGvI0IkWJixpS/OXosC1JOfzIgwJFvRyzC+VL0F2shiTQqITuHkncdnGUIzlhvkuk
	 UjE3UQc332XVBvhV90P58E7MKzYn+VmHpbhtEV1mH+qougzyi3uK3MmmB7mhMWHXvD
	 q5iarSPiutVQL35RJTkl22pUOuc7ER183+GhD07ykS9+UQuxl0xHbk6mWwHer0zDjE
	 ebD2Rv5NoKEhHIphpwkrRCX1lX0CeWpkvvi7atu0Ppg7Elwde7dgylcnduNA/EOZBZ
	 jmC+1QXMoRfwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723090808.1727598-3-joakim.zhang@cixtech.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:22:39 +0000
Message-Id: <20260723092240.1BE621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Ignored return values from `regmap_read` cause uninitialized stack=
 variables to be written back to CRU hardware.
- [High] Multiple distinct CCF composite clocks share the exact same hardwa=
re gate bits, leading to accidental clock shutdown.
- [High] Self-deadlock via recursive CCF prepare_lock acquisition in PM run=
time resume.
- [Medium] Missing pm_runtime_disable() leaves PM runtime unbalanced on dri=
ver unbind or probe failure.
- [Medium] The driver mutates a static global array to store instance-speci=
fic register context during suspend.
- [Medium] The PM runtime usage counter is leaked if `devm_add_action_or_re=
set` fails, preventing device suspend.
- [Medium] `devm_auxiliary_device_create` returns an ERR_PTR on failure, bu=
t the code only checks for NULL.
- [Medium] Parent clocks and reset lines permanently leak on unbind if CONF=
IG_PM is disabled.
--

--- Patch [2]: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller ---
commit 19bc5160a5549b717fff68a9a09d43f5b6738fca
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: clk: cix: add sky1 audss clock controller

This commit adds a platform driver for the Cix Sky1 AUDSS CRU. It maps
the CRU registers, provides mux, divider, and gate clocks, manages reference
clocks, enables runtime PM, and creates an auxiliary reset device.

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-au=
dss.c
--- /dev/null
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -0,0 +1,1206 @@
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: Medium]
Does this global array get overwritten if multiple instances of this driver
suspend? Since sky1_audss_clk_runtime_suspend writes instance-specific
register context directly into this shared array, it seems like device
states could clobber each other.

[ ... ]
> +	CFG(CLK_I2S0_APB,
> +	    "audss_i2s0_apb",
> +	    i2s_apb_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_CLK_GATE, 0, 0,
> +	    0),
[ ... ]
> +	CFG(CLK_I2S0,
> +	    "audss_i2s0",
> +	    i2s0_parents,
> +	    NULL,
> +	    INFO_CLK_MUX, 0, 2, 0,
> +	    INFO_CLK_DIV, 2, 2, 0,
> +	    INFO_CLK_GATE, 0, 0,
> +	    0),

[Severity: High]
Do CLK_I2S0_APB and CLK_I2S0 share the exact same hardware gate bits?
Both use INFO_CLK_GATE at shift 0. If they point to the same physical bit,
could disabling one clock cause the CCF to write a 0 and unintentionally
shut down the other active clock?

[ ... ]
> +static int sky1_audss_reset_controller_register(struct device *dev)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	adev =3D devm_auxiliary_device_create(dev, "reset", NULL);
> +	if (!adev)
> +		return -ENODEV;

[Severity: Medium]
Does devm_auxiliary_device_create return an ERR_PTR on failure instead of
NULL? If it returns an ERR_PTR, the !adev check will fail to catch the erro=
r,
and the function will silently return success, potentially hanging downstre=
am
drivers that need the reset controller.

[ ... ]
> +static int sky1_audss_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
[ ... ]
> +	if (mux->flags & CLK_MUX_HIWORD_MASK) {
> +		reg =3D mux->mask << (mux->shift + 16);
> +	} else {
> +		regmap_read(sky1_mux->regmap, sky1_mux->offset, &reg);
> +		reg &=3D ~(mux->mask << mux->shift);
> +	}
> +	val =3D val << mux->shift;
> +	reg |=3D val;
> +	regmap_write(sky1_mux->regmap, sky1_mux->offset, reg);

[Severity: High]
Can regmap_read fail here? If it returns an error, reg remains uninitialize=
d.
We would then modify this uninitialized stack variable and write it back to
the hardware, which might corrupt the hardware state.

[ ... ]
> +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
[ ... ]
> +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> +		val =3D clk_div_mask(divider->width) << (divider->shift + 16);
> +	} else {
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val &=3D ~(clk_div_mask(divider->width) << divider->shift);
> +	}
> +	val |=3D (u32)value << divider->shift;
> +	regmap_write(sky1_div->regmap, sky1_div->offset, val);

[Severity: High]
Similar to the mux function above, does this code handle regmap_read failur=
es?
If it fails, val is left uninitialized and could result in writing garbage
back to the clock controller register.

[ ... ]
> +static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	int i, err;
> +
> +	for (i =3D 0; i < devtype_data->clk_num; i++) {
> +		err =3D clk_prepare_enable(priv->clks[i]);

[ ... ]
> +static void sky1_audss_clk_rpm_cleanup(void *data)
> +{
> +	pm_runtime_force_suspend(data);
> +}

[Severity: Medium]
If the kernel is built without CONFIG_PM, pm_runtime_force_suspend is a
no-op. Could this mean that the parent clocks and reset lines enabled during
probe will permanently leak on unbind, since this is the only teardown path?

Also, since pm_runtime_enable is called during probe, should we call
pm_runtime_disable here to keep the PM runtime state balanced on driver
unbind or probe failure?

[ ... ]
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	/*
> +	 * Register cleanup action before clocks/provider (released last under =
LIFO).
> +	 */
> +	ret =3D devm_add_action_or_reset(dev, sky1_audss_clk_rpm_cleanup, dev);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If devm_add_action_or_reset fails, we return directly. Does this leak the PM
usage count incremented by pm_runtime_get_noresume just above, preventing
the device from ever suspending?

[ ... ]
> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *d=
ev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret =3D sky1_audss_clks_enable(priv);

[Severity: High]
Could this result in a deadlock? When a consumer calls clk_prepare on an
audss clock, CCF acquires the global prepare_lock mutex and may call
pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lo=
ck
again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723090808.1727=
598-1-joakim.zhang@cixtech.com?part=3D2
