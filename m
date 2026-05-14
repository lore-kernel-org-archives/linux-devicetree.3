Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B91E515
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745465; cv=none; b=L93DqIsCo9yNeOAd2Prl8exT0z3AjD1ZdqHIJjIQA9y5BB7EsNOyD65DngWKvfrMKDCO8iiO7m34FST0ztocQr1+KpeW6W1EDjqhKnVOXuwDXm/5Cafhfi41dklVIdxTtZDV1mpSfThIWP0TF5TW/kyUpASbTk3wF1+/CXwFi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745465; c=relaxed/simple;
	bh=4iUk50a0GUqGqAISaBURRvYdjkOlUJEompRL3cwGS4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joyaSxM+F6tZ0Idwd+s8lp9DW9/rPWVz1DYhhB4l1PCxxCzPxeXIA0ClJvWnWz4dAs6zkeB1YoMB58WOEa5xiyZkW2PJ5Jp8T5IIExq+zE/BHNaeJhEN3YR2qztN1ZK0zmtt9C0PXF4L2463FUoMvhlUnIc98Y6KYk3hznJyL1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aokYcOSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aokYcOSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B39AC2BCB7;
	Thu, 14 May 2026 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745464;
	bh=4iUk50a0GUqGqAISaBURRvYdjkOlUJEompRL3cwGS4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aokYcOShgA1xXvgAFQ8UiQOeKuyF2Q3N2UxgQqaAZFUbWCdfbigtHjrCiW1oGmERC
	 vszCFsFnwSXsX0Lh7BkgvaUQSTeoFgiWtV3HssRYoJWyd8pqZswOhCytQXlIJGUBVX
	 Ck/VmPeFPDs1hK5r/QwtL9Py8xSgrWa35OozOIZ6cXpkFl/Ha6IngrvD/ZVTb//D1D
	 FKB8TCXjJa+nMZkRcAYmced6K43D9MfuxODaooS14F5sVGYkzvEh+uscKA1TXpzRm3
	 /bQnjaLQmRuszlpgVo2s2m2iLQVJ6rY2pg6TYiYBrl2oW8NEV25PJqg45NSg1ZIiz+
	 RxBDO3Lh6SGPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/16] drm/tidss: Add external data and sync signal
 edge configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513-beagley-ai-display-v2-9-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-9-9e9bcefde6bc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 07:57:43 +0000
Message-Id: <20260514075744.8B39AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect error check for missing syscon property causes driver pr=
obe failure on platforms without it.
- [Medium] Using regmap_write() on a syscon MMR register overwrites the ent=
ire register, potentially clearing reserved or unhandled bits.
- [Low] Evaluating PTR_ERR() on a potentially valid pointer without a prece=
ding IS_ERR() check violates API semantics.
--

commit 6ff2a14021d4cf3eead5f27440ae73dbed474911
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Add external data and sync signal edge configuration

This commit adds support to configure the DPI output data and sync signal
edges via a syscon register. It looks up the syscon regmap using the
ti,dpi-io-ctrl property and writes the required clock inversion bits
during the video port preparation phase.

> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/=
tidss_dispc.c
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c

[ ... ]

> @@ -1201,6 +1203,13 @@ void dispc_vp_prepare(struct dispc_device *dispc, =
u32 hw_videoport,
>  				  mode->crtc_hdisplay - 1) |
>  		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
>  				  mode->crtc_vdisplay - 1));
> +
> +	if (dispc->vp_data[hw_videoport].dpi_output && dispc->syscon_dpi_io_ctr=
l) {
> +		regmap_write(dispc->syscon_dpi_io_ctrl,
> +			     dispc->syscon_dpi_io_ctrl_offset + 0x0,
> +			     (!ipc ? DPI0_CLK_CTRL_DATA_CLK_INVDIS : 0) |
> +			     (rf ? DPI0_CLK_CTRL_SYNC_CLK_INVDIS : 0));
> +	}
>  }

Could this regmap_write() overwrite other important fields in the syscon MMR
register?=20

Using regmap_write() unconditionally writes 0 to all other bits. Should this
be a read-modify-write using regmap_update_bits() with an explicit mask for
bits 8 and 9 to preserve the rest of the register state?

[ ... ]

> @@ -2989,6 +2998,18 @@ int dispc_init(struct tidss_device *tidss)
> =20
>  	dispc_init_errata(dispc);
> =20
> +	dispc->syscon_dpi_io_ctrl =3D
> +		syscon_regmap_lookup_by_phandle_args(tidss->dev->of_node,
> +						     "ti,dpi-io-ctrl", 1,
> +						     &dispc->syscon_dpi_io_ctrl_offset);
> +
> +	if (PTR_ERR(dispc->syscon_dpi_io_ctrl) =3D=3D -ENODEV)

Is it safe to evaluate PTR_ERR() before verifying that the pointer is actua=
lly
an error using IS_ERR()?

Also, when the ti,dpi-io-ctrl property is absent from the device tree,
syscon_regmap_lookup_by_phandle_args() returns -ENOENT, not -ENODEV.

Will this cause the driver to evaluate the missing property case as false,
fall through to the IS_ERR() block, and trigger dev_err_probe(), breaking
display initialization on platforms that do not provide this optional
configuration?

> +		dispc->syscon_dpi_io_ctrl =3D NULL;
> +	else if (IS_ERR(dispc->syscon_dpi_io_ctrl))
> +		return dev_err_probe(dispc->dev,
> +				     PTR_ERR(dispc->syscon_dpi_io_ctrl),
> +				     "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
> +
>  	dispc->fourccs =3D devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-beagley-ai=
-display-v2-0-9e9bcefde6bc@ideasonboard.com?part=3D9
