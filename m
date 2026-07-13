Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830923D1A8F
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953785; cv=none; b=p37k/geWcxZOb4raYOhoi4t89nRoNVj9MoC7KmezU6l8RqQx+3l8gxRJdQPifWnRimgv0GcpGfpy46D1Do50E7nvEEEJtXl4vvVfyXtw9Tg4tkICQ3i6sDXWyd+49ehfwRyQx6jkEGsO1qSXQb7o3qw6YWUN1Q8QMLvAvla/tXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953785; c=relaxed/simple;
	bh=BamuV/RNO8DYQqKIsACHHso0H5lMXea/nknYCbbMrDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KCUKooyCTED3Ra4Sc/ZWSGxLdWE8QKhrTfmQm8z0iqc6QOZOQywFQxap3a0WOnH5uvDLA3WYCPLQWInJWiZj16sx+XAt4xtIbMQ9aOo76x+o+n8IoVfnTw1l8xwfHfWkb7dGYA/vy7b/qNDLELlslBE40+JiSIFqKa19YahHbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDUiXnWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDUiXnWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147C1F000E9;
	Mon, 13 Jul 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953784;
	bh=q3yOsUZV9nSjWdLN0XIHkqbrgl9sxp0I9eodHAtdT38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mDUiXnWZJq7MhLxTYXWsIlrTPPUjGrNFg1YluBkHxKGQtsKLxC3/qIZkjVn03xYz4
	 t79AaBBwgbgaOYtaxn1FXOULvlLaCggbR0BaGgtVWspJDDxjbzIIMNdVxp3NNViwJi
	 YZmdPi28/u8L3zxtUGGSsPy2/pqkcYPsvS0jQ0I6KZ7oN/xgFGel9wlbzOo6GUe58i
	 oamkTuykodJTfZkl22DN0kG+QrjVTwfcHSPwH7p244mYgZFTHUw/7/BM8KnjLzsMIm
	 yaWgDq03nZ6PpoDkD/sBna1eLK3+Npr32rLptcSvR+TONaXTSh7atC/QQNMIS+Gf4Z
	 SKQFExxRX9hdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713142746.40259-9-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
 <20260713142746.40259-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 14:43:02 +0000
Message-Id: <20260713144303.D147C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Enabling PM runtime leaves the DSI hardware permanently suspended,=
 resulting in system crashes during unpowered MMIO register accesses.
- [High] The IRQ handler accesses hardware registers without verifying the =
device's PM runtime state.
--

--- Patch [8]: [PATCH v4 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on=
 probe ---
commit 7ce79b5636ac6fccf8b21d5b0f6a67f31c6b10eb
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Enable PM Runtime on probe

This commit enables PM runtime at the end of mtk_dsi_probe() to allow the
power domains for the DSI IP to be turned on and off when necessary. The
commit message assumes mtk_ddp_comp_power_on() will resume the device.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 93bc507d77e20..1726f5a2683cf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1731,6 +1731,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
> =20
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
The commit message states that mtk_ddp_comp_power_on() will resume the
device. Is this assumption correct?

Looking at mtk_crtc_atomic_enable() in drivers/gpu/drm/mediatek/mtk_crtc.c,
mtk_ddp_comp_power_on() is only called for the first component in the displ=
ay
pipeline (comp[0]), bypassing the DSI component entirely.

Furthermore, even if mtk_ddp_comp_power_on() iterated over all components, =
it
executes after mtk_dsi_bridge_atomic_pre_enable(). The pre-enable hook calls
mtk_dsi_poweron(), which directly accesses hardware registers:

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_poweron() {
	...
	mtk_dsi_enable(dsi);

	/* Bypass shadow and force commit only if the register is present */
	if (data->reg_adv[DSI_SHADOW_DEBUG])
		writel(FORCE_COMMIT | BYPASS_SHADOW,
		       dsi->regs + data->reg_adv[DSI_SHADOW_DEBUG]);
	...
}

Since the PM domain is still powered off at this point, will these direct
MMIO accesses cause a bus hang or system crash?

[Severity: High]
Now that the device supports PM runtime, can the IRQ handler run while the
device is in the RPM_SUSPENDED state?

The interrupt is unconditionally enabled in mtk_dsi_bind() and remains
enabled at the IRQ controller level even when the device is suspended. If a
spurious or delayed interrupt fires, mtk_dsi_irq() directly reads the
hardware register:

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_irq() {
	...
	status =3D readl(dsi->regs + dsi->driver_data->reg_main[DSI_INTSTA]) & fla=
g;
	...
}

Should the IRQ handler use pm_runtime_get_if_active() before accessing
hardware registers to avoid touching unpowered hardware?

>  	ret =3D mipi_dsi_host_register(&dsi->host);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to register DSI host\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713142746.4025=
9-1-angelogioacchino.delregno@collabora.com?part=3D8
