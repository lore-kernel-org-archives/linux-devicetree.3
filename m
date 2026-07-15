Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C6434E5F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117081; cv=none; b=TSEM5Bu3y0r+fzzZUY7DwEujYl8ziTXbKujxSr7tfYgDEu7ncVEAr6e5sCqhW1qdvT/VI4fkxvsTTjFHRCD3PQ9F1pGbgEn73nGImAerYRCkksTEnLtT7+KukTe6/PLzj5NbNfyy6xvQjUZ8wNephbUuY17PY0VT0InRpu5n5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117081; c=relaxed/simple;
	bh=bZ2jTlFKCDaq57LFLcD0v4K5dDmCD3+zrQMacvjNiyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m4C0cvRNAKwTh+n2lqygtsuu6uMEETBzkgc53j3Tx0FuKwrFPAAPJUTEj7XOXPCm1MxdV5RS9lsEsD2Rq3t0CPZ8nt1+CySAo8jCtcobyTyhZr+jSISizlJSw69ZzHjSzwYItWNlYVzbwQgYdXFbFe8xvDek5ZxMvR4gMcKHI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB924rr0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB924rr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AEC1F000E9;
	Wed, 15 Jul 2026 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117076;
	bh=39LpnGfPl1PsxPWe/OMibZQgc6ev37/IXN6dWhZZh5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OB924rr0oiWQLISPjO07OElv347yfs2zJEdPEk/apCc4lnhDEfId09Gy2sSyd4cZC
	 oSWOrZEhre9KgFcMZ2iXX2OCP2A/42SSOtWBRnEd97+mBN4qT8jZBe0OuES0stUtW3
	 lOGj+LFBwr7jK0IZUog4mqc4Nqkjx/7gvA7UrGwK6otC95qKnSWDKK4E0v5Iv0d28G
	 AVkD5TO41EzyC+WbtdOyZqqNtEUbL0MgjaUZjYI8f8hSpqfcot2XA20CCowuUTO06U
	 HxRcpi4FLbVQaOM+nWIgNTrXXK5P7Z9CjJ7vlCBT3yz6RYi7XEGTZMvs9HJA2ZNGRl
	 vtaNlTHYTYPwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/11] drm/mediatek: mtk_dsi: Enable interrupt at
 component bind time
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715114916.19690-6-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:04:36 +0000
Message-Id: <20260715120436.A9AEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe IRQ enablement before clocks are enabled leads to hard lock=
up or interrupt storm.
- [High] Data race on `dsi->irq_data` can lead to lost wakeups and hardware=
 reset.
- [Medium] Unconditional return of IRQ_HANDLED defeats spurious interrupt d=
etection.
--

--- Patch [5]: [PATCH v5 05/11] drm/mediatek: mtk_dsi: Enable interrupt at =
component bind time ---
commit dc54549e6b7ff6ba83355eb88d72dfbf4c41558d
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable interrupt at component bind time

This patch moves the DSI interrupt enablement to the component bind time and
disables it on unbind, rather than doing so during probe/remove. It uses
IRQF_NO_AUTOEN to prevent the interrupt from firing before the component
is ready.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e3d7338c35e39..d1aa258e3799c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -225,6 +225,7 @@ struct mtk_dsi {
>  	int refcount;
>  	bool enabled;
>  	bool lanes_ready;
> +	int irq;
>  	u32 irq_data;
>  	wait_queue_head_t irq_wait_queue;
>  	const struct mtk_dsi_driver_data *driver_data;

[ ... ]

> @@ -1096,6 +1097,8 @@ static int mtk_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  		return ret;
>  	}
> =20
> +	enable_irq(dsi->irq);

[Severity: High]
This isn't a bug introduced by this patch, but can enabling the interrupt
here cause a hard lockup or interrupt storm?

The DSI engine_clk and digital_clk are not enabled until mtk_dsi_poweron() =
is
called later. If an interrupt fires while clocks are disabled, the handler
mtk_dsi_irq() will read unclocked registers.

If unclocked reads return 0xffffffff, status is non-zero and the loop:

mtk_dsi_irq() {
    ...
    do {
        mtk_dsi_mask(dsi, DSI_RACK, RACK, RACK);
        tmp =3D readl(dsi->regs + DSI_INTSTA);
    } while (tmp & DSI_BUSY);
    ...
}

executes infinitely (since DSI_BUSY is BIT(31)), causing a hard lockup in
hardirq context.

> +
>  	return 0;
>  }

[ ... ]

> @@ -1381,17 +1385,15 @@ static int mtk_dsi_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, dsi);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);

[Severity: High]
This isn't a bug introduced by this patch, but is there a data race on
dsi->irq_data?

mtk_dsi_irq_data_set() runs in hardirq context and sets bits in dsi->irq_da=
ta:
    dsi->irq_data |=3D irq_bit;

Concurrently, mtk_dsi_irq_data_clear() runs in process context and performs:
    dsi->irq_data &=3D ~irq_bit;

If an interrupt fires exactly after the load but before the store in
mtk_dsi_irq_data_clear(), could new flags set by the interrupt handler be
overwritten and permanently lost when the process context writes back its
stale value?


[Severity: Medium]
This is a pre-existing issue, but does mtk_dsi_irq() unconditionally return
IRQ_HANDLED even when no interrupt flags are detected?

If status is 0, the handler does nothing to clear the hardware state but
still returns IRQ_HANDLED. Will this defeat the kernel's spurious interrupt
detector and cause an interrupt storm if a spurious interrupt triggers or if
the hardware asserts an unmasked interrupt flag not handled by the driver?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715114916.1969=
0-1-angelogioacchino.delregno@collabora.com?part=3D5
