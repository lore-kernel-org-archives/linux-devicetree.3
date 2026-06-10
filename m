Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42162D8795
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072948; cv=none; b=XullOF4ZlKfq73dMPPDAAJw1iR8oKTQHh93Wd6unyGeHuhFVjE4cE7Q8Ebx5YQ6BcbGPN+7zq9EUNuW2kkJ7ZJ6x1sNwHRebMbWofZXT/a06ASqTKWhxgX4aVwBKEbEJdAEWYRTwB1cYS4gsZYYticjZ5Pi8Vt8SLoIoCP0OKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072948; c=relaxed/simple;
	bh=IuhAI6CgqbR4Ga04dFCecqoZ9LHB3ZuD+vz6GZnGs4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arx8ESwZtvtKQ2N2Tz1OlfgVecjEnvN19Tf4YpkBrYKuW/2nIB2OM7TBGwLJ/sQMDH8KKoYd7ep1FYphWb2AlUH9w6fLebq3wloYuCUSCDxMr0t3BgBO+YtDL01y2k4NL/FcpbQHcMNxUkdb96WHdZ15sOPEXw1zdHLGzkibgeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf/gfab1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf/gfab1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A7C1F00898;
	Wed, 10 Jun 2026 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781072947;
	bh=uOqzymTff/5aoeAK+gqGLLbo8eVpPimqfl4ENEHL0FY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kf/gfab1Baf0D6y57wqBbayN6DLfSyau9aYP9B6Z3XfCNmqTPL7krV91Cl6AtPROC
	 vu6mv4ulztepdOA8w4YcT2bRQi0Tdxt7+oqV22r/c5enh4yvA1quAm0tmGKzjed9WC
	 polSHeZYB56sS9KyvcQyb/5mv/MmcL0zkr+Baz4YN81ZOIa8CnN/RgXd9T7PqhLJUN
	 C7KZtAsF5lBdWBUdg5SKhJYg9UIBaljdaFU4/xZY9IrQHNMGVDG6cqzvkE1H1umB2p
	 wNAeGtl/cRnEiBjh0BfGNITs4QbfPaOHYiBM2P3rmX5yau+XXbSZXEzZ4OjxL4viyE
	 a8aHfJyzxu5tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610061712.3203984-5-joakim.zhang@cixtech.com>
References: <20260610061712.3203984-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:29:06 +0000
Message-Id: <20260610062907.25A7C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Device-specific suspend/resume register state is stored in a globa=
lly shared static array, breaking multi-instance support and causing state =
corruption.
- [High] Unchecked regmap_read() results in usage of uninitialized stack va=
riables.
- [High] Clock operations access hardware registers without PM runtime prot=
ection, potentially causing bus faults or lost register updates.
- [High] Race condition during device removal leading to Use-After-Free of =
composite clock structures due to LIFO inversion.
- [High] A massive copy-paste error causes nearly all clocks in the system =
to write to the exact same divider register bits, leading to silently corru=
pted hardware states.
- [High] Non-atomic read-modify-write sequences are performed on a shared s=
yscon regmap, leading to race conditions.
- [Medium] Parent clocks enabled during probe are leaked on device removal =
and probe error paths when CONFIG_PM is disabled.
- [Low] The `dev_pm_ops` structure pointer is assigned unconditionally in t=
he driver, producing dead code when CONFIG_PM is disabled.
--

commit f6414eab975c93e0178027203d04f1647fb5efdb
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Date:   Wed Jun 10 06:17:11 2026 +0000

    clk: cix: add sky1 audss clock controller
   =20
    Add a platform driver for the Cix Sky1 Audio Subsystem (AUDSS) internal
    clock controller. The driver binds to a cix,sky1-audss-clock device tree
    node under the AUDSS syscon, obtains the parent regmap via
    syscon_node_to_regmap(), and registers mux/divider/gate composite clocks
    for DSP, SRAM, HDA, DMAC, watchdog, timer, mailbox and I2S outputs. Four
    SoC-level audio reference clocks are brought up as inputs to the tree.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..3ec6bea93b73c
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
Will this global static array cause state corruption if there are multiple
instances of the device?

It looks like multiple instances would concurrently overwrite each other's
saved register context during suspend/resume. Should this save buffer be
allocated per-instance inside struct sky1_audss_clks_priv?

[ ... ]
> +	CFG(CLK_I2S0_APB,
> +	    "audss_i2s0_apb",
> +	    i2s_apb_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,

[Severity: High]
Does this configuration accidentally assign the same register and bit shift
to multiple clocks?

Looking at the array, clocks like CLK_I2S0_APB through CLK_I2S9_APB, as
well as CLK_DSP_CLK, CLK_SRAM_AXI, and others, all specify
INFO_CLK_DIV, 0, 2, 0 for their divider.=20

Will updating the rate for any of these clocks silently overwrite the
hardware divider for all the others?

[ ... ]
> +static u8 sky1_audss_clk_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_mux *mux =3D to_clk_mux(hw);
> +	struct sky1_clk_mux *sky1_mux =3D to_sky1_clk_mux(mux);
> +	u32 val;
> +
> +	regmap_read(sky1_mux->regmap, sky1_mux->offset, &val);
> +	val =3D val >> mux->shift;

[Severity: High]
If regmap_read() fails, could this use an uninitialized stack variable?

The return value of regmap_read() is ignored, meaning val could remain
uninitialized when shifted and returned. A similar pattern appears in
sky1_audss_clk_divider_recalc_rate().

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
Is it safe to access hardware registers here without ensuring the device is
active via PM runtime functions?

If the clock callbacks are invoked while the subsystem is suspended, this
might access powered-down MMIO or the changes might be immediately
overwritten when sky1_audss_clk_runtime_resume() restores the old state.

[Severity: High]
Can this sequence lose concurrent register updates?

Since the regmap is shared via syscon_node_to_regmap(), the private lock
doesn't serialize these accesses against other drivers modifying different
bits in the same syscon.

Would regmap_update_bits() be safer here to atomically perform the update?
A similar pattern appears in sky1_audss_clk_divider_set_rate() and the gate
callbacks.

[ ... ]
> +fail_clks_set:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	return ret;
> +}

[Severity: Medium]
Will the parent clocks leak their prepare/enable references if CONFIG_PM is
disabled?

The driver relies on pm_runtime_put_sync() to trigger the suspend callback
to disable the clocks. If runtime PM is stubbed out, the clocks enabled
during probe might never be disabled on error paths or during device
removal.

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
Does this create a use-after-free window?

The OF clock provider is registered using devm_of_clk_add_hw_provider()
which will run its cleanup after remove() finishes. If we manually
unregister and free the composite clocks here, consumers might look up
a freed clock pointer via the device tree during that window.

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
Is it intended to leave the dev_pm_ops pointer assigned unconditionally?

If CONFIG_PM is disabled, this prevents the compiler from discarding the
sky1_audss_clk_pm_ops structure and its referenced callbacks as dead code.
Could we use the pm_ptr() wrapper here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610061712.3203=
984-1-joakim.zhang@cixtech.com?part=3D4
