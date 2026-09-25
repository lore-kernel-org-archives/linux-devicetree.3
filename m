Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1966F2D6E58
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320606; cv=none; b=u9bMTNQ8cXjlK64HOVE56BfuAz9r9C2tplqKPlffZGtlFPRTjZPKM0dDEsJ0fpy5SU46eHvO4si1nf1HtpexlViwdhEis16q75Jsd0212d3rQvhtZHG7xN04/1h8j2K3DjNORkrR0LzsDaXV315CDcR8YbxrLTIanvJdlKJjV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320606; c=relaxed/simple;
	bh=K+b/7dgfu6jkfS0nfdH6VKQGZosHzmJSceiM1WNSyRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N9XJVTkq7oL4mbgztcZtDEDDfp27i1ukwBBwiPY/XAA9NRv4zMJO1tNHdm7MtryxUYfpBXA/N4reVrmFB96wNTAhLkUOpkT8x7g0ZEsGEavinYqpgjPMq6zO+IXkR+m9fyNuwrH5hfPklfCnT2RSSXTXh7l4GEzafB7g+GDqGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuKZ7Y9p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuKZ7Y9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6271F000FF;
	Fri, 25 Sep 2026 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790320604;
	bh=tUkg9tA3npVFf8AnFIQzW6/fXHsJXe77OD/IPfdh5W8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PuKZ7Y9pBOo+2xZwTTJUf4eQg9X06MNfuSCd8f06JO+Yh6KzM8CYVlrvw/FElW+h/
	 aCCaSJAYoh5jA0+rvcx/wfe1AXYzAJGqpF5oQ1q+ZRXEhrcdMzj7BJSoayYjtF7+Uf
	 WeT7sFiHPVszGdYVKXUIyGrcdup3ZCXXXp4+LCrAFjdz0iythbgy1+lokrmy81rdz6
	 IOYpbqkkInShgVhUi3Tf0cUY3b9LVOcFQIwIGSUQvfpquwkPMh0upaJHWcFR74Royv
	 UlZoMU3wl0U8et/rTCywy5v+PhJ/N+svNk+6T9KWTa3Z3dNjv4l9W/Im2AwIasyV4D
	 Hwb4Rh01KdyUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/panel: visionox-vtdr6130: Add Retroid Pocket
 6 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-rp6-panel-v2-4-19c425e523de@gmail.com>
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
 <20260925-rp6-panel-v2-4-19c425e523de@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 07:16:43 +0000
Message-Id: <20260925071644.3B6271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/panel: API misuse by passing byte-swapped brightness value
--

commit fdce0322736a51a627625ddf135b072aa86e11bd
Author: Aaron Kling <webgeek1234@gmail.com>

drm/panel: visionox-vtdr6130: Add Retroid Pocket 6 panel

Add support for the 1080x1920 panel used in the Retroid Pocket 6.

> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gp=
u/drm/panel/panel-visionox-vtdr6130.c
> index 278f5acc2d661..d0db128cda819 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

[ ... ]

> @@ -60,6 +60,82 @@ static void visionox_vtdr6130_reset(struct visionox_vt=
dr6130 *ctx)
>  	usleep_range(10000, 11000);
>  }
> =20
> +static int retroidpocket_rp6_on(struct visionox_vtdr6130 *ctx)
> +{
> +	struct mipi_dsi_device *dsi =3D ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
> +				     MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xff07);

[Severity: Medium]
Is this intentionally passing a byte-swapped value (0xff07) to work around
the core helper's LSB-first transmission?

The mipi_dsi_dcs_set_display_brightness_multi API expects a logical
brightness value, not a pre-swapped payload. If the core helper is ever
updated to correctly follow the DCS spec and transmit MSB-first, could this
panel silently break and apply a brightness of 65287 instead of the intended
0x07ff (2047)?

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-rp6-panel-=
v2-0-19c425e523de@gmail.com?part=3D4
