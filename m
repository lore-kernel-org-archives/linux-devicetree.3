Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C72571A9
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780167176; cv=none; b=DWJCMxl/E/QSs4qErqYBTvBtQmr2R9BIR6Vi0WhGlOtrbxlnk3YTNCABWKqBt2tRcBHVUkMxJZuXIVuTdsl3Y1nEq6rJekvqj3T7UXuLzbejcuoEazqroD3wTaS03YtxZrUduRh5wj2fuJRUy4OpKpjPJU0Que+8JlEqhacKtGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780167176; c=relaxed/simple;
	bh=9DRyQLvOsc168ajUN9ce9DzXbzt77DYF+HkBGF+1lAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XygTeUVVZg67G2lkzVuJY+wMub1Xz3Ad/lVbaJiUQJ/4Z13ISt4lTQgtS1+P6yt8odQL1EEQzdGQmy+RAJIY76M6sg6CipJ5PsjiSzGqHZ+M461P+TlrQAO302Q1gsYMiE5QVvyG0FQTt3aa1WvV7ukEyfeFafuT+Ukt6zn4TjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxVvFiAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxVvFiAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48DA1F00898;
	Sat, 30 May 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780167173;
	bh=QS4YuHrsn2U3mT0f3750dFtCsjTZJ9jZUZMmUBnt+PI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GxVvFiAuBa8l3rWc48fmU/nwmaYF9OzZvAst5+UpKNhwymQL0tj+rjSVFCB6t3Glz
	 LZUCrC/0fd4RhXj5UgZ5lUgjgMRkel7WdeRkf/OSGAEhpIT22c59keddHpCJkfl/V1
	 1Qi2VnAwjIMju0cv/IlbPh4pTCsqinqKWUI8AclPVCmOqiBpkoj6zCm3P4mKKNGjRC
	 jPtJvHNAClr5YccxwOED9m4j4mrGn5Z8+laebJCiiDLj7LPwwLx2GfIyOdv9fMabBb
	 yLfyDhS42w4p1iADY5Vx8PMe1lpRyjH/6xOvlVVPnrRCDG8Ot7o2bPhVDGrQ6tnk5Z
	 uGaLF4h8G3+8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-2-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-2-17574601bd63@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 18:52:53 +0000
Message-Id: <20260530185253.A48DA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unchecked ERR_PTR for se->clk on ACPI platforms causes kernel pani=
c in clk_round_rate().

Pre-existing issues:
- [High] Missing return value check for pm_runtime_get_sync() in spi_geni_i=
nit() leads to unclocked hardware access.
--

commit c69b8f64e97b3440b056b6b346311b9f4e470629
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use geni_se_resources_init() for resource initialization

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index a04cdc1e5ad4d..333216df922e8 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1049,10 +1048,6 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> =20
> -	clk =3D devm_clk_get(dev, "se");
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -
>  	if (device_property_read_bool(dev, "spi-slave"))
>  		spi =3D devm_spi_alloc_target(dev, sizeof(*mas));
>  	else
> @@ -1068,17 +1063,10 @@ static int spi_geni_probe(struct platform_device =
*pdev)
>  	mas->se.dev =3D dev;
>  	mas->se.wrapper =3D dev_get_drvdata(dev->parent);
>  	mas->se.base =3D base;
> -	mas->se.clk =3D clk;
> =20
> -	ret =3D devm_pm_opp_set_clkname(&pdev->dev, "se");
> +	ret =3D geni_se_resources_init(&mas->se);

[Severity: High]
Does this change introduce a potential kernel panic on ACPI platforms?

By switching to geni_se_resources_init(), the driver now tolerates a missing
se->clk on ACPI platforms (leaving se->clk as an ERR_PTR):

drivers/soc/qcom/qcom-geni-se.c:geni_se_resources_init() {
    ...
    se->clk =3D devm_clk_get(se->dev, "se");
    if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
        return dev_err_probe(...);
    ...
}

However, the driver unconditionally triggers frequency matching later, which
evaluates the ERR_PTR in clk_round_rate():

drivers/spi/spi-geni-qcom.c:get_spi_clk_cfg() {
    ...
    ret =3D geni_se_clk_freq_match(&mas->se, speed_hz * mas->oversampling,
                                 clk_idx, &sclk_freq, false);
    ...
}

Because clk_round_rate() only checks for NULL and not IS_ERR(), it will
dereference the error pointer and cause a panic. Prior to this patch, the
driver correctly aborted probing if the clock was missing.

>  	if (ret)
>  		return ret;
> -	/* OPP table is optional */
> -	ret =3D devm_pm_opp_of_add_table(&pdev->dev);
> -	if (ret && ret !=3D -ENODEV) {
> -		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> -		return ret;
> -	}

[ ... ]

> @@ -1104,24 +1092,12 @@ static int spi_geni_probe(struct platform_device =
*pdev)
>  	if (spi->target)
>  		spi->target_abort =3D spi_geni_target_abort;
> =20
> -	ret =3D geni_icc_get(&mas->se, NULL);
> -	if (ret)
> -		return ret;
> -
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
>  	ret =3D devm_pm_runtime_enable(dev);
>  	if (ret)
>  		return ret;
> =20
> -	/* Set the bus quota to a reasonable value for register access */
> -	mas->se.icc_paths[GENI_TO_CORE].avg_bw =3D Bps_to_icc(CORE_2X_50_MHZ);
> -	mas->se.icc_paths[CPU_TO_GENI].avg_bw =3D GENI_DEFAULT_BW;
> -
> -	ret =3D geni_icc_set_bw(&mas->se);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D spi_geni_init(mas);

[Severity: High]
This is a pre-existing issue, but does spi_geni_init() need to check the
return value of pm_runtime_get_sync()?

Looking at spi_geni_init(), it accesses hardware registers immediately after
calling pm_runtime_get_sync() without checking for failure:

drivers/spi/spi-geni-qcom.c:spi_geni_init() {
    ...
    pm_runtime_get_sync(mas->dev);

    proto =3D geni_se_read_proto(se);
    ...
}

If the runtime resume fails (for example, due to power domain or clock
issues), the device hardware remains unpowered. The geni_se_read_proto() ca=
ll
performs a memory-mapped I/O read. Reading from an unclocked or unpowered
register on ARM systems can trigger a synchronous external abort (SError),
crashing the entire system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-enable-spi=
-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com?part=3D2
