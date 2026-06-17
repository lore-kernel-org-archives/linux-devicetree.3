Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD23B8D41
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679273; cv=none; b=qiMShcs1VTppCXgPGZTozWX11uiQ4Zh2BFFePlypTzejPKXbk+EcN8INsdUWp4iTeEZm7lgh1TuzUnjmRyxzyRecgk5+qM48lbADzYpt5nWtYGyE1jHyhKk96qMx9Q/wsg3RQ2pC46IOpSjvToSU1L7ZgsTn/c5hqyLBscid6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679273; c=relaxed/simple;
	bh=smEb3AwNqVjp5l47UDql6nfiiTsOmrABtaI/NqDByEo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gRiqB8dsbg2uyX/AzbK8jHktElnW0INK8D0JNN2+1qs/T00rqHHWdOcy6q7Y9SYUwvPc9IrVKel9Q/t0Xn246ZRz43oNqhem1dGOo7WQEZpirY68jUe/19cp7zdcMURFQWSPRDy1Vlfk4MHT2635UtDJB2e5Yhoeppklam54Xng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMPxvQjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMPxvQjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5D61F000E9;
	Wed, 17 Jun 2026 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679270;
	bh=dSG1N2RzgmmYFVDjS/hSmmH8jn2K7pkcHVpGLh7KUhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMPxvQjxIfDNmypqSf823sZcldN0YJCRw9NsD8WwnDtAeRbSnPYTezsTLuZGnHQ9h
	 WzadOGzuIqAJpUOddN3kpZzdsOE9ITWXihNqJuVho7D5ZfwwXimnLs5f4pOsdQY+zF
	 hYc+OQ1ZIeF26LKn0oH9K0E0zEzFQxNKjPYgJME5r5zYNujN1eQF++GdzRSRycMZcd
	 jvv3pIt2/2/MdmTdxyvuF1dq4uaHSb7NYoqB+krPp8Hydl/kPaRUxawZgHw8OMY8+9
	 EPsoe/gP0ajpvCYCaJ5aI9KIk7g5P8n+HKvojAU+IBV50irgyzOXMGworYm1vfJYjM
	 AFh0dRZ0FfmqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 resend 4/5] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617064100.1504617-5-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
 <20260617064100.1504617-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 06:54:29 +0000
Message-Id: <20260617065429.EE5D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver mutates a statically allocated global array to save reg=
ister state during runtime suspend, breaking multi-instance driver isolatio=
n.
- [High] Using `pm_runtime_force_suspend()` in the `remove` callback leaks =
the PM runtime `disable_depth` counter, permanently breaking PM runtime fun=
ctionality if the driver is unbound and later rebound.
- [High] Dangling clock hardware pointers due to mixing `devm_` provider re=
gistration with manual clock unregistration.
- [High] Multiple independent composite clocks share the exact same physica=
l gate register and bit shift, which will cause unexpected hardware clock-g=
ating.
- [High] Shared hardware divider is incorrectly modeled as independent divi=
ders in multiple clock configurations.
- [Medium] Parent clocks remain permanently enabled on probe error paths an=
d upon device removal when CONFIG_PM or runtime PM is disabled.
- [Low] The `dev_pm_ops` structure pointer is assigned unconditionally with=
out the `pm_ptr()` wrapper, causing dead code when CONFIG_PM is disabled.
--

commit 6ca49a84216985afbfc516b783d555632389eed6
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

This patch adds a platform driver for the Cix Sky1 Audio Subsystem (AUDSS)
internal clock controller. It registers mux, divider, and gate composite
clocks for various components like DSP, SRAM, HDA, and I2S outputs.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..c1e7dfe45d12c
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1167 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright 2026 Cix Technology Group Co., Ltd.

[ ... ]

> +static const struct composite_clk_cfg sky1_audss_clks[] =3D {
> +	/* dsp */
> +	CFG(CLK_DSP_CLK,
> +	    "audss_dsp_clk",
> +	    dsp_clk_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,

[Severity: High]
Does this code correctly model the hardware divider topology?

Over 15 distinct clocks in this array, including CLK_DSP_CLK, CLK_SRAM_AXI,
and all CLK_I2S*_APB clocks, define their divider configuration to use the
exact same register and bitfield (INFO_CLK_DIV at shift 0 with width 2).

If the Linux clock framework treats these as independent divider components,
would calling clk_set_rate() on one clock silently change the frequency of
all other clocks sharing those bits without the framework knowing?

> +	    INFO_HIFI0, 0, 0,
> +	    0),

[ ... ]

> +	/* i2s */
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
Is it intentional that multiple independent clocks share the exact same gate
bit?

For example, both CLK_I2S0_APB and CLK_I2S0 map their gate control to
INFO_CLK_GATE shift 0. The clock framework tracks enable counts per instance
independently.

If a consumer enables and then disables CLK_I2S0_APB, won't the clock
framework physically clear bit 0, inadvertently turning off the hardware
clock for CLK_I2S0 as well?

[ ... ]

> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		goto err_link;
> +	}

[ ... ]

> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv->c=
lk_data);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto fail_register;
> +	}
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
> +	pm_runtime_disable(dev);

[Severity: Medium]
Will this error path properly disable parent clocks if CONFIG_PM is disable=
d?

The driver enables its parent clocks earlier in probe via
sky1_audss_clks_enable(). If an error occurs here, the driver exclusively
relies on pm_runtime_put_sync() to trigger sky1_audss_clk_runtime_suspend()
and clean up the clocks.

If CONFIG_PM is disabled, or runtime PM is forbidden via sysfs, won't this
leak the prepare and enable counts of the parent clocks?

> +err_link:
> +	device_link_remove(dev, dev->parent);
> +	return ret;
> +}
> +
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
Does manually unregistering these clocks create a use-after-free window?

The clock provider is registered via devm_of_clk_add_hw_provider() in probe,
which delegates provider removal to devres. Devres runs after the remove()
callback returns.

By manually unregistering and freeing all composite clocks here in remove(),
doesn't the clock provider remain active while pointing to freed
clk_composite objects until devres eventually cleans up the provider?

> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);

[Severity: High]
Does calling pm_runtime_force_suspend() followed by pm_runtime_disable()
permanently break runtime PM for this device?

pm_runtime_force_suspend() is intended for system-level sleep, and it
internally increments the PM runtime disable_depth counter by calling
pm_runtime_disable(). Calling pm_runtime_disable() a second time here
increments it again.

Since the device persists in sysfs across bind/unbind cycles, wouldn't a
subsequent probe() only call pm_runtime_enable() once, leaving
disable_depth > 0 and breaking runtime PM?

[Severity: Medium]
Additionally, if CONFIG_PM or runtime PM is disabled, does this remove()
function leak the prepare/enable counts for the parent clocks? This seems
likely since it relies solely on pm_runtime_force_suspend() to trigger
sky1_audss_clk_runtime_suspend() for clock disablement.

> +	device_link_remove(dev, dev->parent);
> +}
> +
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

[Severity: High]
Is it safe to use a statically allocated global array to save device state?

The devtype_data->reg_save pointer references the global sky1_reg_save arra=
y.
By reading registers directly into this shared array, any other driver
instances matching cix,sky1-audss-clock will have their state overwritten.

Could this lead to instances writing incorrect register values back to the
hardware during resume?

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
Should this assignment use the pm_ptr() macro?

When power management is disabled, this unconditional assignment forces the
compiler to keep the sky1_audss_clk_pm_ops structure in the binary instead
of safely discarding it as dead code.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617064100.1504=
617-1-joakim.zhang@cixtech.com?part=3D4
