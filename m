Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E2442399
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720287; cv=none; b=XciA0v+BVkngZFu+quZnmsJd6z+WtHJ3QvWgxd35TMWtGP8pudIADRHIu0lydEsfgW5GayRBIUdMtuS0xzAVIpXi67hced0zNbKPAHrX8b6pjTACjQaMhSnFNDHnPIlPtZ6Z1F9iIA3sB9Mr8SaobCuyg9uF8nBZzUu2fpu4m0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720287; c=relaxed/simple;
	bh=R1t2FBhkRi4LNBCsZsgJPsck0rXmiGKHdN+MGmN/m2w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T2tKBLsmKrCOUXaAtHo840SUYX+r6nlCTs2eiZFuHpHH/+2vGPGeatrKmkZdBPdDriBIaMDF7BEX5BXNGQl4+0BRag0lRn43wafmFMpWxuJ3pBXDxyZEzyVK2pD73exPDucwfMEtmtJ27LmJhH258clzEpYdz8FO/+2Vqrwx2fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8Ycmk5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8Ycmk5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D216F1F0089C;
	Sun, 11 Oct 2026 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720276;
	bh=+6X75983Jhxd5TuPC2cPCEOCJ+Bg55ldHZ0/k66h+AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K8Ycmk5VidjLgZVAnZ5Or8u1in8NTXTOf9Af2+zcTGwNROycrbWix4ILChWxVXyj+
	 sJTvad6W7whtvsQ2i4zOVuOP0tN8EK14RMxNUYhpLGUvT02vAKiAEa/ydxWtW1idJT
	 KN1c59RmJg+ATZFrHL5/7wnGgO1Wp3T/MK3DOkg+pd/ZWv4lYvRy8AZXk4gdhIx4Ff
	 L2nYEovmtGcQrPU6csirzAb2pZdRp0T73wD9Eo9BxQXEaV4N8r7B4VjtJy7XeCqexo
	 IVmEPymoiB4fP4q4ugOBtSOnW+LWExQ8W5PFHgAcD6CDOuV4Wpf3m27momSfXuLsHj
	 S+EwKXn0nD1Zw==
Message-ID: <sashiko-outbox-167211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] drm/panel: novatek-nt36672a: Add Tianma panel
 for Xiaomi Mi A2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261011-nt36672a-panels-v3-7-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-7-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:04:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panel: nt36672a: regulator leak in nt36672a_panel_prepare() =
error path
--

commit 55c52ad322748f420246cd3fb678326e61c47140
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

    drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
   =20
    Add support for Tianma TL060FVXS16-00 video mode panel based on
    Novatek NT36672A, used in Xiaomi Mi A2 smartphone (xiaomi-jasmine).
    It shares some code with already supported panel in this driver
    for xiaomi-lavender, so we can reuse the same panel deinit function.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index d356348d39608..48dff2279b0e9 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
[ ... ]
> @@ -552,6 +575,39 @@ static const struct nt36672a_panel_desc tianmaplus_e=
7t_tulip_panel_desc =3D {
>  	.send_deinit_cmds =3D lavender_tulip_deinit_cmds,
>  };
> =20
> +static const struct drm_display_mode tianma_jasmine_panel_default_mode =
=3D {
[ ... ]
> +static const struct nt36672a_panel_desc tianma_jasmine_panel_desc =3D {
> +	.display_mode =3D &tianma_jasmine_panel_default_mode,
> +
> +	.width_mm =3D 68,
> +	.height_mm =3D 136,
> +
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format =3D MIPI_DSI_FMT_RGB888,
> +	.lanes =3D 4,
> +	.send_init_cmds =3D tianma_jasmine_init_cmds,

[Severity: Medium]
If sending the initialization commands fails in nt36672a_panel_prepare(), d=
oes
this code leak the regulator resources?

Looking at nt36672a_panel_prepare(), it calls nt36672a_panel_power_on() whi=
ch
enables the regulators, and then calls send_init_cmds():

drivers/gpu/drm/panel/panel-novatek-nt36672a.c:nt36672a_panel_prepare() {
	...
	dsi_ctx.accum_err =3D nt36672a_panel_power_on(pinfo);

	/* send init cmds */
	if (pinfo->desc->send_init_cmds)
		pinfo->desc->send_init_cmds(&dsi_ctx);

	if (dsi_ctx.accum_err < 0)
		gpiod_set_value(pinfo->reset_gpio, 0);

	return dsi_ctx.accum_err;
}

If send_init_cmds() fails, the error path returns early without calling
nt36672a_panel_power_off() or regulator_bulk_disable().

Furthermore, because drm_panel_prepare() sees a failure, it does not set
panel->prepared =3D true. Consequently, any future call to drm_panel_unprep=
are()
will return early and skip calling the panel's .unprepare function, leaving
the regulators (vddio, vddpos, vddneg) permanently enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-nt36672a-p=
anels-v3-0-9ea238627f8a@minlexx.ru?part=3D7
