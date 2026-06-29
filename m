Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42031253B42
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725465; cv=none; b=iT2ufeEdQ5bcyBpRbvDj1rzolqEp+NAdIiMPrTmnAXmzJ1hXW9XCms1ZkC7kv/6R4sMRM5FY6cS4D7kylOk6IZjULN9Nkmy2+CASegSobPFnyAu+4Zj0ubf4ELW1SxwaYex6G/PHI2Smg6xF4uI/QjX5E6o4eS1mJvVIQihHFO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725465; c=relaxed/simple;
	bh=7A8+VX1HDm5PDMBNjL7Tcrl+CWgGggfq3fco3hcJ0GU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uf7AFkmwwAALEVwvO7nG2dz259/fD/wX8yNCiDBqxhBj2B9hL51YvH5DbZFCfKm0vxdrbtHkvzHnzeAclTD4zSMswAOEjJZewacu/j+RpxMZ6nC3KNHAB7qbY6YlcmB0uyVC5+8T1Z/eHeL+PshRkT+HqIXqLfHnklXBf0KlWzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZsrX7uw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZsrX7uw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9751F000E9;
	Mon, 29 Jun 2026 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725463;
	bh=XWZZEBWS/awMfd3And+9m5Jbb4t7iW63LH/jyVyC2Ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZsrX7uwrByNPowzlalDrS3e/QWGO8eIa6qah4xFo3WsCIZ+cwyBVQlc0rggg+K3R
	 wKE3hfst+Hv0913wMJgoYI/Pt1p6gzsMr/q5MYafXIYE5ulbVBFedvtoNwju+yHkzx
	 Kq7unUXq7M6gUY/dC60z2WvSuqVEGBsSJlV28jjh1Mt1UTRuQtTI7L8MytJUcy0DOp
	 7C45Z5o8jdvyRfhuvCqHJgE22sQn6bTmsChsCCEpNBgRukc25Rbgyd4NMlsw3hblGQ
	 Zlp4+Og5LLN01O5nr3lKQtQSkhL9q2Xi35W6rtLiV5eUagOgolSCtP+OlzuZ2WaV83
	 uwqOwHqmsyvOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629091500.52540-3-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
 <20260629091500.52540-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:31:03 +0000
Message-Id: <20260629093103.9B9751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Manual unregistration of composite clocks creates a Use-After-Free=
 window for the OF clock provider.
- [High] The driver saves per-device PM runtime state into a statically all=
ocated global shared array.
- [High] Missing hardware state rollback in PM runtime suspend callbacks up=
on failure.
- [High] Clock operations access MMIO registers without ensuring the device=
 is runtime resumed, leading to bus faults.
- [High] The reset controller auxiliary device remains accessible after the=
 hardware is powered down in `remove()`.
- [High] Multiple distinct clocks are mapped to the same physical gate bit,=
 leading to unbalanced hardware state.
- [Medium] Unbalanced PM runtime usage counter and inconsistent reset state=
 on probe error paths.
- [Medium] Race condition in device removal due to incorrect PM runtime tea=
rdown order.
- [Low] The dev_pm_ops structure is unconditionally assigned without the pm=
_ptr() wrapper.
--

commit 1f90bbe464605b65e1fc0b224f338cd666c9fd20
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: clk: cix: add sky1 audss clock controller

Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
the CRU registers and registers mux, divider and gate clocks for
DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..fbc0ec9c47e55
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: High]
Does this global array cause data corruption if multiple driver instances
suspend or resume concurrently? It looks like instance-specific state might=
 be
better placed dynamically inside the private struct instead of shared globa=
lly.

[ ... ]
> +static const struct composite_clk_cfg sky1_audss_clks[] =3D {
[ ... ]
> +	/* hda */
> +	CFG(CLK_HDA_SYS,
> +	    "audss_hda_sys",
> +	    hda_sys_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_CLK_GATE, 14, 0,
> +	    0),
> +	CFG(CLK_HDA_HDA,
> +	    "audss_hda_hda",
> +	    hda_hda_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_GATE, 14, 0,
> +	    0),

[Severity: High]
Can assigning multiple distinct clocks to the same physical gate bit lead to
unbalanced hardware state?

If a consumer disables CLK_HDA_SYS, does the driver clear bit 14,
unintentionally turning off the clock for CLK_HDA_HDA? If the HDA consumer
accesses its hardware afterward, could it hit an unclocked peripheral?

[ ... ]
> +static const struct regmap_config sky1_audss_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};

[Severity: High]
Is it possible to trigger a bus fault here? If a consumer modifies a clock,
the framework invokes atomic clock callbacks (like sky1_audss_clk_gate_endi=
sable)
which run under a spinlock and cannot wake up the device synchronously.
Because the regmap config omits pm_runtime integration, could the MMIO writ=
es
be issued to unclocked hardware if the CRU is suspended?

[ ... ]
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		goto err_pm;
> +	}
[ ... ]
> +	ret =3D sky1_audss_reset_controller_register(dev);
> +	if (ret)
> +		goto fail_register;

[Severity: High]
Is there a use-after-free window if a consumer accesses the reset controller
after the driver is unbound?

sky1_audss_reset_controller_register() uses devm_auxiliary_device_create(),
which means the auxiliary device is unregistered after sky1_audss_clk_remov=
e()
completes. In sky1_audss_clk_remove(), the hardware is forcefully suspended
and powered down. Does this mean any consumer asserting a reset during this
window accesses powered-down registers?

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

[Severity: Medium]
Should the probe error path balance the pm_runtime usage counter and hardwa=
re
state? The pm_runtime_disable() call doesn't drop the usage counter increme=
nted
by pm_runtime_get_noresume() earlier, potentially leaving a permanent leak.
Also, is it necessary to re-assert the reset line here?

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
Does this manual unregistration create a use-after-free window for the OF
clock provider?

The provider is registered using devm_of_clk_add_hw_provider(), so it remai=
ns
active until after remove() completes. Meanwhile, clk_hw_unregister_composi=
te()
immediately frees the clock structures, leaving dangling pointers if a cons=
umer
looks up the provider during this window.

> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);

[Severity: Medium]
Could this teardown order cause a race condition? Since pm_runtime is still
enabled when pm_runtime_force_suspend() is called, could a concurrent runti=
me
resume request happen immediately after, putting the device back into an ac=
tive
state before pm_runtime_disable() runs?

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
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	sky1_audss_clks_disable(priv);
> +
> +	return reset_control_assert(priv->rst_noc);

[Severity: High]
If reset_control_assert() fails, does this leave the hardware in a broken
state? Returning an error to the PM core leaves the device marked as
RPM_ACTIVE, but the clocks were already disabled by sky1_audss_clks_disable=
().
Could subsequent accesses to the device registers trigger a bus fault?

> +}
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
Does this unconditional assignment cause dead code when CONFIG_PM is disabl=
ed?
Should this be wrapped with pm_ptr(&sky1_audss_clk_pm_ops)?

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091500.5254=
0-1-joakim.zhang@cixtech.com?part=3D2
