Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C260437858
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788272; cv=none; b=iSk/GMS5f6fY/9pRmgYgrjp14kJB/UX8AL85hKHK9wC4rdI/9ZvLVBdKYId0faOEc77Itw0B16cII2bSk3DoUq5PAgKuRc5xzHLTezsg+dpfLf9iE73WMtlMt/s5vdmi0jL1ZeASX0YsRIgXs0jn70a50Z7aK1hkElJWvyu0XFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788272; c=relaxed/simple;
	bh=L3oOj27M+GpnrzRN8KCbvgrV9LfiWoxalrewbeD5DWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FGyu720kk+e+cbACmWH2NLNSFiancrOTBgL9gWvV4U4vNxXOspjzTlXmsDKF+4lprWFFqjOyPcoyPfV4HoS6f5JdDo5YYu8ZrW+hwQ8wn5YcFA9Tl/T6CCpJ4IIwxPf9YZy5jUVuVNhbeC6tNYAtzkYwCdCCPqtGpJ3ptkSO6DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW9tQJx+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW9tQJx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF481F00A3A;
	Mon,  7 Sep 2026 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788270;
	bh=1m94jG9PXgW0iEb7m/cz74DUeiKT+O/itd/3LftTYZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PW9tQJx+r61DgDnQhjn4PxE61vz4QS2pETaHa7HiqbbxSL00TSfxiKbvbiI+I2guD
	 rEl7zEhL40r84xVMudtb8ZgzTxSLWpabDkAid2K3btnO2QdNe8Xaf4wKM8s3ziAvYb
	 0KqUMHULUnWiYQnYCjvYbd/E2AT/N3+GQStjILy0bG6mPpVptLH/YrYxUkTcbf1jQd
	 F57kGngtPLc6Y+QE4ipBeNWUxWZNe6QoIiwYdXm6e8GR0oBSPH72wY88Trrigo6SLs
	 okrjc3oSPNRkV4QRGwG5TqsnLiWFpzzy4/09aoS37FL6KaVqDLAsrwuBGnrFprvSGI
	 whUqn6qaxzBRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907132617.1198548-4-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 13:37:50 +0000
Message-Id: <20260907133750.9DF481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing return value checks for clk_prepare_enable() in probe and =
resume paths.
- [High] Potential kernel panic due to division by zero if clock rates eval=
uate to zero.
--

commit cf8b24d3be560d75b9ef2a2a9fd88a1ce6dc9834
Author: Robert Marko <robert.marko@sartura.hr>

mmc: sdhci-of-at91: add LAN969x support
   =20
LAN969x uses the same internally generated base clock layout as SAM9X60,
but its SDMMC controller stops responding when runtime PM gates its clocks.
Add LAN969x-specific SoC data using the SAM9X60 clock layout and select the
option to leave its clocks enabled across runtime suspend.

> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of=
-at91.c
> index b7e2a89da348a..e7affca8da25f 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_sam=
9x60 =3D {
>  	.divider_for_baseclk =3D 2,
>  };
> =20
> +static const struct sdhci_at91_soc_data soc_data_lan969x =3D {
> +	.pdata =3D &sdhci_sama5d2_pdata,
> +	.baseclk_is_generated_internally =3D true,
> +	.keep_clks_on =3D true,
> +	.divider_for_baseclk =3D 2,
> +};

[Severity: High]
This isn't a bug introduced by this patch, but it exists in the baseline.

In sdhci_at91_probe() and sdhci_at91_runtime_resume(), the return values of
clk_prepare_enable() are ignored before accessing hardware registers.

For example, in sdhci_at91_probe():

	clk_prepare_enable(priv->hclock);
	sdhci_at91_set_clks_presets(&pdev->dev);
	clk_prepare_enable(priv->mainck);
	clk_prepare_enable(priv->gck);

And when restoring state in sdhci_at91_runtime_resume():

	if (priv->restore_needed) {
		if (!priv->soc_data->keep_clks_on)
			clk_prepare_enable(priv->hclock);

		sdhci_at91_set_clks_presets(dev);

		if (!priv->soc_data->keep_clks_on) {
			clk_prepare_enable(priv->mainck);
			clk_prepare_enable(priv->gck);
		}

If these clocks fail to enable, the driver silently proceeds to access hard=
ware
registers via sdhci_at91_set_clks_presets() and subsequent MMIO operations.
Could this lead to a synchronous external abort and a kernel panic from
accessing unclocked peripheral registers? Furthermore, would ignoring these
failures cause unbalanced clock reference counts during cleanup?

[Severity: High]
This is a pre-existing issue, but the configuration here is used during clo=
ck
setup in sdhci_at91_set_clks_presets(), which might have a division by zero:

	gck_rate =3D clk_get_rate(priv->gck);
	if (priv->soc_data->baseclk_is_generated_internally)
		clk_base_rate =3D gck_rate / priv->soc_data->divider_for_baseclk;
	else
		clk_base_rate =3D clk_get_rate(priv->mainck);

	clk_base =3D clk_base_rate / 1000000;
	clk_mul =3D gck_rate / clk_base_rate - 1;

If the clock is misconfigured in the device tree or fails to initialize,
clk_get_rate() can legitimately return 0. If clk_base_rate evaluates to 0,
will the computation of clk_mul trigger a kernel panic due to an unhandled
division by zero exception?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907132617.1198=
548-1-robert.marko@sartura.hr?part=3D3
