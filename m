Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50A44B663
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117773; cv=none; b=IorW0pAi2kL4N6nDFygwhuBDeFbvBt2EYArGaFs2aegF4WCAuEUipAEIRe+YA3uC2VcWCDqk2OOhuUDBXFvvP2oN1rLnKUM7+mf1satVV0DjaFc+dVuHsLZS3DyGU4Q3oipqxHX8CNw+hMcT/LEo5HP3wIZBWCUuhmZoO6VJEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117773; c=relaxed/simple;
	bh=QxzK8XXntq2R1kM8gdqpulsQjVgmjcKiLADzEDk75U0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RFPaEVf7Egq/zxJdgnBUUbA4qWlx600p0YYt713Elk33gpLduoXURt6uASISxIQaX3vFNLJqZ+oG7r4pMKXM0VGP4te/VfdgHEI7X0HOZJQKAnHicrbsJYVVFBGUZo59z7C2SKpTlmK8joAx368PRUM++KVi4W7yfrcrfrNN+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WERkBgi9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WERkBgi9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420601F000E9;
	Wed, 15 Jul 2026 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117771;
	bh=Aju1Nm/1Oz33HHPZzL+hjfKIwC7EYZvZoblTL7P+vPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WERkBgi9UzGHznyTGWlVsWqQbuRGdVtr/BEPBuyCa9LQ5gP/G8qTjdy+o+WD2ukvs
	 46fq9j1gkoj1WpVAmMcH6z5+PNxy5+6hl0l6R/mv5YI9iVOqVbT1KOZjUyd5JQhdAB
	 03vogw+Lm760nzS043H/y0O7J/jugOjSt4P2umEB3AeiXDsMtE+bBKBas1KTdJ6rym
	 ETfQrbIbD6lgZRtNL4cj9M5yLQSq93kGSgMct4/tb2Ae9ZDGSncqw2cONBBYT5/stm
	 xKbOaxuag/cw8UP+GDtXFnUeOLRAQ85SjzJw8igMie4HetKPvFV0UeCLD7SVA8XQ9y
	 3EHcG0YSp5e9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715114916.19690-10-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:16:10 +0000
Message-Id: <20260715121611.420601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Enabling PM runtime causes a kernel panic because the DSI devi=
ce is never resumed, leaving its power domain off during register access.
--

--- Patch [9]: [PATCH v5 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on=
 probe ---
commit a4d6ef16908de6080f4fae3e792889c6f09b7a22
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable PM Runtime on probe

This commit enables PM runtime for the Mediatek DSI device during probe.
It assumes the display pipeline's power-on functions will handle resuming
and suspending the DSI device to manage its power domains.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 4d8a02cbee385..dc0c4e867179c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1733,6 +1733,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
> =20
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

[Severity: Critical]
Will this cause a kernel panic when the DSI registers are accessed later?

The commit message indicates that mtk_ddp_comp_power_on() will handle
resuming the DSI device. However, looking at the display initialization,
mtk_crtc_atomic_enable() only powers on the first component in the pipeline:

drivers/gpu/drm/mediatek/mtk_crtc.c:mtk_crtc_atomic_enable() {
        ...
        struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
        ...
        ret =3D mtk_ddp_comp_power_on(comp);
        ...
}

Since ddp_comp[0] is typically an OVL or RDMA component rather than the DSI,
the DSI device is never resumed and remains in the RPM_SUSPENDED state
with its power domain off.

When mtk_dsi_poweron() is subsequently called, it attempts to access the
suspended hardware registers:

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_poweron() {
        ...
        mtk_dsi_enable(dsi);

        /* Bypass shadow and force commit only if the register is present */
        if (data->reg_adv[DSI_SHADOW_DEBUG])
                writel(FORCE_COMMIT | BYPASS_SHADOW,
                       dsi->regs + data->reg_adv[DSI_SHADOW_DEBUG]);

        mtk_dsi_reset_engine(dsi);
        mtk_dsi_phy_timconfig(dsi);
        ...
}

Does mtk_dsi_poweron() or an earlier path need to call
pm_runtime_resume_and_get() directly before accessing these registers to
prevent a synchronous external abort?

> +
>  	ret =3D mipi_dsi_host_register(&dsi->host);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to register DSI host\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715114916.1969=
0-1-angelogioacchino.delregno@collabora.com?part=3D9
