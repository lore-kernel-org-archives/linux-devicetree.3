Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DCE2D9EED
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727071; cv=none; b=OhNci1OPUJrq/WxxkusmjWZUendQRRzGTKnTK/Ed/sDkJDmBGWdGmV2eSOM6fRvCAUZnwmq+vzvVhimca9p6oyGe/mit91FzttP3Ru187NFODnBQRF0vTweQvdT8f43vXOhtoqdd0oP06Om+O+fvxM7Wfshn7uvGAWvvbfhTgB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727071; c=relaxed/simple;
	bh=jSLXKkizYU7nmM6KRinKGdZms+0ZGvjoH5J5ejUmG1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VfrqyKgoV1eObPHw0OJ8XRISMJ1Fj6iZPPb6OXsX4+F0qeeVifAkDHDKfhMSNrwzU273tFUBplcrRcni3omduZT9BA3aOVaO4IJQyjEdtHyFDQL2dkfpq3yBWfHpRosU4fQ73f81tFf/VWnjStqE56gz/6WgUGRs/pnRsr0/DGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHsTEi3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHsTEi3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124911F000E9;
	Wed, 22 Jul 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727069;
	bh=PdBMy1f8TxFnfPp/v2gFEhP4sNZj9PndeHnZ2/73qxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHsTEi3NpdVDckeU4qoOP87OaYjip3+Coasp1AeF9SgPu3CHTNypmwqXISsvnoVWM
	 fqsdtl5j21qrVekj7e14vneLjElN7wLUrzHmwIzpCk23KlfVZs3zJtyZxV61NGLGCK
	 q0KQS7Y2ittYc1g2jQGK7UOiivmoP0p+J4tzdtFJmqSOHNUCoFKpyRnRKNjzmomrsc
	 BFlqfJGJ5Yox2Goi/Me1DUHvCOsJNYGqN7pMHYjsF9HWloseuGnx+meCwiAGXfdap6
	 VqQ6DkJLO5fn8UVQqWjr8hYG8Mk2UEcHIh2U2jWho3i2rmBpPMOwOnf/nV0WQhWUYz
	 /K+2GUygdhf3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260721132936.1331318-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260721132936.1331318-1-niklas.soderlund+renesas@ragnatech.se>
 <20260721132936.1331318-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 13:31:08 +0000
Message-Id: <20260722133109.124911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing return value check for pm_runtime_get_sync() before MMIO a=
ccess.
- [Medium] Type mismatch and potential truncation in default_addend calcula=
tion.
- [Medium] Timekeeping precision loss during adjtime due to read-modify-wri=
te cycle.
- [Medium] Missing hardware disable in the ptp_clock_register() error path.
--

--- Patch [2]: [PATCH net-next v5 2/3] ptp: Add driver for R-Car Gen4 ---
commit 157f9604feea3029de3329fc9af614f925220b8a
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

ptp: Add driver for R-Car Gen4

This commit adds a driver for the gPTP timer found on R-Car Gen4 devices.
The timer is system-wide and shared by Ethernet devices, but it is gated by
different clocks depending on the specific SoC hardware.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..8072d5f2b72dd
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
> +}

[ ... ]

> +static int ptp_rcar_gen4_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{
> +	struct ptp_rcar_gen4_priv *priv =3D ptp_to_priv(ptp);
> +	struct timespec64 ts;
> +	unsigned long flags;
> +	s64 now;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	_ptp_rcar_gen4_gettime(ptp, &ts);
> +	now =3D ktime_to_ns(timespec64_to_ktime(ts));
> +	ts =3D ns_to_timespec64(now + delta);
> +	_ptp_rcar_gen4_settime(ptp, &ts);

[Severity: Medium]
Does this read-modify-write cycle introduce jitter and systematic time drif=
t?

Every time ptp_rcar_gen4_adjtime() is called, it halts the hardware timer
via PTPTMDC_REG in _ptp_rcar_gen4_settime().=20

Any time elapsed during this software execution and the fractional
sub-nanosecond progress currently stored in the hardware accumulator might =
be
permanently lost.

> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned long rate;

[ ... ]

> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] =3D perid[ns] * 2^27 =3D> (1ns * 2^27) / rate[hz]
> +	 */
> +
> +	priv->default_addend =3D div_s64(1000000000LL << 27, rate);

[Severity: Medium]
Could this calculation result in type truncation and overflow?

The div_s64() function expects an s32 divisor, but it is being passed an
unsigned long 'rate'. If the clock rate exceeds 2.14 GHz, it overflows
s32 and evaluates as negative.

Additionally, the 64-bit result is passed directly to the 32-bit iowrite32()
shortly after this. If the clock rate is below ~31.25 MHz, the result
would exceed 32 bits and silently truncate. Would it be safer to use
div64_ul() and validate the bounds before writing to the register?

> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);

[Severity: High]
Should the return value of pm_runtime_get_sync() be checked before proceedi=
ng
to access hardware?

If the device fails to power on or the clock fails to enable, ignoring the
negative error code and writing to PTPTIVC0_REG could cause an asynchronous
external abort, potentially leading to a kernel panic.

> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);

[Severity: Medium]
Is a hardware disable step missing in this error path?

If ptp_clock_register() fails, the driver cleans up the PM state but fails
to write the disable command to PTPTMDC_REG. The timer might be left running
indefinitely.

The normal driver removal path explicitly disables the timer before
suspending PM:

ptp_rcar_gen4_remove() {
    ...
    iowrite32(1, priv->base + PTPTMDC_REG);
    pm_runtime_put_sync(dev);
}

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721132936.1331=
318-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
