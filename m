Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E228A2367DF
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780167744; cv=none; b=SBfBrhKdJY1kEQEkLGz47oLJv3IGV0v3sm02CATutRTiAkGaAeDPGR8ACXkmbCOMu2v4j0UzxxNY5NvFNO1hWSN/opPbndhEYYV5ACR+AWSi5WoJeJ9RQcu6XcAK9VEAzR5ulrrVkmRxPr/JhAjaV+GtzOZS/lLksVyHumXbUJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780167744; c=relaxed/simple;
	bh=oaPFmDbv095AioPv6WkJ9c711XOEXdWTQjKA71QFVyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r/mGoL1vfpmU7Gae7TCHNNtDdo8z0Tk57hzecT6IsypWmZYVNyyRNa2NdiLkNCos6tCL9B2ZxLYCBXMP6+JOvEslwMP+lhzNQT3+Fgjxi/hwafZfBTk/6dQICXpdK2PPkjRgvuxk4SyIM5hl7g+CLSN3uY72sfYCR1QaVHbuWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bds8us6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bds8us6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6B71F00893;
	Sat, 30 May 2026 19:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780167742;
	bh=OEdFvpsUVgGYt9TVE80htBjVWzSZNq/kXh9pTKmAG4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bds8us6SosUFE78etWkivLDz1ERW74vSR+KNDvumFBF+rT5ISRePDTw6fZODH2/sn
	 hajsIb3PCmZP5IwiM6XLJiSWI7EOVjgw51bM4ypsNNZaiDGq9JBJOBiGsMUqSLn77f
	 W7lWsFA4rXOiHWPw4CHnb58jZEKJ6Wi5wzmgaFnnS+0ZQ0dbm0LmZ0KKsyun1RWPPn
	 58J9hF5ezOiQuulw2O+yQqzJENL0UaBJuaW5Ab2Fu7FhiVocF+aqikvKhHs43tjIuK
	 P9ZMc+nX//XbbbHIRPGRx7eCaYdOs7lsaqAiTYgsQ8ym7hdOw1jLoDruDJBj/u0OKg
	 IskxnixqEEWsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-3-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-3-17574601bd63@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 19:02:22 +0000
Message-Id: <20260530190222.8C6B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Performance state (OPP) vote is dropped during suspend but never r=
estored on resume, leading to hardware operating at zero voltage.
--

commit 60a92c010d0b0fc6d9cc73f3af65a2635a04cf3c
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use resources helper APIs in runtime PM functions

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 333216df922e8..7696412c6e879 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1119,33 +1119,16 @@ static int __maybe_unused spi_geni_runtime_suspen=
d(struct device *dev)
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
>  }
> =20
>  static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
>  {
>  	struct spi_controller *spi =3D dev_get_drvdata(dev);
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
> -	int ret;
> -
> -	ret =3D geni_icc_enable(&mas->se);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D geni_se_resources_on(&mas->se);
> -	if (ret)
> -		return ret;
> =20
> -	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
> +	return geni_se_resources_activate(&mas->se);
>  }

[Severity: High]
How does the performance state (OPP) rate get restored on resume?

Before this patch, spi_geni_runtime_resume() explicitly restored the OPP
rate using dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz).

While the new geni_se_resources_deactivate() helper continues to drop the
OPP rate to 0 on suspend, geni_se_resources_activate() does not restore it.
This seems to leave the hardware operating at zero voltage upon resume.

Furthermore, subsequent transfers won't reapply the rate because
geni_spi_set_clock_and_bw() has a fast-path optimization that skips setting
the clock if the requested frequency hasn't changed:

    if (clk_hz =3D=3D mas->cur_speed_hz)
            return 0;

Will this lead to bus lockups or transfer timeouts due to operating without
adequate voltage votes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-enable-spi=
-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com?part=3D3
