Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577AB199D8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630553; cv=none; b=GFdMoSGcqRGDDAHYB59Z51isqGgRaXVy3XS8vcbXpXSimiWNcl5zYhDydRoamoNHpOaebD9d3FVrXwQLtrGgc90z9PUwhf2PyUvAM1VrBS+1saNMP0VQzGa2sX/kDAYKELnZ8gL+tbFQdlTl8UYG0CAhXtxyCxoNMxZlJq0iIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630553; c=relaxed/simple;
	bh=ytYhz18CTICnR1zudglnJdwvu1coRcdGtZiOGTQndzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xptcz2vdkLBgFiJBRdkOhnpsU+jYc/ai4wvd75J3qz1qUQBRl2ciOJySTQrueHBzxBaUZ9kFXGisyaWOa8w3sonic5QH6LSsx1ud5KdUPjU6Ya49TphTRl7L2xoh/gj6J8b8aI3+b+rAqGtdrpSF/Dy2o3CssR6wL8Ajwr6HacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxERWiLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxERWiLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AA61F00893;
	Fri,  5 Jun 2026 03:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780630551;
	bh=SV1xtkRZNojTJr4YLzM0n0erY8tYItsQ9LqhgghqBd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxERWiLGCh9fsd1sWXNayONDJcqXa4bZyvki328NtSeN7pJvvBgovLpTyPGqPWHkl
	 bNC7HYeeFrlQxKQr/JBmdJHlAk9L4Srk4KCxNrAMQ8QTvhoOoBIlhLzlR5Y4QLb3cq
	 B+/CQnp7G9atqYOE4YeUzP0w7wS+2cx2RpQThGn6YlmZjHybSlSl/ajkzaZhTqKpyX
	 N/y3b356nZ7NrTRYs16LAh+4bmCbqQcHhE8BF4ZRDQMsVxjS23rMsb/Ac+xdbfp9h/
	 2toekI+AmeEH9XVxH1O9rIoBZNNk+V0Gcho4+Lx5LpXkc+14B8z2n94G6OLNu897LJ
	 33XkIIfMgRaVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605032225.523669-5-joakim.zhang@cixtech.com>
References: <20260605032225.523669-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 03:35:51 +0000
Message-Id: <20260605033551.B5AA61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Clock operations access hardware registers without ensuring th=
e provider device is active, bypassing runtime PM and risking a system hang.
- [High] The driver saves per-device register state during runtime suspend =
into a statically allocated global array, causing state corruption.
- [High] The driver incorrectly uses local consumer connection IDs as globa=
l parent clock names, leading to orphaned clocks.
- [High] Multiple independent logical clocks erroneously share the exact sa=
me hardware registers and bitfields.
- [High] Manual unregistration of composite clocks in `remove()` happens be=
fore devres unregisters the clock provider, creating a use-after-free windo=
w.
- [High] The driver fails to check the return value of regmap_read(), leadi=
ng to uninitialized stack memory being used and written back to hardware.
- [High] Runtime resume blindly restores state from the last suspend, clobb=
ering new hardware configurations made by consumers while the device was su=
spended.
- [Medium] Parent clock reference counts are leaked on probe failure and de=
vice removal if CONFIG_PM is disabled.
- [Low] The dev_pm_ops structure is unconditionally assigned without pm_ptr=
(), causing dead code when CONFIG_PM is disabled.
--

commit bd7592e22099bbbeb5887d53d78492299c85c8a8
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

This patch adds a platform driver for the Cix Sky1 Audio Subsystem (AUDSS)
internal clock controller. It registers mux, divider, and gate composite cl=
ocks
for various audio components and brings up six SoC-level audio reference
clocks.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..899452d5ed144
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1129 @@
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: High]
Does this global array get overwritten by multiple instances of the driver?

During runtime suspend, the driver reads dynamic register values into
devtype_data->reg_save, which points to this statically allocated array. Th=
is
could mutate constant match data and corrupt state across multiple device
instances if more than one exists.

[ ... ]
> +static const char * const dsp_clk_parent[] =3D {
> +	"audio_clk4"
> +};

[Severity: High]
Will these clocks become orphaned?

The driver retrieves input clocks via devm_clk_get() using local connection
IDs like audio_clk4, but passes these string literals as parent_names to CCF
registration functions. Since CCF matches parent_names against the global
provider clock name, this might fail to find the parent. Should the driver
use parent_data with .fw_name instead?

[ ... ]
> +	/* dsp */
> +	CFG(CLK_DSP_CLK,
> +	    "audss_dsp_clk",
> +	    dsp_clk_parent,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_HIFI0, 0, 0,
> +	    0),
[ ... ]
> +	/* i2s */
> +	CFG(CLK_I2S0_APB,
> +	    "audss_i2s0_apb",
> +	    i2s_apb_parent,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_CLK_GATE, 0, 0,
> +	    0),

[Severity: High]
Is it intentional that multiple independent clocks share the exact same
INFO_CLK_DIV register offset, shift 0, and width 2?

If one clock's rate is modified, it will physically clobber the shared divi=
der
bits without updating the internal CCF state for the other clocks (like
CLK_DSP_CLK and CLK_I2S0_APB through CLK_I2S9_APB), which could lead to
widespread clock rate corruption.

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

[Severity: High]
Can reg remain uninitialized here?

If regmap_read() fails and returns an error code, the reg stack variable wi=
ll
contain uninitialized memory, which is then used in bitwise operations and
written back to the hardware via regmap_write(). Should the return value
of regmap_read() be checked?

