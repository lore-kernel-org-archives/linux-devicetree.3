Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598443C8C43
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774610; cv=none; b=I9XI8fn9+5uC8nROyM83Sx307UyY1HZtrv2X97MJPvNDn8qv2yqag2TV+rGpIwYLGmrlSHUkR1fD0Vg04S81RlhWsBMkZ95fwqTBLsRVi/52o1/s0sJQddIiS8jm0MEKp9HrPdplTP01ab1NIPCDRiYDfs8QDmIELnkD12do8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774610; c=relaxed/simple;
	bh=Delj40O4VvR20h8bDZxde4sk8Lcvi1HhSD3L1PmyJkw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PzcPjwhLoFK1X94JX+qtph7bCCQoR9IaTCec1NIZy4mA0TVK5UMtZL3ySCuG+SQIML/chVP0oKO4M/M1Zvk8qYu1pqvztVJ5IzUGlb6r5TvAjveVqt7JltQDGn+zgSQOcJyGTuYlHBbmMXP+vf9/GT/qv9Rzel6VaCoNp9z9znY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS0F3fOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS0F3fOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34031F000E9;
	Thu, 18 Jun 2026 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781774606;
	bh=j+HtnT3XSGDSjBTGghxICZkmnFZYkap+/S56IlmwOtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OS0F3fOIJt+krkN39P6RVo153yyXZO5++CVhtvIac5oAha8ROa134oYf7isv2CpxP
	 dFXjRxG9ha2rhw93VSdHiVnnBQeQSIPqYkLQ/im0HGpiWdc4Fp57xoKqinxVQTGlXP
	 MDgwNL7wn2pzH1nHiCrdRPmU7awScY+9XhDGbpPJXUJwd43bjmLaMM7fq/Vk9vvLfo
	 vUWqgk38OC7lF1qAr4yPLYAk8HvV8wNBXUmMQqTjOx1v7Upoy0iK1vAprXEnI0Eb1R
	 lLFoZgL6wLP3M0hInmev7fm4LTuv11AzfyvBoH+Q4+jDegvVxcgCZfW3CE2irhaV5D
	 7SYM1mAmFhEaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
 <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 09:23:25 +0000
Message-Id: <20260618092325.E34031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incomplete abstraction in `setup_gsi_xfer()` breaks GPI DMA transf=
ers for SA8255p.
- [High] `spi_geni_runtime_resume()` hardcodes legacy OPP clock restore, br=
eaking performance state restoration on SA8255p.
- [Low] Compilation fails due to undeclared identifiers `geni_se_domain_att=
ach` and `geni_se_set_perf_opp`.

Pre-existing issues:
- [High] Ignored `pm_runtime_get_sync()` return value in `spi_geni_init()` =
causes kernel panic on initialization failure.
--

commit 41d8ba8fbc50744c00c196e2484d690b4592cc0a
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

This commit adds support for the SA8255p SoC to the qcom-geni SPI driver.
It abstracts resources initialization and rate setting into a new
geni_spi_desc structure to handle SCMI-based power and performance protocols
required by this platform.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 025165c4b9527..88ac0833351c0 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -825,7 +834,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>  	}
> =20
>  	/* Speed and bits per word can be overridden per transfer */
> -	ret =3D geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
> +	ret =3D mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
>  	if (ret)
>  		return ret;

[Severity: High]
Since setup_se_xfer() now uses the new set_rate callback, should
setup_gsi_xfer() be updated as well?

Currently, setup_gsi_xfer() appears to hardcode a call to the legacy
get_spi_clk_cfg() function, which bypasses mas->dev_data->set_rate.
Could this break GPI DMA transfers for the new SA8255p platform by leaving
the hardware misconfigured?

[ ... ]

> @@ -1075,7 +1084,11 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>  	mas->se.wrapper =3D dev_get_drvdata(dev->parent);
>  	mas->se.base =3D base;
> =20
> -	ret =3D geni_se_resources_init(&mas->se);
> +	mas->dev_data =3D device_get_match_data(&pdev->dev);
> +	if (!mas->dev_data)
> +		return -EINVAL;
> +
> +	ret =3D mas->dev_data->resources_init(&mas->se);
>  	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does spi_geni_init() safely handle power
domain or clock enablement failures?

In spi_geni_init(), which is called shortly after this probe setup, the
return value of pm_runtime_get_sync() is ignored before accessing hardware:

    pm_runtime_get_sync(mas->dev);
    proto =3D geni_se_read_proto(se);

If pm_runtime_get_sync() fails, could the subsequent read from the
GENI_FW_REVISION_RO register via geni_se_read_proto() cause an asynchronous
external abort and panic the kernel?

[ ... ]

> @@ -1140,9 +1154,11 @@ static int __maybe_unused spi_geni_runtime_resume(=
struct device *dev)
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
>  	int ret;
> =20
> -	ret =3D geni_se_resources_activate(&mas->se);
> -	if (ret)
> -		return ret;
> +	if (mas->dev_data->power_on) {
> +		ret =3D mas->dev_data->power_on(&mas->se);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	if (mas->se.has_opp)
>  		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);

[Severity: High]
Does this hardcoded OPP restore bypass the new set_rate abstraction for the
SA8255p platform?

For SA8255p, mas->dev_data->set_rate is geni_se_set_perf_opp(), which
does not update the legacy mas->cur_sclk_hz variable. If has_opp is true,
could this accidentally set the clock rate to 0 and stall the device?
Alternatively, if has_opp is false, could this fail to restore the
performance state entirely?

[ ... ]

> @@ -1188,8 +1204,21 @@ static const struct dev_pm_ops spi_geni_pm_ops =3D=
 {
>  	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
>  };
> =20
> +static const struct geni_spi_desc geni_spi =3D {
> +	.resources_init =3D geni_se_resources_init,
> +	.set_rate =3D geni_spi_set_clock_and_bw,
> +	.power_on =3D geni_se_resources_activate,
> +	.power_off =3D geni_se_resources_deactivate,
> +};
> +
> +static const struct geni_spi_desc sa8255p_geni_spi =3D {
> +	.resources_init =3D geni_se_domain_attach,
> +	.set_rate =3D geni_se_set_perf_opp,
> +};

[Severity: Low]
Are geni_se_domain_attach and geni_se_set_perf_opp declared elsewhere?

It looks like these identifiers are not defined in this file or the included
headers, which might cause a build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-enable-spi=
-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com?part=3D4
