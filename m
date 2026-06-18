Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41EC2E7373
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774501; cv=none; b=XNEawW9NKTWo5TEoxvtrTQyejwrMInlhRWAohNph7VvNkUVu5HMP302uBbL3Ibjzm4W+rXhWfbm7+JHBKZcJQDtlZ4dI/3yjNvv9n7b/VFuZng+VgUyeGS+U8Yq3Yf37Igzp+wKcrOsZoQPFAYmKcffu8NfK+xHYgqgSB5wSpns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774501; c=relaxed/simple;
	bh=+JRY2vnLqBy17ZUNig/gTeC7VWgu5aBL7LA3sxl03lU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V7M1EZxbSmdU2+EB6AWMx81GSJSFjTG/1TSyxVAu7BToahC1hfs7RcMy6QAunaXUq/ReaxE3cHq046aWBGsflpK9Di4CF4hTstDFZjqTtQuhnBuuEqkvcTq22olvByVzGDQdd8iUwJt+EHwOu+xPH42wOFVlnZT6/cdrzIK4j6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T30ygV/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T30ygV/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3BD1F000E9;
	Thu, 18 Jun 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781774499;
	bh=kWL5A9H03mVR9PiMIQq7SvbjLk+YRl776lJthu784lI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T30ygV/Vm7ihT1DWlUOpjMD89kzQnk7VjUKCgvCnOYGF625fZ12g4DHleQNWHUdZJ
	 f39ZIFlwW4C6u+VgyWmATsAJ+ldETBvM1bzE5mj+VxHgg6ferVcQKLuPnqbZqNQjtb
	 PVsSJURA7NJLSL7nqUL3x4kYnv3G2PY+9dzC/oS1GmMcRwhJKTZY0DXGM5QS0/S5O5
	 Hgw0BKUoiEugIKeOhO5vQ+ulgRsdAdPQyd1BCXIatQyKVrfDO9tVEzFP9hOVydFwCu
	 aMKB1HE6PfB4YxZn3y1d5pNw6LQCaGgqKkPQjiC7BvI2giDKTKqED3IZWg/3ZWxRtW
	 Wm3d4XYIvf96A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-3-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
 <20260618-enable-spi-on-sa8255p-v4-3-f5b5067e7e1e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 09:21:39 +0000
Message-Id: <20260618092139.5C3BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The patch relies on APIs and structure fields that do not exist in =
the baseline kernel tree or the rest of the patch series, causing fatal com=
pilation errors.

Pre-existing issues:
- [High] Hardware registers are accessed without checking if `pm_runtime_ge=
t_sync()` successfully resumed the device.
--

commit 8edc09ad870bfce8d07091d2faeae9667787e1f0
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use resources helper APIs in runtime PM functions

This commit updates the geni SPI driver's runtime power management
functions to use streamlined resource activation and deactivation
helpers. It aims to eliminate code duplication across drivers.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 09feb6577efcb..025165c4b9527 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1130,16 +1130,8 @@ static int __maybe_unused spi_geni_runtime_suspend=
(struct device *dev)
>  {
>  	struct spi_controller *spi =3D dev_get_drvdata(dev);
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
> -	int ret;
> -
> -	/* Drop the performance state vote */
> -	dev_pm_opp_set_rate(dev, 0);
> -
> -	ret =3D geni_se_resources_off(&mas->se);
> -	if (ret)
> -		return ret;
> =20
> -	return geni_icc_disable(&mas->se);
> +	return geni_se_resources_deactivate(&mas->se);

[Severity: Low]
It appears the geni_se_resources_deactivate() and
geni_se_resources_activate() functions are not implemented in the baseline
tree, which could lead to immediate build failures.

Are these new helper APIs defined elsewhere in this patch series?

>  }
> =20
>  static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
> @@ -1148,15 +1140,14 @@ static int __maybe_unused spi_geni_runtime_resume=
(struct device *dev)
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
>  	int ret;
> =20
> -	ret =3D geni_icc_enable(&mas->se);
> +	ret =3D geni_se_resources_activate(&mas->se);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D geni_se_resources_on(&mas->se);
> -	if (ret)
> -		return ret;
> +	if (mas->se.has_opp)

[Severity: Low]
The has_opp field appears to be missing from the definition of
struct geni_se, which would cause a compilation error.

Does the has_opp field exist in struct geni_se in another patch within
this series?

> +		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
> =20
> -	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
> +	return 0;
>  }

[ ... ]

[Severity: High]
This is a pre-existing issue, but looking at spi_geni_init() in
drivers/spi/spi-geni-qcom.c:

	pm_runtime_get_sync(mas->dev);

	proto =3D geni_se_read_proto(se);

If pm_runtime_get_sync() fails to resume the device, accessing unclocked
or powered-off registers via geni_se_read_proto() could trigger a
synchronous external abort and result in a kernel panic.

Should the return value of pm_runtime_get_sync() be checked before
accessing hardware registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-enable-spi=
-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com?part=3D3
