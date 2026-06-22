Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B213959D
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782096028; cv=none; b=XdzJ61AKxrpnW9ZvqW4jE6TkWD/4/+tlZ2rlsHE0leWHB0GcuycEK3/ioazBKJmBIQl3y98ZKNX5TRFAI04b+eeyUTbzs4QXJN5wvKoar0mO9LqWip3748Wv0gVtUaBI5u2wyrjQoTEbB6dOGG53rd3c4/oj+AFhwPblF5B4lLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782096028; c=relaxed/simple;
	bh=8ffCOtsqlT41tpTE2EP2idhUUvPvdjMW50AYbHMMBaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Me1jvI7CZvLburp2yOL5aRG6Y/kOpqx/ctjscrQO7eoBDPA5IfWTeh8hq2DDG6Wa/+qPoez7l3MvWsZ/2FQDdUmuygXfx4lyZVxoMFgTtMtr3aHgtCUS+ZLdtCGHMwvdzccGW1g/aYgVYa3XQZPRBsMribNMLKyLWWmttgXxTdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LciuLoYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LciuLoYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43AE1F000E9;
	Mon, 22 Jun 2026 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782096026;
	bh=lFDTh7bHMB7/R4NDNlO/+eLDw+8TQXpPk3Vv1YmxVsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LciuLoYp0vaLnev+fbaVtmsQZnDEgVY2Ni3sUzoZxo6L7mml9Dga56lSeckvbg387
	 sjnxpnSQih2Xm7ogO5IOFnE3Mb+hbKAYwqvsg6u/iG0nl3WWms2dC5vUtmFOvr1CXQ
	 AnYU8auMTfCcnUzN+DZOx4pXRyhn8U/wMmYHNgrrEqRAtb/XuQQyKAS8uijZA27q6Z
	 0ij2wIEdf53vKW7SwPOfp8eHLAlnXAvBUQJOvSbtLNg/IbbMfKbVocOkIzFxPZ0bBa
	 nxnRKMqmzmg5BRpy/eY5jpvaMNBosjKSM80s2k49v/5DaJkRxd0+S/fDquAeBJVzsY
	 rWs6NgsQJtDyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622022520.3127103-3-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 02:40:26 +0000
Message-Id: <20260622024026.B43AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Clock operations access MMIO registers without waking the device f=
rom runtime suspend, causing fatal bus errors.
- [High] Error paths in probe and runtime resume leak the PM usage counter,=
 leave hardware out of reset, and leak clocks if CONFIG_PM is disabled.
- [High] Mixing devres clock provider registration with manual composite cl=
ock cleanup creates a Use-After-Free window.
- [High] Instance-specific register state is saved into a global static arr=
ay during runtime suspend, causing state corruption.
- [High] Unbalanced `pm_runtime_disable` depth in `sky1_audss_clk_remove` c=
auses driver rebind failures.
- [Low] Unconditional assignment of `dev_pm_ops` structure pointer without =
the `pm_ptr()` wrapper.
--

commit 56f48f8a9fbe140aaac12e836bfe295a80d9790a
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
the CRU registers and registers mux, divider and gate clocks for
DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.

