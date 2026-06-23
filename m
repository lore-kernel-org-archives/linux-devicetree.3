Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3151A01BE
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199166; cv=none; b=K8BN9+PcSjUk0jj6rd97x7tufWqZQTckXH63jBDG6J8EPGvSdwCR29tLJltYso1wqR6dXpPhz7/KlxPCEoI+86DdLsJ7DrJM1J9Tm49JcnO8K39GECIcC6QMbw2GZbVSTFa+8+opiNpJLZZyvFXLV4dg8qt/H0KWW+Iz0WJzSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199166; c=relaxed/simple;
	bh=aQ8UkA3pQgqkCfK3ex4/uPSvIE2nn/siqjY6zy7koY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MJhtldvctx78MY0fkpWM3dVw3V0koPU8KzHnJzhUxHAPzqVe0YXwnX3WAxOrkhxYP0Sm7hN/rfSq8xTRVU3+hE1u1/plIgck6UDwnousqUGOsGQ1LeGjhMPyowYuMTU7RotfXGXz75m7YbUx9DKtgd1p4yBrES3RQ6/zbQpt7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf1wPFAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf1wPFAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7711F00A3A;
	Tue, 23 Jun 2026 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782199164;
	bh=ww8KIEhxfWXdt8N3XKbKCLrTGfv8DZjo0H1HlP9AWgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qf1wPFAljVp5hYDX1fuZ9iHmnWNTbTwNqQr2U1kVxsd9yHpyB7Mm7vChX/1HiiikW
	 urFIZyy7BW4FdLgfYqhiOkWTbPxhnhFo9zNqEZYbRaxXfcldcYPdbmCE63UgCtuUhg
	 uOR7SxYfNTBBGbFZPNWLeaMcVkLzj0o/UWUmDaOfIXBi95nakNcnwBmuJNnVUPaT2F
	 lC1jHSimH40B/Rp0wTOjShrXEEoLFMy/0kAC0LaQsYwTHyCRKMUmEDXWVLOm1pyqsj
	 DjP2rfh1LDJvKFNkbBq4toBpEh8iEFenLLt844HOOHgmKpfMDB5eWhTpTUnXTxeVzz
	 9u+RV7vlzqH6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623070805.211019-3-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
 <20260623070805.211019-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:19:23 +0000
Message-Id: <20260623071924.4C7711F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Manual unregistration of composite clocks creates a Use-After-Free=
 vulnerability due to premature freeing of clk_hw pointers.
- [High] Clock operations access hardware registers without runtime resumin=
g the provider device, causing bus faults.
- [High] Forceful suspend in remove() breaks PM guarantees for devres-manag=
ed child reset controller device.
- [Medium] Probe and resume error paths leak the PM runtime usage counter a=
nd leave the hardware reset deasserted.
- [Medium] Hardware register state is saved to a shared global static array=
 during suspend, causing cross-device memory corruption.
- [Medium] Return value of reset_control_deassert() is ignored during probe.
- [Medium] Clock operations read hardware registers using regmap_read() wit=
hout checking the return value, risking the use of uninitialized stack vari=
ables.
- [Low] Unconditional assignment of the dev_pm_ops structure bypasses dead =
code elimination when CONFIG_PM is disabled.
--

commit 2a293298bf161f9032ad5d5ba5c782ee20a8e27c
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

This commit adds a platform driver for the Cix Sky1 AUDSS CRU. It provides
mux, divider, and gate clocks for the DSP, SRAM, and other audio subsystem
blocks. It also handles the AUDSS NOC reset and initializes an auxiliary
reset device.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> index 0000000000000..25341be4f5bf6
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

[Severity: Medium]
Since sky1_reg_save is declared as a global static array, won't multiple
instances of this device overwrite each other's saved register states during
sky1_audss_clk_runtime_suspend()?

[ ... ]
> +static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct clk_gate *gate =3D to_clk_gate(hw);
> +	struct sky1_clk_gate *sky1_gate =3D to_sky1_clk_gate(gate);
> +	int set =3D gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> +	unsigned long flags =3D 0;
> +	u32 reg;
> +
> +	set ^=3D enable;
> +
> +	if (gate->lock)
> +		spin_lock_irqsave(gate->lock, flags);
> +	else
> +		__acquire(gate->lock);
> +
> +	if (gate->flags & CLK_GATE_HIWORD_MASK) {
> +		reg =3D BIT(gate->bit_idx + 16);
> +		if (set)
> +			reg |=3D BIT(gate->bit_idx);
> +	} else {
> +		regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);