> +	}
> +	val =3D val << mux->shift;
> +	reg |=3D val;
> +	regmap_write(sky1_mux->regmap, sky1_mux->offset, reg);
[ ... ]
> +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_divider *divider =3D to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider);
> +	int value;
> +	unsigned long flags =3D 0;
> +	u32 val;
> +
> +	value =3D divider_get_val(rate, parent_rate, divider->table,
> +				divider->width, divider->flags);
> +	if (value < 0)
> +		return value;
> +
> +	if (divider->lock)
> +		spin_lock_irqsave(divider->lock, flags);
> +	else
> +		__acquire(divider->lock);
> +
> +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> +		val =3D clk_div_mask(divider->width) << (divider->shift + 16);
> +	} else {
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val &=3D ~(clk_div_mask(divider->width) << divider->shift);
> +	}
> +	val |=3D (u32)value << divider->shift;
> +	regmap_write(sky1_div->regmap, sky1_div->offset, val);

[Severity: Critical]
Does this write to the hardware while the device might be runtime suspended?

CCF allows operations like clk_set_rate to execute on unprepared clocks wit=
hout
automatically waking the provider device. If pm_runtime_get_sync() is not
called before regmap_write(), accessing registers while the parent clocks a=
re
cut in sky1_audss_clk_runtime_suspend() could trigger a synchronous external
abort and hang the system.

> +
> +	if (divider->lock)
> +		spin_unlock_irqrestore(divider->lock, flags);
> +	else
> +		__release(divider->lock);
> +
> +	return 0;
> +}
[ ... ]
> +	/* audio_clk4 clock fixed divider */
> +	clk_table[CLK_AUD_CLK4_DIV2] =3D
> +		devm_clk_hw_register_fixed_factor(dev,
> +						  "audio_clk4_div2",
> +						  "audio_clk4",
> +						  0,
> +						  1, 2);

[Severity: High]
This again uses the local connection name audio_clk4 as the parent_name for
the fixed factor clock. Is this expected to match the upstream provider's
global clock name?

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
If CONFIG_PM is disabled, will the parent clocks prepared and enabled in
sky1_audss_clks_enable() remain permanently enabled?

The error path relies on pm_runtime_put_sync() to disable parent clocks,
but without CONFIG_PM, this becomes a no-op, leading to leaked reference
counts.

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
Does unregistering the composite clocks here create a use-after-free window?

The driver registers the OF clock provider using devm_of_clk_add_hw_provide=
r()
which defers cleanup to the devres phase after remove() finishes. Since the
underlying clk_hw structures are explicitly freed here, the active OF clock
provider might return a dangling pointer if a consumer queries the clock
during this window.

> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);

[Severity: Medium]
Similar to the probe error path, if CONFIG_PM is disabled,
pm_runtime_force_suspend() does nothing. Won't this leak the parent clock
reference counts upon device removal since sky1_audss_clks_disable() is nev=
er
called?

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
This writes dynamic device state directly into devtype_data->reg_save, which
points to the global sky1_reg_save array. Should the state array be
dynamically allocated per-instance instead?

> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	sky1_audss_clks_disable(priv);
> +
> +	return 0;
> +}
> +
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
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(priv->rst_noc);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	for (i =3D 0; i < devtype_data->reg_save_size; i++)
> +		regmap_write(priv->regmap_cru,
> +			     devtype_data->reg_save[i][0], devtype_data->reg_save[i][1]);

[Severity: High]
Will this blindly clobber new hardware configurations made by consumers whi=
le
the device was suspended?

If a clock rate was changed via clk_set_rate during suspend, restoring all
register values from the statically saved array here will overwrite the
consumer's new configuration with stale values from the previous suspend cy=
cle.

> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops sky1_audss_clk_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
> +			   sky1_audss_clk_runtime_resume, NULL)
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				     pm_runtime_force_resume)
> +};
> +
> +static const struct sky1_audss_clks_devtype_data sky1_devtype_data =3D {
> +	.reg_save =3D sky1_reg_save,
> +	.reg_save_size =3D ARRAY_SIZE(sky1_reg_save),
> +	.clk_names =3D sky1_audss_clk_names,
> +	.clk_num =3D ARRAY_SIZE(sky1_audss_clk_names),
> +	.clk_rate_default =3D sky1_clk_rate_default,
> +	.clk_cfg =3D sky1_audss_clks,
> +	.clk_cfg_size =3D ARRAY_SIZE(sky1_audss_clks),
> +};
> +
> +static const struct of_device_id sky1_audss_clk_of_match[] =3D {
> +	{ .compatible =3D "cix,sky1-audss-clock", .data =3D &sky1_devtype_data,=
 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, sky1_audss_clk_of_match);
> +
> +static struct platform_driver sky1_audss_clk_driver =3D {
> +	.probe =3D sky1_audss_clk_probe,
> +	.remove =3D sky1_audss_clk_remove,
> +	.driver =3D {
> +		.name =3D "sky1-audss-clk",
> +		.suppress_bind_attrs =3D true,
> +		.of_match_table =3D sky1_audss_clk_of_match,
> +		.pm =3D &sky1_audss_clk_pm_ops,

[Severity: Low]
Should this assignment be wrapped with pm_ptr()?

Assigning the pointer unconditionally prevents the compiler from optimizing=
 out
the dev_pm_ops structure and its __maybe_unused callbacks when CONFIG_PM is
disabled, leaving dead code in the binary.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605032225.5236=
69-1-joakim.zhang@cixtech.com?part=3D4