Four SoC-level audio reference clocks are enabled as inputs to the
internal clock tree. The driver releases the AUDSS NOC reset, enables
runtime PM and instantiates the auxiliary reset device.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..8a4ab2d9419cf
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1201 @@
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[ ... ]
> +static int sky1_audss_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_mux *mux =3D to_clk_mux(hw);
> +	u32 val =3D clk_mux_index_to_val(mux->table, mux->flags, index);
> +	struct sky1_clk_mux *sky1_mux =3D to_sky1_clk_mux(mux);
> +	unsigned long flags =3D 0;
> +	u32 reg;
> +
> +	if (mux->lock)
> +		spin_lock_irqsave(mux->lock, flags);
> +	else
> +		__acquire(mux->lock);
> +
> +	if (mux->flags & CLK_MUX_HIWORD_MASK) {
> +		reg =3D mux->mask << (mux->shift + 16);
> +	} else {
> +		regmap_read(sky1_mux->regmap, sky1_mux->offset, &reg);

[Severity: High]
Is it safe to access the MMIO registers directly in the CCF clock operations
without first requesting a PM runtime wake?

The probe function puts the device into runtime suspend at the end of
execution. Since the Common Clock Framework does not automatically wake
provider devices for operations like set_parent or recalc_rate, could
accessing the registers of a powered-off hardware block trigger a
synchronous external abort?

[ ... ]
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv->c=
lk_data);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto fail_register;
> +	}
> +
> +	ret =3D sky1_audss_reset_controller_register(dev);
> +	if (ret)
> +		goto fail_register;
> +
> +	pm_runtime_put_sync(dev);
> +
> +	return 0;
> +
> +fail_register:
> +fail_array_clk:
> +	while (i--)
> +		clk_hw_unregister_composite(clk_table[devtype_data->clk_cfg[i].id]);
> +fail_fixed_clk:
> +fail_clks_set:
> +	pm_runtime_put_sync(dev);
> +err_pm:
> +	pm_runtime_disable(dev);
> +	return ret;
> +}

[Severity: High]
Do these error paths properly clean up resources?

If initialization fails and jumps to err_pm, it skips calling
pm_runtime_put_noidle() and reset_control_assert(), which appears to
permanently leak the PM usage counter and leave the hardware out of reset.

Additionally, if it fails and branches to fail_clks_set, it relies on
pm_runtime_put_sync(). If CONFIG_PM is disabled, will this leave the
clocks permanently enabled?

[ ... ]
> +static void sky1_audss_clk_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	int i =3D 0;
> +
> +	for (i =3D 0; i < devtype_data->clk_cfg_size; i++)
> +		clk_hw_unregister_composite(priv->clk_data->hws[devtype_data->clk_cfg[=
i].id]);

[Severity: High]
Does mixing devm_of_clk_add_hw_provider() with manual unregistration
create a use-after-free window?

Since devres executes after sky1_audss_clk_remove() returns, the OF clock
provider will remain active while the composite clock memory has already
been freed. Could a concurrent clk_get() lookup during this window return
a pointer to freed clk_hw memory?

> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);
> +}

[Severity: High]
Could this sequence cause driver rebind failures?

The pm_runtime_force_suspend() function internally increments the disable
depth. Calling pm_runtime_disable() immediately after increments it a
second time. Since probe() only enables PM once, would unbinding and
rebinding this driver leave the device with a disable_depth of 1,
permanently preventing runtime PM from enabling?

[ ... ]
> +static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *=
dev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	for (i =3D 0; i < devtype_data->reg_save_size; i++)
> +		regmap_read(priv->regmap_cru,
> +			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
> +	spin_unlock_irqrestore(&priv->lock, flags);

[Severity: High]
Could this cause data corruption if multiple instances of this device exist?

The sky1_reg_save variable is a global static array, but the register state
is being written directly into it during runtime suspend. If there are dual
audio subsystems, will one instance overwrite the other's saved clock
configurations?

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
> +	ret =3D reset_control_deassert(priv->rst_noc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}

[Severity: High]
Does the runtime resume error path miss asserting the reset control?

If sky1_audss_clks_enable() fails, the function returns without calling
reset_control_assert(), leaving the hardware out of reset while the system
considers it suspended.

[ ... ]
> +static struct platform_driver sky1_audss_clk_driver =3D {
> +	.probe =3D sky1_audss_clk_probe,
> +	.remove =3D sky1_audss_clk_remove,
> +	.driver =3D {
> +		.name =3D "sky1-audss-clk",
> +		.suppress_bind_attrs =3D true,
> +		.of_match_table =3D sky1_audss_clk_of_match,
> +		.pm =3D &sky1_audss_clk_pm_ops,

[Severity: Low]
Is it necessary to wrap the dev_pm_ops pointer assignment with pm_ptr()?

Without the wrapper, will the structure and its referenced callbacks be
compiled into the kernel as dead code when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622022520.3127=
103-1-joakim.zhang@cixtech.com?part=3D2
