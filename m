Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9193383326
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079084; cv=none; b=Eu/EfPLCNnA8VqQ3OPhxXYq5/pnx1yPSO+XD27Tc2v/PrToyVAvhBSxND+DwLdVtucaR0Ma+4SiyEP98DHgxp4IspxBjMGBricsLwQk+qLp3ng/IANwI47HFKXFjXXCGOfFdiJh4b+gqCwxtci+pMITxQJj2vG4CP/mtWKcQXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079084; c=relaxed/simple;
	bh=KNs+en9nhr+80/C+0dBqAOTxIiY1w3fGZ814/KD14WQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCwUWCQtRbdaZOcpE9/UejvYR1tkL0UTOyEglpOP6Sg/BHr359EPJ+YXJUjdCsOQJr1oSuZAlH6HmIoX6ItOq1medzktDhlnGsASv3MzvQdbc3cJdmOv3N5tEgp2ZItjbQ/hUZbp4Cm2kKsrDBfwind0CCaqPU91rY/upCQRNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKBe6bgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKBe6bgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03D71F00893;
	Wed, 10 Jun 2026 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079082;
	bh=RW9Sp5PvUIAlL7F8lNSAcwudZKsVKWfs2acPGTZqbjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKBe6bgvBDJYwt22ie9DblCXjZ013jFn7eNldNFmjZfHsBkf65Scnz7tANS1hYHKv
	 iX5zfTQu418IAw/S5EerMPRAA0Xwhaj1fXZ71PQJjt7iB0uhZ6sQ+mjQVZhr99SxMK
	 Yo0lCwYZ5XQotjNowA1GgG2IOC2LtDq7BJX5CO1jMvdmpwxBVO7oUd6+nbraWJifgD
	 WCzkALdeVv3Dq9WTUSpi6VrE8Zn8gGbqHEtvDqd8XsqY4tbyAm5xZ9aI8n4U12bcUE
	 gFdMS6N1pAaXNb6aSmnTxjoZqjEZCwwZjSrhkl0COogwxAOQeO6wttWd0ZrlghIcds
	 /yE1/87kEP2hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610075645.3581145-5-joakim.zhang@cixtech.com>
References: <20260610075645.3581145-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:11:21 +0000
Message-Id: <20260610081121.C03D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Reading registers while the device is still in reset during the pr=
obe error path causes a system bus hang.
- [High] Mismatch between manual unregistration of clocks and devm-managed =
OF provider registration creates a use-after-free window during device remo=
val.
- [High] Seventeen distinct clocks share the exact same physical divider co=
nfiguration bits, breaking clock topology.
- [Medium] Parent clocks enabled during probe are permanently leaked on err=
or paths and during device removal when `CONFIG_PM` is disabled.
- [Medium] The driver modifies a global static array to save instance-speci=
fic register states during runtime suspend.
- [Medium] Manual Read-Modify-Write (RMW) operations on a shared syscon reg=
map bypass atomicity guarantees.
- [Medium] Unchecked `regmap_read` calls in clock operations lead to uninit=
ialized stack memory being written to hardware registers.
- [Low] Unconditional assignment of `dev_pm_ops` to the platform driver cre=
ates dead code when PM is disabled.
--

commit 0916ea34519831a84e69fe5dc0d82f878c51aef8
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

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
> @@ -0,0 +1,1175 @@
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: Medium]
Since devtype_data->reg_save points to this statically defined sky1_reg_save
array, won't multiple instances of this device concurrently overwrite each
other's saved register states during runtime suspend?

Should the register save array be allocated per-instance in
sky1_audss_clks_priv instead?

[ ... ]
> +static const struct composite_clk_cfg sky1_audss_clks[] =3D {
> +	/* dsp */
> +	CFG(CLK_DSP_CLK,
> +	    "audss_dsp_clk",
> +	    dsp_clk_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_HIFI0, 0, 0,
> +	    0),

[Severity: High]
Seventeen distinct clocks (from CLK_DSP_CLK through CLK_I2S9_APB) are defin=
ed
with the exact same divider offset (INFO_CLK_DIV), shift (0), and width (2).

Won't changing the rate of one clock silently overwrite the physical divider
for the other 16 clocks without updating their cached rates in the clock co=
re?

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
> +		reg &=3D ~(mux->mask << mux->shift);
> +	}
> +	val =3D val << mux->shift;
> +	reg |=3D val;
> +	regmap_write(sky1_mux->regmap, sky1_mux->offset, reg);

[Severity: Medium]
Since the regmap is obtained via syscon_node_to_regmap(), it may be shared
with other drivers.

Does relying on the local priv->lock to protect discrete regmap_read() and
regmap_write() calls leave a race condition against other syscon users?

Should regmap_update_bits() be used instead to ensure atomicity?

Also, if the regmap_read() call fails, reg remains uninitialized. Does this
result in writing raw stack memory back to the hardware register via the
subsequent regmap_write()?

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
> +
> +		if (set)
> +			reg |=3D BIT(gate->bit_idx);
> +		else
> +			reg &=3D ~BIT(gate->bit_idx);
> +	}
> +
> +	regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);

[Severity: Medium]
If the regmap_read() call fails here, reg remains uninitialized.

Could this write uninitialized stack memory back to the hardware register?

[ ... ]
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D sky1_audss_clks_set_rate(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to set clocks rate\n");
> +		goto fail_clks_set;
> +	}
> +
> +	/* assert reset */
> +	reset_control_assert(rst_noc);

[Severity: High]
If sky1_audss_clks_set_rate() fails, the code jumps to fail_clks_set and
calls pm_runtime_put_sync(), which invokes sky1_audss_clk_runtime_suspend().

Since reset_control_deassert(rst_noc) has not yet been executed, doesn't th=
is
attempt to read registers from a subsystem still held in reset, potentially
causing a system bus hang?

[ ... ]
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv->c=
lk_data);

[Severity: High]
The OF clock provider is registered using devm_of_clk_add_hw_provider(),
meaning its cleanup happens during the devres phase, after
sky1_audss_clk_remove() returns.

By manually freeing the composite clocks in sky1_audss_clk_remove() with
clk_hw_unregister_composite(), is there a window where the OF provider is
still globally active but the internal clk_hw pointers have already been
freed, leading to a use-after-free if a consumer probes during this time?

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
If the kernel is built with CONFIG_PM=3Dn, these runtime PM calls become
no-ops, which means the runtime suspend callback is never invoked.

Does this permanently leak the parent clocks explicitly enabled earlier in
probe?

Should the clocks be manually disabled in the error path and remove functio=
n?

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
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);

[Severity: Medium]
If CONFIG_PM is disabled, pm_runtime_force_suspend() is a no-op.

Could this leave parent clocks enabled during device removal?

> +
> +	pm_runtime_disable(dev);
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
This register read can happen when the device is still in reset if the
probe function fails at sky1_audss_clks_set_rate().

Can this trigger a system bus hang?

[Severity: Medium]
This also writes to devtype_data->reg_save[i][1] which points to the global
sky1_reg_save array.

Does this corrupt the saved state if multiple instances of this driver are
active?

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
Should this be wrapped with pm_ptr() to avoid leaving dead code when CONFIG=
_PM
is disabled?

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610075645.3581=
145-1-joakim.zhang@cixtech.com?part=3D4
