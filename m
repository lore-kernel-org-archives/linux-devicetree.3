Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61A33A7198
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983217; cv=none; b=XstMd3C/EEt+0cITF0daBbARA4YdARGpe5vgFsgVZLERH1Z/P5y7EhVqDGBngUucrzj5m2aePs+CYjNWqR1eHsy77iKY5F1wGUinbwr/XSL4IJhBkOu/3nIWNLWwOUg05IQMy1xxtq0KWBVnWqghwvMLwvUFwNxsGB7FQSEUrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983217; c=relaxed/simple;
	bh=iehAO73JyOw0K5COyUzsmTuJ1OlZPjr1Bgn89AV3gy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wz31pTlT4CKMOzhjg4OAd89opMex0P4R2e+fd69cp8eugX72wdCXvpzvWqMZKWBKJ2a8ZBkrzg5Rac/n1vxSA3I3J3Ph8in9rOQUMtcBttulkQZctT+gArPje5bAn47CYQcdqYofUjv0oCrxqIUUcfvIOWJkiVRD/J2VmjwprH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wx6D+vws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wx6D+vws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80891F00A3E;
	Thu,  2 Jul 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983215;
	bh=8aIq+scFpw3Wg3iKx7gnHUSfgRPO8ouhG+eofb95Ezk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wx6D+vwsdp/XHbyOVInh0Y1ND3BiAjWI5+nYzXQcIyoK3cDioDYO8ZubL71jY5O1Q
	 f2ORtmrfPohRjSzu5orekYtEbEZ4fWm3c9zm7QIhCx4gSQe5MUJKkUbS4y7OimKbM9
	 kdmgY9/DUlRRG8Q+Dw6wjJgLwehUIFwv3bIzpLv9GdjLYZGbrY63EFIHL3UyzuWj2Y
	 JSk9OruaQKVNAnz8eD0/i5K5uOOeyjncUB9sFLiLqb4Ofg+LBK+EhxqXyUcxdgxrfR
	 OQtnwencT7rR+Zb2RtL9pC90M7ZG20IJMXGuoUScNar1LmQojQgDtra/YArI0KRcpO
	 rn4llfMStJi4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/3] ptp: Add driver for R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701090607.1108208-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
 <20260701090607.1108208-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:06:54 +0000
Message-Id: <20260702090654.E80891F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The probe function leaks runtime PM references and leaves the devi=
ce active if `ptp_clock_register()` fails.
- [High] The return value of `pm_runtime_get_sync()` is unchecked, which ca=
n lead to a synchronous external abort if powering the device fails.
- [High] The driver divides by the unchecked result of `clk_get_rate()`, ri=
sking a division by zero panic and potential type overflow.
- [Medium] The PTP clock is registered and exposed to user-space before the=
 underlying hardware timer is enabled.
--

commit 523fe97d56330aedad6aa7c19dcf2bc206269fe3
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
ptp: Add driver for R-Car Gen4

Add driver for the gPTP timer found on R-Car Gen4 devices. The timer is
system-wide and shared by different Ethernet devices on each Gen4
platform.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..ab0be2431be8d
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c
[ ... ]
> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv->info =3D ptp_rcar_gen4_info;
> +
> +	/* Default timer increment in ns.
> +	 * bit[31:27] - integer
> +	 * bit[26:0]  - decimal
> +	 * increment[ns] =3D perid[ns] * 2^27 =3D> (1ns * 2^27) / rate[hz]
> +	 */
> +	priv->default_addend =3D
> +		div_s64(1000000000LL << 27, clk_get_rate(priv->clk));

[Severity: High]
Could this lead to a division by zero if clk_get_rate() returns 0?

Also, since div_s64() takes an s32 divisor, would an unsigned long clock ra=
te
overflow to a negative value for rates above 2.14 GHz?  Should this verify
the rate is non-zero and use div64_ul() instead?

> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);

[Severity: High]
Does this need to check the return value of pm_runtime_get_sync()?

If the PM domain fails to power on and returns a negative error code,
unconditionally proceeding to write to the MMIO registers might cause a
synchronous external abort.

> +
> +	priv->clock =3D ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock))
> +		return PTR_ERR(priv->clock);

[Severity: High]
If ptp_clock_register() fails, does this leave the PM usage counter
unbalanced?  It looks like this error path returns without calling
pm_runtime_put_sync() or pm_runtime_disable() to clean up the state
initialized earlier in ptp_rcar_gen4_probe().

[Severity: Medium]
Is there a race condition here?

By calling ptp_clock_register() before enabling the hardware timer on the
next line, is it possible for a fast user-space process to execute a gettime
or settime request on disabled hardware?

> +
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701090607.1108=
208-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
