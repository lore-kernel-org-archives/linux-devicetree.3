Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69432EEE9E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129099; cv=none; b=CccDME2kgv8l3VhMwHFhws/ysLbC7AUaSN6hLNyzwTeurVWRHseRMPIlkcYbHR8KqLPiHd9Mx8XycpuYrc2VnrSgb//0u1hBy5B1FbN8AAqG561fXjgAhbHWbIFaRJsheAnje9Tod+b1BuWdoIRPcXFGWJANOjVJZWiNojQJ+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129099; c=relaxed/simple;
	bh=/y7WcDu9L2JlkVTeAC5aQykYA4fENdiTgxp6Wdt5OC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VF/oTA70gasX3+wERz6dYDP+M2PL5JYbQJEAZqcVhL+sE4FEEvJwCptdLkqIxSRFpraTCfFwBSV5NU38RjkjUkCNQU0+0jQNRfVvkAkjbS7z/4wqQCvpVzsbPn44w13+d/ppc2KYWKqexxLGXfqKX9gB1yKeNr3PBQgQ46aOkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PygKZFFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PygKZFFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5B11F000E9;
	Wed, 15 Jul 2026 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784129098;
	bh=L423TE7X/BCpDwHbLIA9sLbZDz4yVEqD45bUw5QhOEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PygKZFFq4a3EIUTu9GuE1QQnGHMng+VO762pYhfJAkT0d10vlprKTxoFjvo5Dixsj
	 Ikg0lidWLzpTUbM7LBxv0mzWIjpfhQ6RGCNqpHoZcatMD/bQlelXkjGwPGn1qRA4Oa
	 CTmb15AC+eds+Lqau0OWqijEAvGr9WNyaamkaYd6w3fq2xj8T5dqtRqSIH5ruP5G4u
	 WzSeYVbebJk+FmGPWhx4MVmw2+3iHZCaFpzCH21H4bxlyZum9j49/JVZPx2lYbrYQz
	 AgZVPkvjCuMdLK/Cls0U65QfrYCZvYHjQsjmjRBvQj7r653AB+aVsZ4MZXSRaEfkQK
	 fgVVhtxfSsT8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260715135703.46540-10-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
 <20260715135703.46540-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 15:24:57 +0000
Message-Id: <20260715152458.1A5B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Enabling PM runtime for the DSI device causes its power domain=
 to be turned off, but it is never properly resumed, and multiple hardware =
access paths lack PM runtime checks. This leads to bus faults, system crash=
es, or hard lockups on register access.
--

--- Patch [9]: [PATCH v6 09/11] drm/mediatek: mtk_dsi: Enable PM Runtime on=
 probe ---
commit 7ae5fcbe79f5f5488a2a9688fd56572adf6bd2e9
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable PM Runtime on probe

This commit enables PM Runtime at the end of mtk_dsi_probe() to allow the D=
SI
device's power domain to be managed dynamically.

>     Enable PM Runtime at the end of mtk_dsi_probe() so that the
>     mediatek-drm mtk_ddp_comp_power_on() function is able to do
>     pm_runtime_resume_and_get() and, analogously, the function
>     mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
>     device.

[Severity: High]
Does mtk_ddp_comp_power_on() actually get called for the DSI device?

Looking at mtk_crtc_atomic_enable(), it appears to only call
mtk_ddp_comp_power_on() for the first component in the display pipeline:

drivers/gpu/drm/mediatek/mtk_crtc.c:mtk_crtc_atomic_enable() {
    ...
    struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
    ...
    ret =3D mtk_ddp_comp_power_on(comp);
    ...
}

If the DSI device is at the end of the pipeline and bypassed here, wouldn't=
 it
remain powered off?

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d2fdeaeb97bea..9f69b237c9116 100644
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
> +

[Severity: Critical]
Once PM runtime is enabled and the device can be powered off, does this
introduce bus faults in paths that access hardware without PM runtime check=
s?

For example, mtk_dsi_host_transfer() accesses registers directly without a
preceding pm_runtime_resume_and_get():

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_host_transfer() {
    ...
    dsi_mode =3D readl(dsi->regs + dsi->driver_data->reg_main[DSI_MODE_CTRL=
]);
    ...
}

If downstream panel drivers invoke this asynchronously during probe, could
this access unpowered registers and trigger a bus fault?

Similarly, if the interrupt handler triggers while the device is powered of=
f,
could it read ~0u from DSI_INTSTA and enter an infinite loop?

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_irq() {
    ...
    status =3D readl(dsi->regs + dsi->driver_data->reg_main[DSI_INTSTA]) & =
flag;
    ...
}

Would it be necessary to use pm_runtime_get_if_active() in the interrupt
handler and ensure other hardware access paths resume the device first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715135703.4654=
0-1-angelogioacchino.delregno@collabora.com?part=3D9
