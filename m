Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69E481AB2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909179; cv=none; b=PlCz6TAUl5Ddf0xD75h/ayWjLHoQrKGn+hrIQD8Mn1IcodKs60TRFFiQAQ3EnFpnBNsYCFSI08tvcQNawDtU1ZI0r556en8WX1IVYKAlyJoXEUEYv3iduCC9Cnu8C029HfoUGKxxbErjJu70boJfRu8hmIK45DSYNpxDoDP143U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909179; c=relaxed/simple;
	bh=Pl/jaYutAsLOekERsjFqYW4Vc6EzbCUDbOIg698qPwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ICLttNF9m5kwkMBJRkC+v91RPJROtr1titl0Re1INAw85s6XNskP2r6mQEsOE0JxqaMSPmRnX4vW2JOjd/gEcGjXw5hB6a9nmOyXIpyLLcIh/eRQTWKbCnu1qNtIGHRq/fYBWUhS+JnwK0d6U7hJ/zPkdm+5xifOCHXRp0GUHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtV9vcWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtV9vcWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264E41F000E9;
	Wed,  1 Jul 2026 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909178;
	bh=8Wqg6vwaB2WZcRomvBZS2whfJdMLY3bMu1eEIH5uhrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GtV9vcWeJa0Nq6CgkhRbuoYd0UToILJgOt6KFUCQXj249tPrBcwd0SVv6ZIFmXNab
	 OHydU4ZvDxmvOCYo+qlP2hTrkFAmJHIWcCSn8rOaJKBIDslsFYgCcuY5U3t/g9rPYq
	 5lIqyvlPsC/BsbLnStMYX4OnCSfWh9iuUy4mp1g/4OjKhapzhQ3YXFFnRIytikXIuD
	 UGGYsLwrsEGCvR/Mwgo0H4eX0QWLlP9goTLkbzKuLjbQhzUIv6vvHhsEzXAG/T5EK4
	 zjrBX6h9Ss+dAfqXybFL4cu/58vg9zq3UG2R3FfzA8Ploqoqd5hcf3CyHLMXYxEzue
	 WuktBJtzqUW/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy
 driver unregistration
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260701122024.19557-4-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
 <20260701122024.19557-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:32:57 +0000
Message-Id: <20260701123258.264E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double unregister of platform device in error paths causes Use-Aft=
er-Free
- [Medium] Incorrect pointer passed to devm_add_action_or_reset causes reso=
urce leak of audio platform device
--

commit 2bc8391d481088826fa13d96d05225e5c15e6457
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration

This commit introduces devm actions to unregister the HDMI Codec and
DisplayPort PHY platform devices, preventing multiple instantiations
during probe deferrals.

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

[Severity: Medium]
Is the correct platform device pointer being passed here?

This registers a cleanup action using mtk_dp->phy_dev rather than the
newly created mtk_dp->audio_pdev. This will likely leak the audio device on
probe deferral or driver unbind, and may attempt to unregister the PHY devi=
ce
at the wrong time instead.

> +	if (ret) {
> +		platform_device_unregister(mtk_dp->audio_pdev);
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
Could this cause a use-after-free?

When devm_add_action_or_reset() fails, it automatically executes the cleanup
action, which calls platform_device_unregister() on mtk_dp->phy_dev. Calling
platform_device_unregister() a second time here would double-free the devic=
e.

> +		return dev_err_probe(dev, ret,
> +				     "Failed to add phy unregister devm action");
> +	}
> +
>  	mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");

[Severity: High]
Can the error path for devm_phy_get() also trigger a double-free?

Looking at the rest of mtk_dp_register_phy() just below this diff:

mtk_dp_register_phy() {
    ...
    mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
    if (IS_ERR(mtk_dp->phy)) {
        platform_device_unregister(mtk_dp->phy_dev);
        return dev_err_probe(dev, PTR_ERR(mtk_dp->phy), "Failed to get phy\=
n");
    }
    ...
}

Since the devm unregister action was successfully registered above, returni=
ng
an error here will trigger the devm unwind loop. That will unregister the
device a second time after this explicit platform_device_unregister() call.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122024.1955=
7-1-angelogioacchino.delregno@collabora.com?part=3D3
