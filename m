Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A97404E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525615; cv=none; b=XnMtEdZcPALQLv/0j+rnd+QmkA+1zQIWEM6fU5w2Ide5kOTBTfligmk1ELqM3qFCMLZliUNlKYVMcnqqrNDsE09yjbVuWhQpbTqb+wFIVS3JfbGoaABzrShd63p7nZfmRmWc++QM84xEGKL+WDtmlbBOJC2LwJiyu2amvv9PMQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525615; c=relaxed/simple;
	bh=JJGCVEw/coCLtlDRpJuKb1MNV2lZDTXpa91/5SJApYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ax2oqFTeSmnN1k5w3sFmNi1wFQqMBJ37Buc06XcT8icgfjdm4MhTOMsTCZI8HeV1ZgVJunpuKmexCg6ANe/9m2Uz7a2oNVBdRNP8qSkOQiDWc3t6/xZFsHckN8TXeaZFEWqEuqKsNyYoOXxdRhS1ujEZjRTAv6yBqWiFdmH7MfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmXLmRr3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmXLmRr3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26781F000E9;
	Mon, 20 Jul 2026 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784525614;
	bh=R3/9sqXazvsnXxiZH+itc4NIgujSl3RxSMfXzAUn+nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmXLmRr3K23NLBLAGPx6r8x7F49eEldaLWfndTiTbmb9DltB0Y37KBdZ3Pd4IfMvi
	 AsdkyqbJIqilPl9URnf90Mn+wxfXvA5HV6K1aL0Kfq/WvuZVOYmaer0y6Q+4ngy/pv
	 NKqc42kvFJnXGH+RP6ZYKGRcrTzKSxHHsquGgWH3mErZ8KEJ/5ff1GgrENBavHGUBu
	 rUhoWd0DmIYvzEJov5MEDPK+zV2M4EhFh6NpdQ0K1lww2CLzQFDOiIAlefoMaXC92C
	 T4jC5O4uJFtROrZSPPEts4gnXlRtAWJziQ2PQfYldzFQhsMEwc9j5S+BpNrnYQPtxD
	 yfDY3i7DcynFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720051505.1252774-3-joakim.zhang@cixtech.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 05:33:33 +0000
Message-Id: <20260720053333.E26781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Clock operations access MMIO registers without ensuring the device=
 is runtime-resumed, leading to bus faults or synchronous external aborts.
- [High] The driver saves device-specific hardware register context into a =
globally shared static array during runtime suspend, corrupting state for m=
ultiple instances.
- [High] Unbalanced runtime PM disable depth causes PM to permanently break=
 after driver unbind and rebind.
- [High] Incorrect modeling of shared hardware gates and dividers as indepe=
ndent composite clocks.
- [Medium] Runtime PM usage counter is permanently leaked if `devm_add_acti=
on_or_reset` fails during probe.
- [Medium] Missing clock disable and reset assert on probe failure or unbin=
d when CONFIG_PM is disabled.
- [Medium] Missing mux tables for I2S clocks causes incorrect hardware mux =
selection.
--

--- Patch [2]: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller ---
commit c9de82467e7defa872d02a168dbab2226c7260e8
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: clk: cix: add sky1 audss clock controller

Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
the CRU registers and registers mux, divider and gate clocks for
DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.

> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..23095217b7c24
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1211 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright 2026 Cix Technology Group Co., Ltd.

[ ... ]

> +static u32 sky1_reg_save[][2] =3D {
> +	{ INFO_HIFI0,  0 },
> +	{ INFO_CLK_GATE,  0 },
> +	{ INFO_CLK_DIV, 0 },
> +	{ INFO_CLK_MUX, 0 },
> +	{ INFO_MCLK, 0 },
> +};

[Severity: High]
Can this cause data corruption if multiple instances of this driver are bou=
nd?

The array is statically allocated and globally shared, but the
sky1_audss_clk_runtime_suspend() callback writes device-specific register
state directly into it. If two instances suspend, won't they overwrite each
other's saved state?

[ ... ]

> +static const struct composite_clk_cfg sky1_audss_clks[] =3D {
> +	/* dsp */
> +	CFG(CLK_DSP_CLK,

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
Will this lead to clock state desynchronization?

It looks like CLK_HDA_SYS and CLK_HDA_HDA are modeled as independent clocks
in CCF but share the exact same hardware gate bit (14). Furthermore, 17
different clocks in this array share the exact same hardware divider bits
(INFO_CLK_DIV, shift 0, width 2).

If CCF manages these independently, won't disabling one clock silently
clear the hardware gate for all others sharing it, breaking active
consumers?

[ ... ]

> +	CFG(CLK_I2S0,
> +	    "audss_i2s0",
> +	    i2s0_parents,
> +	    NULL,
> +	    INFO_CLK_MUX, 0, 2, 0,
> +	    INFO_CLK_DIV, 2, 2, 0,
> +	    INFO_CLK_GATE, 0, 0,
> +	    0),

[Severity: Medium]
Will this cause incorrect hardware mux selection for the I2S clocks?

CLK_I2S3 and CLK_I2S4 correctly use a mux table (i2s3_mux_table) to map the
second parent (audio_clk2) to hardware value 2. However, the other eight
I2S clocks pass NULL for their mux tables.

If CCF defaults to writing the 1-based index (value 1) instead of 2 for
these clocks, won't this result in an invalid or unintended clock selection?

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

[Severity: High]
Could this trigger a synchronous external abort (bus fault) if the device is
runtime suspended?

The driver exports atomic clock operations (such as recalc_rate and
is_enabled) that directly read and write MMIO registers using regmap.
Because the device is allowed to runtime suspend, which asserts the NOC res=
et
and disables base clocks, won't any MMIO access during this state cause a
fault?

Userspace reading /sys/kernel/debug/clk/clk_summary could potentially
trigger this. Do we need to ensure the device is runtime-resumed before
accessing these registers?

[ ... ]

> +static void sky1_audss_clk_rpm_cleanup(void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);
> +}

[Severity: Medium]
Will hardware clocks remain enabled and reset deasserted forever if the
driver is unbound on a system with CONFIG_PM disabled?

pm_runtime_force_suspend() expands to a no-op when CONFIG_PM is disabled,
which means the sky1_audss_clk_runtime_suspend() callback won't execute to
revert the initialization done in probe.

[Severity: High]
Does this also cause an unbalanced runtime PM disable depth?

pm_runtime_force_suspend() already calls pm_runtime_disable() internally
to preserve state. By calling pm_runtime_disable(dev) again immediately
after, the disable depth is incremented twice.

If the driver is unbound and rebound, probe() will only decrement it once,
leaving disable_depth > 0. Won't this permanently break power management
for this device?

[ ... ]

> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data;

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
Does this leak the runtime PM usage counter if devm_add_action_or_reset()
fails?

The usage counter is incremented by pm_runtime_get_noresume(), but if we
return directly on failure here, it doesn't look like the cleanup action
runs or decrements it. Does this permanently prevent the device from
suspending if it is later bound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720051505.1252=
774-1-joakim.zhang@cixtech.com?part=3D2
