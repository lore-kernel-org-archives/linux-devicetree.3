Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E633F9278
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599780; cv=none; b=eax1MseTgrcEdSlNq2OAivat0JCL+HmegsiNUUVRlO/dPlgUUGXzRLXAv6KUG9C+OqvA9LEWpKZCUSwvNe1DtJymC2jYcvfFO8nrnFmocdw8JDD4dQuQdkj+CNwmZ7js01Ihpis0HX+ylEZX8ZqvzkfCjHNxr7rBiWmywJ1NhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599780; c=relaxed/simple;
	bh=gqOzJqnooGsF4KvhGJJ7ORkvaSb4QcnTVwHIcUu+xe4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mtXC8FeooGIKm9DySH5jWLhHC39sWB8lO/3DMMXTqzAPR1TFOVK2A78Eai+lirkp6bv0I0qCNfWiul+rktcYRixJs1QuhN9pStB/TbwjKwwuEScctfm9B/3D/GpCZYKKOQ9bSpdtjp0RTLEI8bG86hTwpZWG+P8NPOl5OPL+dAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV0GZxSX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV0GZxSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEFD1F000E9;
	Thu,  9 Jul 2026 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599779;
	bh=oRA0IcSvGbo54keQ+KRAhvTR+y2B9B9UThZ8y1kAttU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fV0GZxSXXGzqkZrbk84SumeCwM4wGAqPuhQFH/FUA3+mUSyVNkZUPC5Afsy+RaP3x
	 +Qg7iBzjtXI+81SXyaHFaBOY95F7fZ4c8aMRa3c6e0eOvA5lxCKYkr1pSUTiPDZj1o
	 WQ6tOOdAtcYmb++KcgNlFfl6L+BQ+Gy+gdmiYvzU4bOdEyWRywkz8nSIfJHQFGEAwg
	 PUiNBqQxcY/aPGl3Wl0gTqI7p1S3M17MdR6NH83IzragD4oY8bgEjWhji1Zm/WULJe
	 KSxgGtJj/h0M4yEZRD7ivKxA9cTJfDaGx9VWaumh6XCD3mdubI9VecQxAOVEvFoBZg
	 Vod9L46Q2IO8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709120125.3997078-3-joakim.zhang@cixtech.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:22:58 +0000
Message-Id: <20260709122258.CAEFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The error handling paths in `sky1_audss_clk_probe` double-decremen=
t the PM runtime usage counter.
- [High] Device-specific suspend and resume state is incorrectly saved into=
 a mutable global static array.
- [High] Clock operations (`.set_rate` and `.set_parent`) access hardware r=
egisters without ensuring the provider device is active, and their writes a=
re blindly clobbered on resume.
- [High] Hardware is suspended and PM runtime disabled before `devm`-manage=
d child devices and interfaces are unregistered.
- [Medium] Probe error paths improperly bypass reset assertion and rely sol=
ely on runtime PM for cleanup, causing resource leaks.
- [Medium] Unchecked `regmap_read` return values lead to the use of uniniti=
alized stack variables.
- [Medium] During runtime resume, clock gates are ungated before clock divi=
ders and muxes are configured.
--

--- Patch [2]: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller ---
commit 3d18b0af56a4158655e0330ed09981d99ba1869a
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: clk: cix: add sky1 audss clock controller

Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
the CRU registers and registers mux, divider and gate clocks for
DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
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
Will this global static array cause data corruption if the system
instantiates multiple instances of the audio subsystem clock controller?

If sky1_audss_clk_runtime_suspend() reads hardware registers and writes
their values directly into this shared global array, one instance could
overwrite the saved PM context of another. Should register context arrays
be dynamically allocated within the per-instance sky1_audss_clks_priv
structure instead?

[Severity: Medium]
Could restoring the gate register before the mux and divider registers
cause out-of-spec clock glitches?

Since sky1_audss_clk_runtime_resume() restores registers strictly following
the sequence in this array, active clocks might be ungated while their
corresponding muxes and dividers are still at their post-reset default
states. Should MUX and DIV configuration registers be restored before
GATE output controls?

[ ... ]

> +static u8 sky1_audss_clk_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_mux *mux =3D to_clk_mux(hw);
> +	struct sky1_clk_mux *sky1_mux =3D to_sky1_clk_mux(mux);
> +	u32 val;
> +
> +	regmap_read(sky1_mux->regmap, sky1_mux->offset, &val);
> +	val =3D val >> mux->shift;
> +	val &=3D mux->mask;

[Severity: Medium]
Is it possible for val to remain uninitialized if regmap_read() fails?

If the underlying MMIO read fails, the uninitialized stack variable is
immediately used in bitwise shifts to index the parent clock array, which
might lead to unpredictable clock framework behavior or out-of-bounds array
access. Should the return value of regmap_read() be checked?

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

[Severity: High]
Does this write safely reach the hardware, and does the new state survive a
suspend/resume cycle?

The Common Clock Framework can call operations like set_rate or set_parent
on an unprepared clock. Since the controller might be in RPM_SUSPENDED,
this could lead to unclocked register accesses that hang the bus.

Additionally, since sky1_audss_clk_runtime_resume() unconditionally
restores all registers from the stale reg_save array captured during the
last suspend, won't any new rate or parent state written here be
permanently lost on resume? Should these ops call pm_runtime_resume_and_get=
()
and update the cached state?

[ ... ]

> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		goto err_pm;
> +	}

[Severity: Medium]
Does jumping to err_pm bypass reset assertion and potentially leak resource=
s?

The driver deasserts priv->rst_noc before calling sky1_audss_clks_enable().
If sky1_audss_clks_enable() fails, it jumps to err_pm, which bypasses
pm_runtime_put_sync(). This leaves the NOC reset deasserted.=20

Furthermore, if CONFIG_PM is disabled, relying entirely on
pm_runtime_put_sync() to clean up clocks and resets means the suspend
callback won't execute, leaving parent clocks permanently enabled.

[ ... ]

> +fail_register:
> +fail_fixed_clk:
> +fail_clks_set:
> +	pm_runtime_put_sync(dev);
> +err_pm:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	return ret;
> +}

[Severity: High]
Will this fallthrough cause the PM runtime usage counter to double-decremen=
t?

The PM runtime usage counter is incremented exactly once via
pm_runtime_get_noresume() earlier in probe. If the code jumps to
fail_clks_set, it explicitly calls pm_runtime_put_sync(). Execution then
directly falls through to the err_pm label, which executes
pm_runtime_put_noidle(). Could this underflow the PM usage counter and
corrupt the device's PM state machine?

> +static void sky1_audss_clk_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);
> +}

[Severity: High]
Is it safe to force suspend and disable PM runtime before devm-managed child
devices and interfaces are unregistered?

The driver uses devm_ interfaces to register CCF clocks and the auxiliary
reset device. These are automatically unregistered in the devres cleanup
phase, which executes after sky1_audss_clk_remove() fully returns.

During the window between remove() completing and devres executing, the clo=
ck
and reset interfaces remain exposed to consumers. If a consumer accesses th=
em,
could it trigger a fault because the underlying hardware controller is alre=
ady
suspended and disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709120125.3997=
078-1-joakim.zhang@cixtech.com?part=3D2
