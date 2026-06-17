Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD35394EBD
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781677013; cv=none; b=UBXa5Ok+AeSVWPUlZoeVPzWwwLY8ZwO0Z0urLgNtIAXginSwTsUJ/PLDIrEAive/816lDiYuTbHRzf+71bQKJ4idSUCnlen3vJyUM4yMQyVAvkdsGcJB+Z31hLQ+JjH7+bPKfjrYoBpng7tjCnakmhkMZ46v08zvtKBjWk8zilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781677013; c=relaxed/simple;
	bh=mABn9uE32EgnjkzeYRrnKUWuzsbGZGezLguz6cYuW/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b4WMHsloIVetJy/FMhXwhj2vI7ocxn6u3PWcwc3GKPj+0+22mD/qUXoPiNFTCVnUJElXjb/4trlLH0wEESFetM8v3uaOidXMXs45zFalJStKFrOwoWvZEmhPqDKEGLzvvpnUDAGhjp/4ABVvuT/qCSGfFe8fIjK96YTnvhDOoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnhjg6dv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnhjg6dv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376F91F000E9;
	Wed, 17 Jun 2026 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781677011;
	bh=28Tx9gBPc+qN+++0eM1ovR+LqfMpCaUZtbOH1t9zhis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xnhjg6dvjgFLLqMgOH7yJiNM76sYVn6tbRolSzHf8rusXtUGSNJhn+3/TLKPGZFr7
	 s3xlIOOT34fxe2fuTP1Nb8p6wJJC7dw9DrdRbMn7afabi/fU9RVXQyg9cqv+naN1Hp
	 g2EH+COK71MnZIQTYh2im7/O3KcwNKB2wda6jDGUu97E4T/zAMd8ADL4K5oEw7wMJY
	 ndDI+STQrS4r0foMbabbBw3bwMnh7tw+dg/N+P75MG7tbQfPeFxKodGq7xh8cjdhfl
	 T31bQNQfgrKd91ABQUNFJ1Eo5CkODMd6lkC9kpVM+p9WHdA7PNNnKve7yqDe6xBoxb
	 Tcwl1ZGNRNKeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617060437.1474816-5-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 06:16:50 +0000
Message-Id: <20260617061651.376F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Use-after-free race during device removal because composite clocks=
 are unregistered manually before the devres-managed OF clock provider is u=
nregistered.
- [High] Multiple independent clocks erroneously share the exact same hardw=
are gate bits, causing Common Clock Framework (CCF) state corruption.
- [High] Calling `pm_runtime_force_suspend()` before `pm_runtime_disable()`=
 in `remove()` creates a concurrency race condition.
- [Medium] Parent clock enables are permanently leaked in the probe error p=
ath and on device removal if `CONFIG_PM` is disabled.
- [Medium] Missing `pm_ptr()` wrapper for `dev_pm_ops` pointer causes dead =
code when `CONFIG_PM` is disabled.
- [Medium] Device register states are saved into a global static array duri=
ng runtime suspend, causing an anti-pattern and potential data races.
--

commit ba255415d22d68eb57522fe8fe2cfadbf4ba75d6
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

Add a platform driver for the Cix Sky1 Audio Subsystem (AUDSS) internal
clock controller.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..c1e7dfe45d12c
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1167 @@
[ ... ]
> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: Medium]
Is it safe to save device register states into a global static array during
runtime suspend? If multiple instances of this driver or SoC ever exist in a
system, wouldn't they overwrite each other's suspended states? Could this
state be allocated dynamically within the per-device priv structure instead?

[ ... ]
> +	/* wdg */
> +	CFG(CLK_WDG_APB,
> +	    "audss_wdg_apb",
> +	    wdg_apb_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_GATE, 10, 0,
> +	    0),
> +	CFG(CLK_WDG_WDG,
> +	    "audss_wdg_wdg",
> +	    wdg_wdg_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_GATE, 10, 0,
> +	    0),

[Severity: High]
Does defining two distinct clocks that map to the exact same gate bit
(shift 10) cause Common Clock Framework state corruption? Since CCF tracks
their states separately, if a driver disables CLK_WDG_APB, wouldn't it
silently turn off the physical clock for CLK_WDG_WDG as well? Should shared
gates be modeled as a single gate clock with multiple children?

> +	/* timer */
> +	CFG(CLK_TIMER_APB,
> +	    "audss_timer_apb",
> +	    timer_apb_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_DIV, 0, 2, 0,
> +	    INFO_CLK_GATE, 11, 0,
> +	    0),
> +	CFG(CLK_TIMER_TIMER,
> +	    "audss_timer_timer",
> +	    timer_timer_parent,
> +	    NULL,
> +	    -1, 0, 0, 0,
> +	    -1, 0, 0, 0,
> +	    INFO_CLK_GATE, 11, 0,
> +	    0),

[Severity: High]
Similarly, does having CLK_TIMER_APB and CLK_TIMER_TIMER share gate shift 11
cause the same CCF state tracking issues?

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

[Severity: High]
Does using devm_of_clk_add_hw_provider() here create a use-after-free race
condition during device removal?

Since devres defers unregistration until after the remove function complete=
s,
but sky1_audss_clk_remove() manually destroys the composite clocks, will a
concurrent clk_get() return a dangling pointer while the OF provider is sti=
ll
active?

> +fail_array_clk:
> +	while (i--)
> +		clk_hw_unregister_composite(clk_table[devtype_data->clk_cfg[i].id]);
> +fail_fixed_clk:
> +fail_clks_set:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);

[Severity: Medium]
Will the parent clock enables be permanently leaked here if CONFIG_PM is
disabled?

The explicit sky1_audss_clks_enable() called earlier delegates teardown to
runtime PM wrappers like pm_runtime_put_sync(). If CONFIG_PM=3Dn, these wra=
ppers
are no-ops. Does the driver need explicit clock disablement when runtime PM
is unavailable?

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
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);

[Severity: High]
Does calling pm_runtime_force_suspend() before pm_runtime_disable() create a
concurrency race condition?

pm_runtime_force_suspend() temporarily re-enables runtime PM before returni=
ng,
which opens a window where a concurrent operation could trigger a runtime
resume. Would it be safer to call pm_runtime_disable() first to ensure the
device stays suspended?

[Severity: Medium]
Also, similar to the probe error path, does delegating hardware disablement=
 to
pm_runtime_force_suspend() leak the parent clocks on removal if CONFIG_PM is
disabled?

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

[Severity: Medium]
Does writing to devtype_data->reg_save[i][1] mutate the statically allocated
global array sky1_reg_save from a per-device suspend handler? Could this le=
ad
to data corruption if there are multiple devices, and shouldn't we write to
dynamically allocated per-device state instead?

[ ... ]
> +static struct platform_driver sky1_audss_clk_driver =3D {
> +	.probe =3D sky1_audss_clk_probe,
> +	.remove =3D sky1_audss_clk_remove,
> +	.driver =3D {
> +		.name =3D "sky1-audss-clk",
> +		.suppress_bind_attrs =3D true,
> +		.of_match_table =3D sky1_audss_clk_of_match,
> +		.pm =3D &sky1_audss_clk_pm_ops,

[Severity: Medium]
Will this unconditional assignment to .pm produce dead code when CONFIG_PM
is disabled? Should it be wrapped with pm_ptr(&sky1_audss_clk_pm_ops) to
allow the compiler to optimize out the unused structures?

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617060437.1474=
816-1-joakim.zhang@cixtech.com?part=3D4
