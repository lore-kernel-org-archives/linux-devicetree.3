Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84746EF90
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463418; cv=none; b=bdrAM7r4ntwdZcrOfe48rkVs8RrPjGUSZG+uFdwZgzX11PLlkv5s77/GPhzKvW+BzKe/Fh8dR4n23mNXYk6G2HNRjOGTy1D/7Vt1KY4tVrJqbCUOOL850TLboldCvUVlu+GdPzp1X463VcUIkPRrIjzsPyzvMENQh8suKZ2Vy+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463418; c=relaxed/simple;
	bh=fvw63ZyHbMNCDUCp1Gx0H2Ltbl78m10g/6U6w2q+a+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qDDJP0O231VDHJ8/LfyYtC1nk6RuZ1iQ1QhVahoAaN0qfFZ4ExncJOOE8FeOMM0CQNdIi/q6IAZMZ7He4ZKDJnOlD2xHLekAejcUQLksOf7xH4UbCAibJOZiOJ6PVCLA8+l0jgdxmAxrYVZ8S+h6voGMG8zXjT6U0pv7gbq6Hys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alxTWzoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alxTWzoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA68F1F000FF;
	Tue, 15 Sep 2026 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789463416;
	bh=xpj5WMQ7dBMU8kwDnpU9Tb8xxmWtV6nLn6xV5U/cpio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=alxTWzochYmFbNsHf7ZTtZc1WFAwETZqymTr4kFj6UAhbjopHk8D41lSY48walkYW
	 uhjlCsFdo5wG9SpUB1S7NgyILowxN53ac/bRRn+tkJEZrTPxswLmHK5gTeXwU4Lcr8
	 Kc5EjWVX9S9QAStpbEb+ab6WGcn3VX1wACf0HXrqKLHKKcQie48uDPRlPsIDfT88VT
	 QCc6T5olNB8154cHukj6MZChV2l31MlpWFTkPDjPjZGR2FLBZmjY+iB3Sj7UItEprb
	 ZjaQTwQk+MFnhWaURpbI1c0TT5iDEvWZAjOONrzc8BQ1+sG/3pTRGrzyL9wL8vbi1F
	 HDk4xaQKcQbgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260915084148.11385-12-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
 <20260915084148.11385-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:10:15 +0000
Message-Id: <20260915091015.DA68F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/mediatek: DSI device is never resumed causing bus hangs
--

commit 6c75df0d91773376b0709ec5e7caceb104ea2e16
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

    drm/mediatek: mtk_dsi: Enable PM Runtime on probe
   =20
    Enable PM Runtime at the end of mtk_dsi_probe() so that the
    mediatek-drm mtk_ddp_comp_power_on() function is able to do
    pm_runtime_resume_and_get() and, analogously, the function
    mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
    device.
   =20
    This makes sure that the power domains for the DSI IP are
    turned on and off when necessary.
   =20
    Reviewed-by: CK Hu <ck.hu@mediatek.com>
    Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>

>     Enable PM Runtime at the end of mtk_dsi_probe() so that the
>     mediatek-drm mtk_ddp_comp_power_on() function is able to do
>     pm_runtime_resume_and_get() and, analogously, the function
>     mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
>     device.

[Severity: High]
Will mtk_ddp_comp_power_on() actually resume the DSI device?

Looking at mtk_crtc_atomic_enable() in drivers/gpu/drm/mediatek/mtk_crtc.c,
mtk_ddp_comp_power_on() is only called for the first pipeline component:

mtk_crtc_atomic_enable() {
    ...
	struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
    ...
	ret =3D mtk_ddp_comp_power_on(comp);
    ...
}

Because the DSI device is at the end of the pipeline rather than the first
component, it won't be resumed here.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 6f176515e2587..4355103725cf6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1734,6 +1734,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
> =20
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Since PM runtime leaves the device in a suspended state by default, won't t=
his
cause bus hangs or system error crashes when accessing hardware registers?

Furthermore, DRM atomic helpers call bridge atomic_pre_enable() callbacks
before CRTC atomic_enable() callbacks. This means mtk_dsi_host_transfer()
in drivers/gpu/drm/mediatek/mtk_dsi.c will attempt to write to hardware
registers before any CRTC-level power-on is attempted:

mtk_dsi_host_transfer() {
    ...
	dsi_mode =3D readl(dsi->regs + dsi->driver_data->reg_main[DSI_MODE_CTRL]);
    ...
}

Will this result in accessing a powered-off PM domain?

>  	ret =3D mipi_dsi_host_register(&dsi->host);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to register DSI host\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915084148.1138=
5-1-angelogioacchino.delregno@collabora.com?part=3D11
