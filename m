Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149D4F68A9
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486006; cv=none; b=K29A5wyia+wpmo4k3somEFNfEds65783gYDc5Fei1bSY5QPsQnP3Skclv6eDV6hIlQ98amzNlQilhjql8cf0Z2FpEO9DxV6q0KmX4T4/MGKdwEvP9NGDmAwuiFUy+GGxkycvR4uzDHpdMPuaFXvZbxbYuvwaQnKsl432qBsSZWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486006; c=relaxed/simple;
	bh=I+0Uf158OPAvUiWJvgHismND+KQNQcoValfBpkArQsg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=IGVzy+hrrjPD1kXnnXm4t525Q59D7LWQPQajxCZM6b+sCYHFqqbFzrmvCkkW4de1fR2zaKfkRaElLR8lDxkgBKVd2aAS/Iq4bGpGL32OeGxvtvWD8QP5MGdTyoxAX7ye91+HCSWH2UegoVItMZ6VDqewOB8C+bnR1yNVczdo5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEH9acCN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEH9acCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B531F00893;
	Thu,  8 Oct 2026 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791486005;
	bh=bNcLmtFLo1Bv8cgovQFLGZsejtECN8oYnteIQ8rJDLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEH9acCNf4S2ydaPNUSfAX6AsisVrE2yUVAzYtvu23GR6GFCw7PoWo+xFJtZhw87y
	 YlpL31LFdE/dEfb+65O6qjvTJOsgv4aMSJz/ZnslaQm2l5DRv4ZODkLwJl5l0syJSv
	 h5Dly4F2TrG0zXcPO8FbRGiwgdQBf/Dxs7y1tawWWUEbHTJzQd5WpKPDnGnoK7w4yL
	 BQqN5Ic1pw4y366vNVtTN0DQLojz1v0EIDItszKKN6ScBtVnUzpqDiyC1Dai8QZ4Kj
	 i7OsrZOGYmEIyvSW4V2RrhRk3QU3vmfVsAJbuYM2W4KMFYYeUI8b0l+u7Ruy8mjATt
	 cLcxX4vSUsQuQ==
Message-ID: <sashiko-outbox-164485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007185920.4042783-3-niklas.soderlund+renesas@ragnatech.se>
References: <20261007185920.4042783-1-niklas.soderlund+renesas@ragnatech.se>
 <20261007185920.4042783-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:00:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] pm: unchecked pm_runtime_resume_and_get() return in ptp_rcar_gen4_=
probe()
- [High] pm: missing return value check for pm_runtime_resume_and_get()
- [Medium] ptp: missing hardware timer disable on ptp_clock_register() erro=
r path
- [Medium] ptp: potential time tearing in gettime due to unlatched sequenti=
al reads
- [Medium] ptp: torn hardware state exposed during _ptp_rcar_gen4_settime()
--

commit 3db5fb281fb9f619fc7eb84cff8bc9d6876c1eab
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

> +static void _ptp_rcar_gen4_gettime(struct ptp_clock_info *ptp,
> +				   struct timespec64 *ts)
> +{
> +	struct ptp_rcar_gen4_priv *priv =3D ptp_to_priv(ptp);
> +
> +	lockdep_assert_held(&priv->lock);
> +
> +	ts->tv_nsec =3D ioread32(priv->base + PTPGPTPTM00_REG);
> +	ts->tv_sec =3D ioread32(priv->base + PTPGPTPTM10_REG) |
> +		((s64)ioread32(priv->base + PTPGPTPTM20_REG) << 32);
> +}

[Severity: Medium]
Can these sequential reads result in a torn time read?

If the time advances across a second boundary between the read of
PTPGPTPTM00_REG and the subsequent reads of PTPGPTPTM10_REG and
PTPGPTPTM20_REG, the returned timestamp could be incorrect by a full second
unless there is a hardware latch or a software retry loop.

Since this is also used in ptp_rcar_gen4_adjtime(), a torn read there would
corrupt the hardware clock state by writing the torn value back.

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

[Severity: Medium]
Does re-enabling the timer before the new time offsets are fully written
create a race window?

Between the write to PTPTMEC_REG (which enables the timer) and the final wr=
ite
to PTPTOVC00_REG, the timer is actively running with a partially set offset.
Could concurrent hardware timestamping events observe an intermediate torn
state during this window?

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned long rate;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
> +
> +	rate =3D clk_get_rate(priv->clk);
> +	if (!rate)
> +		return -ENODEV;
> +
> +	spin_lock_init(&priv->lock);
> +
> +	priv->info =3D ptp_rcar_gen4_info;
> +
> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] =3D perid[ns] * 2^27 =3D> (1ns * 2^27) / rate[hz]
> +	 */
> +
> +	priv->default_addend =3D div_s64(1000000000LL << 27, rate);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_resume_and_get(dev);
> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);

[Severity: High]
If pm_runtime_resume_and_get() fails (e.g., due to power domain or clock
initialization failure), the device could remain suspended.
Could the subsequent iowrite32() calls then access unclocked or powered-off
hardware, resulting in a synchronous external abort or silent register
corruption?

> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);

[Severity: High]
If the previous pm_runtime_resume_and_get() had failed, wouldn't this
unconditional pm_runtime_put_sync() cause the PM usage counter to underflow?

[Severity: Medium]
If ptp_clock_register() fails, the error path cuts power, but doesn't it
miss disabling the hardware timer logically?

In ptp_rcar_gen4_remove(), the hardware timer is explicitly disabled by
writing to PTPTMDC_REG before cutting power:

ptp_rcar_gen4_remove() {
	...
	iowrite32(1, priv->base + PTPTMDC_REG);
	pm_runtime_put_sync(dev);
	...
}

Could suspending the PM power domain while the IP block's internal timer is
still logically enabled lead to hardware state corruption or prevent a clean
restart upon module reload?

> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007185920.4042=
783-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
