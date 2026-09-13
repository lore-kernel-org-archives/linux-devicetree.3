Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3732E73E
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311424; cv=none; b=IirRPMIKl+DuqSXASlA6+sfTm+axpwlNODLtUw6wkItg1X8c59QHB/RCAz2CojSrNe1gX/RLYijnT9IyBjOAoE85beLXSgamPNOQDL1cVCv7cJtAYTibvSD70+0EOYJ2a+10uxLSb5XWCoWy5m+QPAXEEsTNv01BlO7RRfzoKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311424; c=relaxed/simple;
	bh=oO4gN+RlIcRcGUIUuWXBia0NlCsHGTtsjPotWkjb+E4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/IG7cQEArlfh13QeeihkuIgry3SwmxMcIT1H5epmuBu6nnrx2P8WrcWawvS1gTBRvLAE8LT4d46rpG/9nWL0aSOb9AKBLw1jijv/ie5xHIMXmuBEpOIZQ29AELaAYgOFR1tKjfQ6R8K4ubPNz69kyHr763RLd6AJl2BP5vDxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7FfBa1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7FfBa1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EB71F000FF;
	Sun, 13 Sep 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789311418;
	bh=qwT6SRGrWU5ixZrRtK9qFiINLnWC1+kF+GUOsHUyW3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7FfBa1nDgoFFRzBucfNuX0dXjf7XCoNg/ZwnoOpuN/AqmJ+ioHfPF4bWqGKqFDjU
	 Uwj2Gmc74kkdpsEPGKzVlogYtoqqbAZuJ+48c4Z65oMcVH11StVG9Vz2YchCVEOCmU
	 EIRjkYYwuKqrHNXjgcmGbHb8VFMMmLKNjjzo/m6UtLTgf6zD6LKYuW21DR/ur6O2AJ
	 6G6ywaVPzPR+VNVnXaIvScuoc6d4vClgwwe0Hndgms18Mw0aYDlW+ZgnydS74y7bTV
	 o/5MoGVErgJRCfUI05E/UboWnyEd8fCEKYTz1R1X3yGtm6OX/XAgMJFrjVTzZslEti
	 LLaCoMyXPQ2Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 14:56:57 +0000
Message-Id: <20260913145657.B9EB71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional execution of CABC off sequence overwrites untouche=
d state for boe_tv101wum_nm0 variant.
--

commit 80218d28f8a5f485ff9423dca654f2257664a78b
Author: Nickolay Goppen <setotau@mainlining.org>

drivers: gpu: drm: panel: Add BOE NT51021 driver

Add driver for BOE NT51021-based 8-inch and 10-inch DSI video mode
panels used in Xiaomi Mi Pad 4, Mi Pad 4 Plus and Amazon Fire HD 10 tablets.

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/=
drm/panel/panel-novatek-nt51021.c
> new file mode 100644
> index 0000000000000..fc99908917868
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c

[ ... ]

> +static int nt51021_novatek_off(struct novatek_nt51021_desc *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> +
> +	nt51021_cabc_off(&dsi_ctx);

[Severity: Medium]
The commit message mentions that for the boe_tv101wum_nm0 variant, CABC is
untouched because the vendor drives it over I2C from the backlight path. Wh=
ile
the initialization sequence for the nm0 variant correctly omits turning CABC
on, this teardown sequence appears to unconditionally call nt51021_cabc_off=
()
for all variants.

When nt51021_cabc_off() is called, it executes:

    mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x90, 0xc0);

Could this unconditional write cause unexpected hardware states or DSI/I2C
collisions during the display teardown for the nm0 variant, since the regis=
ter
was intended to be left alone?

> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0xa5);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 130);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 70);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
> +	mipi_dsi_usleep_range(&dsi_ctx, 4000, 5000);
> +
> +	return dsi_ctx.accum_err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-qcom-novat=
ek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org?part=3D2
