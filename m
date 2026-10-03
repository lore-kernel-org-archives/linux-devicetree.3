Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE83243956
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058217; cv=none; b=IMSD8cXFHlAi1/4X7Mbq8fmEXpq5WWopsmu2hgpIKAyQkzSUJEC1n8e2x71TbBOjI8x9/Ptp4ASPuPIYHNurxpHIF41ElyTeGuJ2V0ZX5cxiDhPFqMASepZFCK8jMkokH/kwzMY5KHrY6Cv99F9+frDBKhQE6xD542srKXKPoNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058217; c=relaxed/simple;
	bh=sLN1eo8lwb5IFUaLoTRTLumwuBvlRjSS0xgAppe3E3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KxAZMYe3lTxaqXQ/QuWuoXM5dFbT3GK+XsBgODR5DYPql1gUqHiSZa1x2qC/2gB60QYq104cJsVqTwGRztvahGpI+RyJEXQE1OEuee91p1or3DkI86CjT+rwYJW2q/g7NA3lua+AOt9cWauGNvACYXsV3gjoc7uHZkKU4hkHox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFK8LsgS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFK8LsgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C438D1F0089B;
	Sat,  3 Oct 2026 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791058216;
	bh=vr4VxuY3j5kTfi3HwmBG3/nw0GpNnXp1kOORnsrxPAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFK8LsgSArG2c5TD1d2so39u4QeMXJjN9wnRpAedZLfqAnQZZgCVvj5FLPH6ASzgn
	 SCMFqFSj61ZXfwWj6HwOYNG0OuWO36FGa7efXaEZUbQSWrB673KyOdnrdGgPDHYUuU
	 YGyPXS3horcpa3ejlQqU+zICrvgeMs1y6lEf3cD7Q7nqx6ZT+I5oQCod9gg5xZqoeP
	 ctYN5SP2ouBU5lVB0Ll2vK6d0JcfOqPsMkHNFLdhq4hNKpZ2/kNct22ZqnW2t/90Mz
	 5jTGj5xBdOJ7GO+Q9upjAyGllIwrtU2828KBy6bTWftkk2LXztmRYc+EpxSnKls+5T
	 xZGLJeKN69ldA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/panfrost: Enable the GPU timestamp counter on
 MT8188
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261003200132.866240-3-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
 <20261003200132.866240-3-michal@nozomi.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:10:15 +0000
Message-Id: <20261003201015.C438D1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panfrost: missing error propagation for MFGCFG regmap preven=
ts probe deferral
--

commit 93148a7d7b8819bdd74ff76c5e5b0fcc15b88cbf
Author: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>

drm/panfrost: Enable the GPU timestamp counter on MT8188

This commit adds a vendor quirk to enable the GPU timestamp counter on
MediaTek MT8188 SoCs. It looks up the MFGCFG block regmap from the device
tree and sets the required enable bits on power-up to ensure timestamps
are correctly reported.

> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index 29ac0dce5ff89..971abc9cc222c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
[ ... ]
> +static void panfrost_gpu_get_mtk_mfgcfg(struct panfrost_device *pfdev)
> +{
> +	struct device_node *np;
> +	struct regmap *regmap;
> +
> +	np =3D of_parse_phandle(pfdev->base.dev->of_node, "mediatek,mfgcfg", 0);
> +	if (!np)
> +		return;
> +
> +	regmap =3D device_node_to_regmap(np);
> +	of_node_put(np);
> +	if (IS_ERR(regmap)) {
> +		dev_warn(pfdev->base.dev, "failed to get MFGCFG: %pe\n", regmap);
> +		return;

[Severity: Medium]
Should this function return the error code from device_node_to_regmap()
instead of returning void?

If device_node_to_regmap() returns an error pointer (for example, due to pr=
obe
deferral or memory allocation failure), the error is swallowed and the probe
path continues without the regmap. This can cause the GPU timestamp counter=
 to
break silently, leaving userspace queries reading zero.

> +	}
> +
> +	pfdev->mtk_mfgcfg =3D regmap;
> +}
[ ... ]
> @@ -519,6 +556,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> =20
> +	panfrost_gpu_get_mtk_mfgcfg(pfdev);
> +

[Severity: Medium]
Since panfrost_gpu_get_mtk_mfgcfg() doesn't return an error, panfrost_gpu_i=
nit()
proceeds despite the failure to acquire the MFGCFG regmap.

Would it be better to propagate the error here so that the driver can prope=
rly
defer probe or fail robustly when the necessary resources aren't available?

>  	err =3D panfrost_gpu_soft_reset(pfdev);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003200132.8662=
40-1-michal@nozomi.space?part=3D2
