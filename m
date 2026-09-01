Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFDE368D77
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289805; cv=none; b=ROVQrA7EDIYY++Q0m6MKoapijRL9AAIaor0emFpQTrjHN/pFMJjEf0A7R4J8lnJRRPj0M94ihuwO/tiQQEathQv9z84CJLJOnG3yQvxEeY/3LZC2rFl7PFqT5lJ0OP6HoZnGcvUNs6He40hjZJ15C5nZVt26z9VQkESUTQO1AbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289805; c=relaxed/simple;
	bh=jCFzhqS55uImmlAUdKuuhTUdzhbeRh+mzJGTjGnDaf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvVmK4GvN3ZqF1TjGmVAQwWLFFJiNwi6SS8h9sz0iX2j9L9H8YX+QDDdH3JCEn/TKFxLw7Buf0cBaAsRBznYjGYp65Mp5uqHnc/rU/iXIvGMWWgurydt43BNZmRsdDrMYYnoo9lqRjJKmr8BdMQL6F2gLNRcDbPkKYKtqPQa9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw9zgHoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw9zgHoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE821F000E9;
	Tue,  1 Sep 2026 19:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289803;
	bh=eO5+pN11VNAaQQs5Br+TvrzfbUDJSME+z+q5F1oXSIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dw9zgHoAVvkI80L58gIIYDky3j72TiPRr6NFJDBMeRTAUxjmMm7jeVFUTj5515ivq
	 gGFkTqBtWJihVCFq9OzpavPd7Oid5/yRH2K8sH95cvFdKLdIJTDmXMNN4aYcLI/DXA
	 VaH8V7cxJiaNLydqLzUCa6lJgfov32k8LAgwslK7D2cJghWnIa1LS5QneA+qp8/Qbo
	 zSiV/4F/DIaWFatzvDc3CO9GzY5UrjNc/M2rwkMp0xeBbzuDVqVkry17HixW8DfA66
	 U5Zl6WsCm3eQZwL38iVeoh2ouvmu87ftyr/p7AdXb0ozbcRk+P8IIUlFWYUBLBom8A
	 39vfNjF/sIGLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] mmc: sdhci-cadence: add Cadence SD6HC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901184828.15653-9-tanmay.kathpalia@altera.com>
References: <20260901184828.15653-1-tanmay.kathpalia@altera.com>
 <20260901184828.15653-9-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:10:02 +0000
Message-Id: <20260901191003.3BE821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Type Confusion and Out-of-Bounds Read due to relying on SD Associa=
tion's host->version
- [Medium] Memory Barrier Misuse masks hardware timing requirements
- [Medium] Hardcoded of_device_is_compatible checks bypass driver match data
--

commit a4d954763650a6fbead1cf6e48fefd5979c779d2
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: add Cadence SD6HC support

This commit adds support for the Cadence SD6HC host controller and its
integrated combo-PHY. It splits the existing driver into a core module and
a PHY-specific module for v6, using a shared header for private state.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence-core.c
> similarity index 85%
> rename from drivers/mmc/host/sdhci-cadence.c
> rename to drivers/mmc/host/sdhci-cadence-core.c
> index 1fb23051a047b..ea2517e8f72a9 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
[ ... ]
> @@ -569,13 +583,24 @@ static int sdhci_cdns_probe(struct platform_device =
*pdev)
[ ... ]
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd6hc")) {
> +		clk =3D devm_clk_get_enabled(dev, "ciu");

[Severity: Medium]
Will this hardcoded check fail to match hardware variants that omit the
generic fallback string?

The code branches by checking specifically for "cdns,sd6hc", bypassing the
driver match data. If a valid device tree specifies a variant string without
the generic fallback, this check will fail, leading to missing clock
initializations.

Could this logic be moved to a flag or PHY type identifier within
sdhci_cdns_drv_data instead of hardcoding compatible string comparisons?

[ ... ]
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd4hc")) {
> +		__sdhci_read_caps(host, &version, NULL, NULL);
> +		ret =3D sdhci_cdns4_phy_probe(pdev, priv);

[Severity: Medium]
Similarly, will this check misidentify specific SD4HC variants as SD6HC if
the generic string is omitted?

If "cdns,sd4hc" is missing from the device tree node but a variant compatib=
le
string is present, the driver will mistakenly execute the SD6HC PHY probe
block below.

[ ... ]
> @@ -636,7 +677,11 @@ static int sdhci_cdns_resume(struct device *dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D sdhci_cdns4_phy_init(priv);
> +	if (host->version >=3D SDHCI_SPEC_420)
> +		ret =3D sdhci_cdns6_phy_init(priv);
> +	else
> +		ret =3D sdhci_cdns4_phy_init(priv);

[Severity: High]
Can this type confusion lead to an out-of-bounds read?

The PHY structure pointer is cast and accessed based on the hardware-report=
ed
SDHCI version rather than the actual type allocated during probe. If an SD6=
HC
device reports a specification version less than 4.20 in its registers, it
will fall back to sdhci_cdns4_phy_init().

Because sdhci_cdns4_phy_init() casts the PHY state to struct sdhci_cdns4_ph=
y,
it misinterprets the first field of struct sdhci_cdns6_phy (t_cmd_output_mi=
n)
as the nr_phy_params field. This will result in an out-of-bounds loop
reading unmapped memory.

Should the PHY version be determined by the driver data set during probe
instead of relying on the hardware specification version register?

> diff --git a/drivers/mmc/host/sdhci-cadence-phy-v6.c b/drivers/mmc/host/s=
dhci-cadence-phy-v6.c
> new file mode 100644
> index 0000000000000..22d56bb46d75a
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-cadence-phy-v6.c
[ ... ]
> +	sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_CTRL_REG, reg);
> +
> +	/*
> +	 * Ensure all preceding PHY register writes complete and reach the cont=
roller before
> +	 * releasing the PHY from reset. Without this, SDR104 has been observed=
 to fail
> +	 * intermittently on some boards.
> +	 */
> +	wmb();

[Severity: Medium]
Is this memory barrier masking a hardware timing requirement?

The wmb() macro orders local CPU memory stores, but it does not flush posted
MMIO writes over the interconnect to the device. Its success in preventing
intermittent failures is likely due to it acting as an accidental micro-del=
ay
on the CPU. On a faster CPU or a different interconnect architecture, this
will not guarantee the writes have settled.

Would a dummy readl() to flush posted writes or a small udelay() be more
appropriate here?

> +
> +	ret =3D sdhci_cdns6_dll_reset(priv, false);
[ ... ]
> +	sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_DQ_TIMING_REG, reg);
> +
> +	/* Ensure DQ timing programming is visible before HRS09 follow-up write=
s */
> +	wmb();

[Severity: Medium]
Does this second wmb() suffer from the same MMIO flushing issue?

Like the previous barrier, this orders CPU-side memory stores but does not
ensure the device has actually received and processed the DQ timing
configuration before the subsequent HRS09 writes occur.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901184828.1565=
3-1-tanmay.kathpalia@altera.com?part=3D8