[Severity: High]
Does this code access hardware registers while the device might be runtime
suspended?

At the end of sky1_audss_clk_probe(), pm_runtime_put_sync() is called, which
powers off the hardware. If a clock operation like
sky1_audss_clk_gate_endisable() is later invoked (for example, by reading
/sys/kernel/debug/clk/clk_summary), couldn't this cause a bus fault?

[ ... ]
> +static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw *h=
w,
> +							unsigned long parent_rate)
> +{
> +	struct clk_divider *divider =3D to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider);
> +	unsigned int val;
> +
> +	regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +	val =3D val >> divider->shift;

[Severity: Medium]
Can this lead to the use of an uninitialized variable?

If regmap_read() fails, val remains uninitialized, but it is immediately
shifted and used. Should the return value of regmap_read() be checked here
and in sky1_audss_clk_mux_get_parent()?

[ ... ]
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv->rst_noc =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst_noc))
> +		return dev_err_probe(dev, PTR_ERR(priv->rst_noc),
> +				     "failed to get audss noc reset");
> +
> +	reset_control_deassert(priv->rst_noc);

[Severity: Medium]
Is it safe to ignore the return value of reset_control_deassert() here? If
the reset fails to deassert, might subsequent MMIO accesses hang the system?

[ ... ]
> +	for (i =3D 0; i < devtype_data->clk_cfg_size; i++) {
> +		clk_table[devtype_data->clk_cfg[i].id] =3D
> +			sky1_audss_clk_register(dev,
[ ... ]
> +		if (IS_ERR(clk_table[devtype_data->clk_cfg[i].id])) {
> +			ret =3D PTR_ERR(clk_table[devtype_data->clk_cfg[i].id]);
> +			dev_err(dev, "failed to register clock %d, ret:%d\n",
> +				devtype_data->clk_cfg[i].id, ret);
> +			goto fail_array_clk;
> +		}
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv->c=
lk_data);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto fail_register;
> +	}
[ ... ]
> +fail_register:
> +fail_array_clk:
> +	while (i--)
> +		clk_hw_unregister_composite(clk_table[devtype_data->clk_cfg[i].id]);

[Severity: High]
Could this cause a use-after-free?

Since devm_of_clk_add_hw_provider() is devres-managed, the OF clock provider
will be unregistered automatically after the probe error path completes. If=
 we
manually free the composite clocks here before the provider is unregistered,
couldn't concurrent clock lookups access the freed clk_hw pointers?

[ ... ]
> +fail_fixed_clk:
> +fail_clks_set:
> +	pm_runtime_put_sync(dev);
> +err_pm:
> +	pm_runtime_disable(dev);
> +	return ret;
> +}

[Severity: Medium]
Does this error path leak the PM runtime usage counter?

Earlier in sky1_audss_clk_probe(), pm_runtime_get_noresume() increments the
counter, but the err_pm path does not call pm_runtime_put_noidle(). Also,
should the rst_noc reset be re-asserted here to match the expected
powered-down state?

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
Similar to the probe error path, does this manual unregistration open a
use-after-free window during unbind, since the devm-registered OF provider =
is
still active until after sky1_audss_clk_remove() finishes?

> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);
> +}

[Severity: High]
Can this forceful suspend break the devres-managed child reset controller?

The child reset controller device created by devm_auxiliary_device_create()
is unregistered after sky1_audss_clk_remove() returns. If we forcefully
suspend the hardware here, wouldn't the child driver access powered-down
registers if it attempts hardware cleanup during its own teardown?

[ ... ]
> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *d=
ev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
[ ... ]
> +	ret =3D reset_control_deassert(priv->rst_noc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}

[Severity: Medium]
If sky1_audss_clks_enable() fails, shouldn't we assert priv->rst_noc before
returning, so that the hardware reset state correctly matches the runtime
suspended state?

[ ... ]
> +static struct platform_driver sky1_audss_clk_driver =3D {
> +	.probe =3D sky1_audss_clk_probe,
> +	.remove =3D sky1_audss_clk_remove,
> +	.driver =3D {
> +		.name =3D "sky1-audss-clk",
> +		.suppress_bind_attrs =3D true,
> +		.of_match_table =3D sky1_audss_clk_of_match,
> +		.pm =3D &sky1_audss_clk_pm_ops,
> +	},
> +};

[Severity: Low]
Should the assignment to .pm be wrapped with pm_ptr()? Without it, the
sky1_audss_clk_pm_ops structure and its callbacks will not be eliminated as
dead code when CONFIG_PM is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623070805.2110=
19-1-joakim.zhang@cixtech.com?part=3D2
