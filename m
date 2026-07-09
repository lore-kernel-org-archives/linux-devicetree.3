Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12BE3AC0F8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592416; cv=none; b=cbRLnzGd9xkzc8zsBqdlRM6Brp25vnkJGFYNybZCJ3chDouTq/U8mywMrhsjXZkG5ZnUFTx+mmkAzHz+dfxYNfyf35j9owKYwrvChdRiSc/DUP7OmY08kaOGznIr7Z/9eIwOvGw5xyCrvkCXvlz9b2rt+SNF8ncr/vfbbGAUmmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592416; c=relaxed/simple;
	bh=p4UfTFRZvH8kPU/u6hpEqgqPRpsTnoV9gpCUTKxnIVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CwOfhVFXL0EAjqjq1/bi3lCELbiQPZDa1hiFtCTwo92BFyRuQasXVedJegBaUs8AcJpB/7Zfd1TsHsqKyWjiKFiG2Uahp0oiDSpHWI3/CsgtV3YD+Ke+BuhWARmd69YLtYjNX4zn9fa0BaiK4zoMc2qR3x5RYG+320gA+VReyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxvZSRo6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxvZSRo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545EC1F000E9;
	Thu,  9 Jul 2026 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592415;
	bh=Giyh/AYMD+/0jexkX4BgpX9MB8bptuUkeWgajJRS1WM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxvZSRo6SJxYFP2AGx4F6wIXyUJY/IxNO6nEAIM3tx7a3Y5vBeGzosA6XkNGHxF1P
	 RzSePcKT9wwTeUXCGXRlh7BifDfVyZj/n5hlowxzmlIvXxpCaOuegcu8G5LCbz2fwb
	 FTJuPwxaRLCulGpZlW0WRPWd2xORKeoPX8qVzB3uTHi8missalB4i7u4BAXtBBQw0M
	 mH04NsBILh5Fs9BcFdbNFHo9sBPG+V7+DY0Knmldr2TRnF4SA1BjGR4sr7i/JXJFR2
	 7/Etk9DZ4HbyM0/ZXfeEBLMa+FqYH485tY6gNtfbTo8v0pVdMe/8jtGNclXGk4pwy2
	 Lc5+rD7YBcuxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy
 driver unregistration
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709100617.42583-4-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
 <20260709100617.42583-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:20:13 +0000
Message-Id: <20260709102014.545EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Wrong device pointer passed to devm_add_action_or_reset() for the =
audio codec platform device causes a leak and double-free.
- [High] Manual platform_device_unregister() calls in the devm_add_action_o=
r_reset() error paths lead to double unregistrations.
--

--- Patch [3]: [PATCH v2 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and ph=
y driver unregistration ---
commit ec9d95ddc19e68c697bea7b649dc680e85f406a8
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration

This commit attempts to fix platform device leaks during probe deferrals
by adding devm_add_action_or_reset() calls to automatically unregister
the HDMI codec and DisplayPort PHY platform devices.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index eefbc7e0f9c8d..2c738c16dafab 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c

[ ... ]

> @@ -2680,18 +2687,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>  		.data =3D mtk_dp,
>  		.no_capture_mute =3D 1,
>  	};
> +	int ret;
> =20
>  	mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>  							   HDMI_CODEC_DRV_NAME,
>  							   PLATFORM_DEVID_AUTO,
>  							   &codec_data,
>  							   sizeof(codec_data));
> -	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +	if (IS_ERR(mtk_dp->audio_pdev))
> +		return PTR_ERR(mtk_dp->audio_pdev);
> +
> +	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->=
phy_dev);
                                                                     ^^^^^^=
^^^^^^^^^

[Severity: High]
Should this be passing mtk_dp->audio_pdev instead of mtk_dp->phy_dev?

Passing mtk_dp->phy_dev here registers a second unregister action for the p=
hy
device, which could lead to a double-free on driver unbind, while leaving
the audio device leaked.

> +	if (ret) {
> +		platform_device_unregister(mtk_dp->audio_pdev);

[Severity: High]
Will this cause a double unregistration if devm_add_action_or_reset() fails?

Since devm_add_action_or_reset() automatically executes the action callback
(mtk_dp_unregister_pdevs) upon failure, wouldn't calling
platform_device_unregister() here unregister it a second time?

> +		return dev_err_probe(dev, ret,
> +				     "Failed to add codec unregister devm action");
> +	}
> +	return 0;
>  }
> =20
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>  	struct device *dev =3D mtk_dp->dev;
> +	int ret;
> =20
>  	mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-dp-phy=
",
>  							PLATFORM_DEVID_AUTO,
> @@ -2701,6 +2719,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>  				     "Failed to create device mediatek-dp-phy\n");
> =20
> +	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->=
phy_dev);
> +	if (ret) {
> +		platform_device_unregister(mtk_dp->phy_dev);

[Severity: High]
Similarly, does this result in a double unregistration if the devm action
fails to allocate?

devm_add_action_or_reset() will call mtk_dp_unregister_pdevs(mtk_dp->phy_de=
v)
internally if it returns an error, making this manual unregister redundant =
and
potentially unsafe.

> +		return dev_err_probe(dev, ret,
> +				     "Failed to add phy unregister devm action");
> +	}
> +
>  	mtk_dp_get_calibration_data(mtk_dp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709100617.4258=
3-1-angelogioacchino.delregno@collabora.com?part=3D3
