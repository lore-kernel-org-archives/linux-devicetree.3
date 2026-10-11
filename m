Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25846448B81
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720228; cv=none; b=fcy+nvoVNpoLi73utyWDVfrq/PLoceY24FmlR/qs2l8SuPptWY9tEA3CmaGQ3aHotTnPGJiiSLidDDQz/V3aMZbbZ1mJdBj3EigA6zlFfuBBl/p1BjO0kxsDoSeHfYG/LnQc3LUcQtb8nwooccpuSrrtGYO07HyouQf3e2ztEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720228; c=relaxed/simple;
	bh=AsLdS0dINT6yBVg8097ACvumPq2HKJGLt2djqtc8XH4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oTplbIbqR8nIFsA0TRcDsc1NOFCdITEEz7fhp4wKDdrXpBb39y1buvSgc8sC14d+tRkBMznAV02NTpI0yYfZ66+QXhaBOrnKTdmCq2mqEBzTDaWgwsJLgSBMa7mAVtzXHQtgQwmEM5UAcpRLaNOU5E9lWh3XLeL7XQWKc8yn3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwaUiF8R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwaUiF8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1661F0089B;
	Sun, 11 Oct 2026 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720219;
	bh=EzOSn6ZJbap8JCOwDrueEfQiP20vyQ1KvpGltDogKSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwaUiF8Rhc5UB76XRdLZv5fF2mIGD4g/I7q2SwfVs1YKhql/tkDFIUftn0PBGb/XW
	 0uItH5aYENX3Btauyny6L3NJ7sCUNtLuZ7E3IeHb3Bd8EIkzatxbU2s8nCobPzLnrN
	 Fbgk0GUSz6r4Nbn8Ke8oayyFi/RqeiEM1WyGd6emcg5PJ3uBlanCbcG1/7tBwrZnQr
	 cU5i18eW34qLC0CgrS5kNC0U/GupihWmSkHrmGoM8DrNb18ZgFbnHWF1FMM5zm9zkV
	 GBeVshux7ZmhvbqSyKmliRqefUoJTA47q56GImBKDn9ExGuKxJsyxAJf0WM1ZoFtax
	 2ooyD4VgbjeHw==
Message-ID: <sashiko-outbox-167208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] drm/panel: novatek-nt36672a: Add panel for Asus
 Zenfone Max Pro M1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-nt36672a-panels-v3-8-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-8-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:03:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panel: skipped deinit delays on DSI command failure
--

commit 3072360323238f49eea2657047c2842ee3b0aa0f
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

drm/panel: novatek-nt36672a: Add panel for Asus Zenfone Max Pro M1

This commit adds support for the TXD TXDI600YANPA-43V3 video mode panel bas=
ed
on Novatek NT36672A, used in the Asus Zenfone Max Pro M1 smartphone.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index 48dff2279b0e9..7d7c79d2502d2 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
[ ... ]
> +static void txd_x00td_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 50);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);

[Severity: Medium]
If a preceding DSI command fails, dsi_ctx->accum_err will be set, which cau=
ses
mipi_dsi_msleep() to completely skip its delay:

#define mipi_dsi_msleep(ctx, delay) \
	do { \
		if (!(ctx)->accum_err) \
			msleep(delay); \
	} while (0)

Could this result in the regulators being prematurely powered off while the
panel is still active or transitioning?=20

Safe power-down sequences typically require hardware delays regardless of
whether the sleep commands successfully transmitted. Should this code either
reset dsi_ctx->accum_err prior to sleeping, or use an unconditional msleep()
instead to guarantee the hardware settles?

> +}
> +
>  static const struct drm_display_mode tianma_fhd_video_panel_default_mode=
 =3D {
>  	.clock		=3D 161331,
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-nt36672a-p=
anels-v3-0-9ea238627f8a@minlexx.ru?part=3D8
