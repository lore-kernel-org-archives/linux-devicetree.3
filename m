Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A7481FC2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938675; cv=none; b=X8O02aKx00lv5246WzJAMBh3rzmrz3KF3vCde5iEk6AUTV+WPcJhmBIoAjNPFVP7y0EMebog/9sCOtExsTfE6czYuz/djC4bATSVVEiQFfpBbseIeiriofNGkUvC4XriONDvk1oC7w830SwH98/p6kHw9LOO+AWua1BtrUW3QNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938675; c=relaxed/simple;
	bh=fggGxnLLIgzKoy/ITkTQbMvzIEjrr29FXWOLkckC3WA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pSQx9QmmlSOqHCL34rJD2whHX/I/8++Z+U3TBbP4q6rJMqWWN3it9o6WGDmPU+yXODFG/xInldgK2j2z/KNBGkeXdUlZnDbihmKzt5hbisno24f/eH346me01FCSxpzJgSz1LxlcJFyQK3pHFKvnzG4kCJWJpXtbhppHmWJAmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPMnWNNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPMnWNNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740BD1F000FF;
	Fri,  2 Oct 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938671;
	bh=46j3zL/GAwjgkS2u6e2fNWoksILBli89czJgmrIUcM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SPMnWNNitb/zEEKDXZHMPJ8TznLVmNGVqvtsKe8TOF9uAE6k//Bfhq6LSvPeGWyqK
	 6nlEielRFFvTMoCa4vzxcFbWTHfV7H1swm5Y5cVmtYfE5BA4Uw3qoLiyqaRtnTxtcU
	 9PTlNhc6X2acaL3Zpc7XvhcxpNgnlmYrQ2vPu9W1ZOdaG4xYoMfnFBF+x1Ekc9ttet
	 Kzy3yYmze2Rht2bNPiz0yVbvvSIePueWIguhA+MXHfBLlH4cePPikqQs7NvSfcZzo1
	 PocYCk7uwsJQrNls5Tx3ggqiUgXFANuiILaxv2zsTZymavsijYaAeVHck9ZzSpkoPS
	 v/Wepe8qDKphw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:57:51 +0000
Message-Id: <20261002105751.740BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] thermal/tsens: tsens_probe swallows -EPROBE_DEFER permanently di=
sabling hw-bin
- [Low] kconfig: QCOM_TSENS selects THERMAL_BIN without THERMAL_OF dependen=
cy
--

commit 8bed8cb744b82aeda728860cd801b8d298e30e15
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: qcom: tsens: add hardware-bin trip-point filtering

This commit introduces hardware-bin trip-point filtering for TSENS sensors
on Qualcomm SoCs. It adds a struct tsens_hw_bin_desc to read manufacturing
bins from nvmem cells, synthesizing these into hw-version bitfields that
the thermal core can use to filter supported hardware bins.

> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
> index a8cf7e2582010..6aab493333121 100644
> --- a/drivers/thermal/qcom/Kconfig
> +++ b/drivers/thermal/qcom/Kconfig
> @@ -3,6 +3,7 @@ config QCOM_TSENS
>  	tristate "Qualcomm TSENS Temperature Alarm"
>  	depends on NVMEM_QCOM_QFPROM
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	select THERMAL_BIN

[Severity: Low]
Does selecting THERMAL_BIN here without inheriting a dependency on THERMAL_=
OF
cause an unmet direct dependency warning?

If the kernel is configured with COMPILE_TEST enabled but OF/THERMAL_OF
disabled, this select forces THERMAL_BIN on, violating its explicit
dependency on THERMAL_OF. This can lead to build failures under WERROR.

>  	help
>  	  This enables the thermal sysfs driver for the TSENS device. It shows

[ ... ]

> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b5ec70201e2f3..26ba63da7163f 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c

[ ... ]

> @@ -1425,6 +1602,12 @@ static int tsens_probe(struct platform_device *pde=
v)
>  	priv->feat =3D data->feat;
>  	priv->fields =3D data->fields;
> =20
> +	ret =3D tsens_populate_hw_bin_info(priv, data);
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "thermal-bin failed to read FUSE data (%d): trips with temperature-b=
in will use first entry\n",
> +			 ret);

[Severity: Medium]
Does catching all errors here permanently disable hardware binning if the
nvmem provider is not yet ready?

If the nvmem provider (qfprom) probes after tsens,
nvmem_cell_read_variable_le_u32() in tsens_populate_hw_bin_info() will
return -EPROBE_DEFER. By logging a warning and continuing instead of
returning the error to the driver core, the probe completes and the
fallback state with default trip points becomes permanent.

Should this explicitly check for and propagate -EPROBE_DEFER?

> +
>  	platform_set_drvdata(pdev, priv);
> =20
>  	device_init_wakeup(dev, !data->no_irq_wake);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-thermal_bi=
n-v1-0-5a29be7e8ec5@oss.qualcomm.com?part=3D4
