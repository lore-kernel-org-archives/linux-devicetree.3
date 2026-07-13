Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE028B4FA
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953822; cv=none; b=ZCwUUPJqxH1956CSon7kkiJSTPJMWlEsWgf6J+4dsKkapafsCYLcvLvbYABqIzzWT+v6ea/Fd/VVc0fNkFjFZ2yQbIKqdIWxGItqsmNaEyB/at8UwOiKn7aC/CkpZnSRzSIsHDDQDVi2ewyN712lCXGfARPQ2fT0r1ex3A2Wb+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953822; c=relaxed/simple;
	bh=rmC790qnIZ32EslBJHZLzm9GsJY0sN1qQe8j6pHWf2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kN3mV2lpznsf5C/i8PcUxnb7tVq7SyACj0p22DEOCXLlfRj0XMdT8oJHQorz9Gf5h/cj9m6Sf9WdwSTXJP8lg/MYi3ADKaI/Ju52IRUpUPWmrw72Xia57XUOq9y+Ovr8hpMGxNAwPymTByBravZ8fyK3WRYq7Eej1AkNrwtXC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei0dlKKU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei0dlKKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736B11F000E9;
	Mon, 13 Jul 2026 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953820;
	bh=t/uW7Ax2+UyvYsNj4DEF0DxvIrvF+3VrzqbEwGASQPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ei0dlKKU+xOS52awl31Vj44IZjocKd6JB3r15dNVcc772Z71aTKXdQMFO50gJBqWb
	 5jfDSpto1Bz9tKIWK171rcBgsqL/dcn9CNxccbDlsulN0W7/6PuKRgk6lpIAEjar3I
	 VTPHDMjHXsSFdOlOqAQdbHLeJ/UY/gl+VEnRwdWfMiOzfZKYgRFCinw7j/HEsD/FMu
	 k38tyJKnrHOcEMZLfUHmObl1D9gi4HLMlKo91n6jEp6nXmhMHQ/jzsZ9BT5kgW/6Ks
	 HCG3YAFlWSSuhrFTf1tFAzblkT2tG2LcZOnpcmjAdVYyf+pJowktJPOEMhDgLEmxno
	 R6bqXVxDQQqXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/10] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713142746.40259-5-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
 <20260713142746.40259-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 14:43:40 +0000
Message-Id: <20260713144340.736B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of DRM encoder when device_reset_optional() fails =
in mtk_dsi_bind().
- [High] Read-modify-write data race on `dsi->irq_data` between process con=
text and hardirq context.
--

--- Patch [4]: [PATCH v4 04/10] drm/mediatek: mtk_dsi: Enable interrupt at =
component bind time ---
commit 0607d3868a389c4103df3225d2bc7a47d44df3b0
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable interrupt at component bind time

This patch requests the DSI interrupt with IRQF_NO_AUTOEN and enables it on=
ly
when binding the DSI to its display controller component master. This preve=
nts
interrupt storms and delays caused by timeouts during probe.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 8ab5c3431dbbc..e24e7b91a3618 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -1090,7 +1091,13 @@ static int mtk_dsi_bind(struct device *dev, struct=
 device *master, void *data)
>  	if (ret)
>  		return ret;
> =20
> -	return device_reset_optional(dev);
> +	ret =3D device_reset_optional(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leak
the DRM encoder?

If device_reset_optional(dev) fails, it returns without calling
drm_encoder_cleanup(&dsi->encoder). Because the component bind operation
fails, the component framework will not invoke mtk_dsi_unbind(), meaning
the encoder is never cleaned up.

If the DSI driver is subsequently unbound or removed, its locally managed
memory is freed while the encoder is still linked in the DRM core's list,
which could lead to a use-after-free or kernel panic when the list is
traversed.

> +
> +	enable_irq(dsi->irq);
> +
> +	return 0;
>  }
[ ... ]
> @@ -1375,17 +1383,15 @@ static int mtk_dsi_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, dsi);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);

[Severity: High]
This is a pre-existing issue, but is there a read-modify-write data race on
dsi->irq_data between process context and hardirq context?

mtk_dsi_irq_data_clear() modifies dsi->irq_data using &=3D in process conte=
xt
(from mtk_dsi_host_transfer()) without disabling interrupts or using atomic
bitwise operations. Concurrently, the hardirq handler mtk_dsi_irq() modifies
the same variable using |=3D.

If a DSI interrupt fires during the process-context read-modify-write
sequence, won't the flag set by the interrupt handler be silently
overwritten and lost when the process context stores its computed value?

This could lead to hardware interrupt events being lost, causing timeouts
in mtk_dsi_wait_for_irq_done() and potentially breaking display
initialization or frame updates.

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713142746.4025=
9-1-angelogioacchino.delregno@collabora.com?part=3D4
