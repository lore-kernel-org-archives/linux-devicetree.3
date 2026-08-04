Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047254334B8
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837194; cv=none; b=O/eSY7bUsQQ+dZbXTflgWy6njinKPGRcmQ5pl0akDMF4t0+/eda0SJP5j/pafJ4XbqOhxK67LbYeqMxxe5rsVJNoooOVOAzeB6E/C0Q3cJpYcPpjlceLu5TynIHR0QfK1MkalZQ+HmaJXvLcrQJJzp26Dn1xLFrCTJpdCnY5QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837194; c=relaxed/simple;
	bh=0s57jUWu/NI+JDGaDXuqId3jxqord0KpxWswnDpRd8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwXOeK0TTsHEBvTQiedHd0FFipZz2CGPq5DBo6zbBlGXdZ+8WI2f0rKRlDttyp7/QUt6DGxviDGIWRgYg9Gu6EVJ2KxMTx3wrOLgw6bZuvYG/P4TA9qOwNf92Rl35JDLHD6ScVgXBa7Cd3T0gLSbCX+yRcvFwifAmgcShp49r90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojmp0S9+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojmp0S9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EE91F00ACA;
	Tue,  4 Aug 2026 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785837188;
	bh=Muef/F+vQoDDsYffQXdOgI4kKAX1vSayCOnhr6rt+Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ojmp0S9+1x/r2OzSgC4Wi7OAcfe681gZeyGE6L8kNCs3kEp1FIXV/jF7n1oJ6Mm/7
	 5mQGG1n0f7v4ttFZ+PR5/JKgcrgT2OiSAxQWY+Xk4pKL1U5EzLgqv77Q2dpAOqoYBW
	 huxbl5JC13aEqm5fxndyGgXh6lCM9lmhdPfF/U1aelRhTO15tyA7enVHtb80JKxN8+
	 lXP9F++X4LjuOja0WVparYxWQhUzS6wL8D2FC0WDZdnF4CHltCO9PYSe/ZptoTuLfI
	 q2+kAw1pTZhWkZP9hmVhAZxljmgboXkOlASDcnK9zhBGGAf0m9j1W97bFOiD2GTD1r
	 7/zCFEjikZIoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803095232.3527111-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260803095232.3527111-1-niklas.soderlund+renesas@ragnatech.se>
 <20260803095232.3527111-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 09:53:07 +0000
Message-Id: <20260804095308.67EE91F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver ignores the return value of `pm_runtime_resume_and_get(=
)`, risking unpowered hardware accesses and unbalanced PM usage counters.
- [High] The `_ptp_rcar_gen4_settime()` function briefly configures the sha=
red timer with 0 offsets while it is enabled, exposing erroneous timestamps=
 to all sharing Ethernet devices.
- [Medium] The hardware timer is left enabled and running if `ptp_clock_reg=
ister()` fails during probe.
- [Medium] Passing an `unsigned long` clock rate to `div_s64()` can cause a=
 sign truncation bug if the clock rate is sufficiently high.
--

--- Patch [2]: [PATCH net-next v6 2/3] ptp: Add driver for R-Car Gen4 ---
commit 447a3dd2732c6247d6f684bcaa7abcce33006d04
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

ptp: Add driver for R-Car Gen4

Add driver for the gPTP timer found on R-Car Gen4 devices. The timer is
system-wide and shared by different Ethernet devices on each Gen4
platform.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..e82b6c5abc306
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c

[ ... ]

> +static void _ptp_rcar_gen4_settime(struct ptp_clock_info *ptp,
> +				   const struct timespec64 *ts)
> +{
> +	struct ptp_rcar_gen4_priv *priv =3D ptp_to_priv(ptp);
> +
> +	lockdep_assert_held(&priv->lock);
> +
> +	iowrite32(1, priv->base + PTPTMDC_REG);
> +	iowrite32(0, priv->base + PTPTOVC20_REG);
> +	iowrite32(0, priv->base + PTPTOVC10_REG);
> +	iowrite32(0, priv->base + PTPTOVC00_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +	iowrite32(ts->tv_sec >> 32, priv->base + PTPTOVC20_REG);
> +	iowrite32(ts->tv_sec, priv->base + PTPTOVC10_REG);
> +	iowrite32(ts->tv_nsec, priv->base + PTPTOVC00_REG);

[Severity: High]
Could this expose a window where the hardware runs with zeroed offsets?

The timer is enabled by writing to PTPTMEC_REG before the actual time offse=
ts
are written to the PTPTOVC* registers. Since this timer is shared across the
system, could this brief window result in bogus timestamps being generated =
for
connected Ethernet devices?

Should the timer be enabled after the new offsets are written?

> +}

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] =3D perid[ns] * 2^27 =3D> (1ns * 2^27) / rate[hz]
> +	 */
> +
> +	priv->default_addend =3D div_s64(1000000000LL << 27, rate);

[Severity: Medium]
Is it safe to pass the unsigned long rate to div_s64()?

Since div_s64() expects an s32 divisor, could this cause a sign truncation
regression if the clock rate exceeds INT_MAX (2.147 GHz), resulting in a
negative default_addend calculation?

Should this use div64_ul() or div_u64() instead to prevent unintended
truncation?

> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_resume_and_get(dev);

[Severity: High]
Is it safe to ignore the return value of pm_runtime_resume_and_get()?

If the device fails to power on and returns a negative error code, the driv=
er
proceeds to access hardware via the iowrite32() calls below, which could le=
ad
to an asynchronous external abort and system crash on ARM platforms.

Additionally, if it fails, the usage counter isn't incremented. Would the
unconditional pm_runtime_put_sync() calls in the error path below and in
ptp_rcar_gen4_remove() cause a PM usage counter underflow?

> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);
> +	}

[Severity: Medium]
If ptp_clock_register() fails, does this error path leave the hardware timer
running?

The timer is started just above this check by writing to PTPTMEC_REG, but
unlike ptp_rcar_gen4_remove(), this path doesn't write to PTPTMDC_REG to
disable it. Could this leak hardware resources and prevent the PM domain fr=
om
cleanly suspending?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803095232.3527=
111-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
