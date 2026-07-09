Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B13F5BF5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594012; cv=none; b=EGfsG0ZxOA3cdAnleELqujGO9j8Oqr73T0FIhSUzHTuGzDI4K61iss0XKQPbfnKiI4CkHlcje/1LnGsZzJUdh6KeNmgIzzX2X6XE81l4EK3dcKaFUjRTbuPdjPwrfFkwv3RotDIN9LMEX8F0NclU8WxxpfLSu+GB4Wc0Yq4c6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594012; c=relaxed/simple;
	bh=J4F8tkobiRk9bPwGq7ZObULf4JIDuhF/WM3lcn+/1Ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EQjBXfAHVqouQxM5vTNJMf/GeJPS1AVardlxN7Af47M3owhC6eHEexupW9qJTVEr/qIC4oNjSN0xz7SXp6NIaJWAjmS+fq2bF7ZB94kid9YQAG3qjXjXuXlVPSc8EtOOzMQk6lecfW7u6t/9S5/K8JAUvUxYW+QduB6M7bCrFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtYb4snC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtYb4snC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBE51F000E9;
	Thu,  9 Jul 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594011;
	bh=q7ScW9hJpjng45n+X/4/5Xe8MZhmqsiLLYoixjG84RQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KtYb4snCcoipava9zr2sU5riBZE5uo3l+Mk3D3Rs3/cVNfL014gOgtuPX147vNfwW
	 VD740rriun0D23eoz5UE1sBlkBfnSxabqVk5Rn6VxMJX3bT1q/8CoSBBFQWyHmjs7G
	 xpabMU5zhmk/XI8yFgfh5b57j2ycYRfSqQmCWsUzg/VbFx2XNWPJ5edCqZi4CKT0EO
	 vGpb3/bT7ZxMb5KmU7PI2lSlpWjfPb5U+0lmOCNwFqBL7gtgVRs085QdXfah4p8te4
	 L6Y80bEkCIx9dvbJDeaykCQVghEPTAKJqiLk0ebXPAnq4FYWTs5ZG7M9o27JcvKaLT
	 ae6fkFdFOgVBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy
 driver unregistration
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709103431.46616-4-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
 <20260709103431.46616-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:46:50 +0000
Message-Id: <20260709104650.BFBE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Double free / use-after-free of mtk_dp->phy_dev on devm_phy_ge=
t error path.

Pre-existing issues:
- [High] Asynchronous pm_runtime_put() used immediately before pm_runtime_d=
isable() leaves hardware in incorrect power state.
--

--- Patch [3]: [PATCH v3 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and ph=
y driver unregistration ---
commit ee2a644d342bfbaa916286b22d4e54ddc62e5878
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration

This commit adds devm actions to unregister the HDMI Codec and DisplayPort
PHY platform devices during probe. This prevents multiple instances of these
devices from being registered if the driver probe is deferred.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index eefbc7e0f9c8d..fefd1fae44c90 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
[ ... ]
> @@ -2701,6 +2718,11 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>  				     "Failed to create device mediatek-dp-phy\n");
> =20
> +	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->=
phy_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to add phy unregister devm action");
> +
>  	mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
>  	if (IS_ERR(mtk_dp->phy)) {
>  		platform_device_unregister(mtk_dp->phy_dev);

[Severity: Critical]
Does this create a double-free on the error path?

Looking at mtk_dp_register_phy() in drivers/gpu/drm/mediatek/mtk_dp.c, if
devm_phy_get() fails (returning e.g. -EPROBE_DEFER), we manually call
platform_device_unregister() here.=20

However, since we successfully added the devm action earlier in the functio=
n,
returning the error from probe will cause the devres unwind mechanism to
execute mtk_dp_unregister_pdevs().

Won't that call platform_device_unregister() a second time on the already-f=
reed
mtk_dp->phy_dev pointer, resulting in memory corruption?

[ ... ]
> @@ -2870,9 +2892,6 @@ static void mtk_dp_remove(struct platform_device *p=
dev)
>  	struct mtk_dp *mtk_dp =3D platform_get_drvdata(pdev);
> =20
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to call
pm_runtime_put() immediately before pm_runtime_disable() here in
mtk_dp_remove()?

Since pm_runtime_put() queues an asynchronous suspend, calling
pm_runtime_disable() right after it cancels the pending suspend work.

Doesn't this leave the hardware in an active power state after the driver is
removed? Should this be changed to pm_runtime_put_sync() to ensure the susp=
end
completes before module unload?

>  	if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
>  		timer_delete_sync(&mtk_dp->debounce_timer);
> -	platform_device_unregister(mtk_dp->phy_dev);
> -	if (mtk_dp->audio_pdev)
> -		platform_device_unregister(mtk_dp->audio_pdev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709103431.4661=
6-1-angelogioacchino.delregno@collabora.com?part=3D3
