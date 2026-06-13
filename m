Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5B3368AB
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342964; cv=none; b=FE/aLH8sUji5K32v6Uel28QgiaUD9RWs2Ctu7PAMkALl24sQTDCk49NuotAAp/kio9HK5cwOVCviPpwpodkdZd6V6PIrBzvK9HfpG5YOcLyf0lStuU94OSBxOXzpYkGyl9/xDEN02ryd8XfHG1zZF0T3beWw7NAgvfx3ntcolys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342964; c=relaxed/simple;
	bh=xyb5Nnug+EHfM4SE8ruRHgMRTAWiLmeeoiJTMXanmuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l3dTlmzFAA0wDqX0ffPowxbMKzy7/ZoD+lL9gbgyhx9LlOLxU1ktS6teEe1KdvdErZ0p0NCFImOSjdkERFniFLuyKoRJVKEpO6+Ks+AMrUWhmDvAXICxkdvnwsJQB454Alr0d/zA+0f/wJqQ5bjD+bIgpGSGN10QbLdsijw0mjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQAUDqEX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQAUDqEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECCB1F00A3A;
	Sat, 13 Jun 2026 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781342963;
	bh=LB75pw20aYPxcleNHAVfkzmg64gFhtC/bVMQF84DEYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQAUDqEXr/VWmOyzUrbi2Rs8YppHzoog3JqBUDVIijctGbNurGhsDPttzWncoUjxB
	 zTdBOk7wXh//vsQLQTEo46yaK5ommPgbdNCt6+Qs2+BItRv68E6GrwcjLeAi+JXuid
	 /gvOE3EO5DBU3kmvPPvseV/U8TeRdazYte84IaDKWo/7qgVciDqY/k2fYVj/7W8Pmc
	 gu0gJWG0gSSyM6k75ViFgp9jURZZpT3dwW3td0/ssgLNJXs7TvbFyq8whNlFbx/htx
	 WZIb4rNcNdSzSGgosKcW/GCCJSn6sA0TyqBCNX+JHrsZHUP7aibZtBejEQFdk/2g5p
	 54kjmr5F20c3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260612092851.2141782-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260612092851.2141782-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 09:29:22 +0000
Message-Id: <20260613092922.EECCB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing return value check for pm_runtime_get_sync() before hardwa=
re access.
- [High] Potential divide-by-zero kernel panic due to unchecked clk_get_rat=
e().
- [High] The driver lacks system PM callbacks to restore hardware register =
state after a suspend/resume cycle.
- [Medium] Missing PM runtime cleanup on the ptp_clock_register() error pat=
h.
- [Medium] The PTP clock is registered and exposed to userspace before the =
hardware timer is enabled.
--

commit 0a2d69b0a8fcc58f8e457187381c743ade641986
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

ptp: Add driver for R-Car Gen4

This commit adds a new driver for the gPTP timer found on R-Car Gen4
devices. The clock can be used by Ethernet drivers for PTP time
synchronization.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..ab0be2431be8d
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv;
> +	struct device *dev =3D &pdev->dev;

[ ... ]

> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] =3D perid[ns] * 2^27 =3D> (1ns * 2^27) / rate[hz]
> +	 */
> +	priv->default_addend =3D
> +		div_s64(1000000000LL << 27, clk_get_rate(priv->clk));

[Severity: High]
If clk_get_rate() returns 0 because the hardware clock is unconfigured or
fails to determine the rate, does this div_s64() result in a divide-by-zero
panic during the probe sequence?

Would it be better to verify the rate is strictly greater than zero before
performing the division?

> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);

[Severity: High]
Does this code need to check the return value of pm_runtime_get_sync()?

If the device fails to resume, perhaps due to a power domain failure,
could accessing its registers via iowrite32() cause a synchronous external
abort and lead to a kernel crash?

> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock))
> +		return PTR_ERR(priv->clock);

[Severity: Medium]
If ptp_clock_register() fails and the function returns the error directly,
does this leave the runtime PM reference permanently incremented?

It looks like pm_runtime_put_sync() and pm_runtime_disable() are not called
on this error path.

[Severity: Medium]
Is it possible for userspace to interact with the device before the hardware
timer is enabled?

The ptp_clock_register() function exposes the PTP character device, but the
timer is only enabled via PTPTMEC_REG after this succeeds. Could a process
open the device and read invalid time values during this race window?

> +
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	return 0;
> +}

[ ... ]

> +static struct platform_driver ptp_rcar_gen4_driver =3D {
> +	.driver =3D {
> +		.name =3D "ptp-rcar-gen4",
> +		.of_match_table =3D ptp_rcar_gen4_of_match,
> +	},
> +	.probe    =3D ptp_rcar_gen4_probe,
> +	.remove   =3D ptp_rcar_gen4_remove,
> +};

[Severity: High]
Does this driver need system PM callbacks to handle suspend and resume?

Without them, if the system enters deep sleep and the SoC power domain
shuts off the device, the internal register state, such as the default
addend and enable bit, might be lost. Would the PTP clock hardware remain
stopped and broken after the system wakes up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612092851.2141=
782-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
