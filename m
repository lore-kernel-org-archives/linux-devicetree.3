Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441B32BF4B
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902947; cv=none; b=dFwImGtrX7F07iHPLGAZNQUH9U/JvctnuiZkcW0cM8eb/4MqISPdhmZQiB2AzhaiyiDk5r7dCF6Nj8qzA+HXp/edbJNbc+7EZKZBMYievCegGkpwXO33jZL7p3FIySwZphv7/7ma7/D+ANOGgnTlCcyvy6ZW/tZQ+KtRtVdYmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902947; c=relaxed/simple;
	bh=ZeTUdRcvv6297EpGfLRUhCDqcdgYsUNui/zBaIWWOPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLMGvPu3OHElg10VMQPvz3eUlm4ZioGZ2b1lQwbKUiGzOS19CfHj4N89rML+aEGxY4/lmyRpD75NNMVFet+/CIhJ5NFgZ28kMI1NmYm4SbpzIaHYfmgNswVsiZBX6ZQ4jGK4fcW/WFDYl6JUcSrYtP1cTfWXwDwsLj6Wq81RbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWG0rbZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWG0rbZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D72C1F000FF;
	Sun, 20 Sep 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902940;
	bh=bZBavDoZVwtRZgMxRQsNQcQVnMayGHk7knOBV6hWpG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWG0rbZpSu5u4Puy3ng1yQhUr2jk8BKaiiWAzCm1Biz1Uy99bsAER+GOJHsg8WqhX
	 zX5US6KJ/ZMK6ZpfVcmmSBylZdZzVvIeRkNW4yCb/V0AjfJwx6cRQc8NApP8EGZvj7
	 VvEzUwz8rT6wl81YpnIYSZOPruL516JEmA+XgHPqjUgm8Le0z59fjCxnGLEkq7qZMj
	 SuhvuWNhRAjuzXv6YIk/gGqfUNkVloUuarKVOUjeLsWev61Q4b10iw+XvL3ht5ToVY
	 tpObvyux1W//6FATCs/b15TeLxQdb7QD6dgjirlUEIwV+htRbz4Fv+bNxjT6hHB4cr
	 qOLhowAn1rNKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] drm/panel: s6e3ha8: add Samsung AMB630QY01
 (Google Pixel 3 XL) panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-crosshatch-panel-v1-8-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-8-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 11:15:39 +0000
Message-Id: <20260920111540.3D72C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/panel: s6e3ha8: Unsynchronized sysfs backlight triggers DSI DC=
S writes
--

commit d9884a7abde10a9a4310803bddeebe9758abe410
Author: David Heidelberg <david@ixit.cz>

drm/panel: s6e3ha8: add Samsung AMB630QY01 (Google Pixel 3 XL) panel

This commit adds support for the Samsung AMB630QY01 panel used in the
Google Pixel 3 XL, driven by the S6E3HA8 DDIC. It introduces the panel
initialization sequence, standard DCS brightness control via a backlight
device, and corresponding DSC settings.

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/=
drm/panel/panel-samsung-s6e3ha8.c
> index 2591b8c1a7753..e02f1d9f0dcd0 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
[ ... ]
> @@ -271,6 +294,136 @@ static const struct s6e3ha8_desc s6e3ha8_amb577px01=
_wqhd_desc =3D {
>  	.num_supplies =3D ARRAY_SIZE(s6e3ha8_vddr_supplies),
>  };
> =20
> +static int s6e3ha8_amb630qy01_prepare(struct drm_panel *panel)
> +{
[ ... ]
> +	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);

[Severity: High]
This is a pre-existing issue, but does this result in sending an uninitiali=
zed
DSC PPS payload to the panel?

In s6e3ha8_amb630qy01_prepare(), the PPS payload is created using priv->dsc
and transmitted to the hardware. However, the DRM DSI host typically
populates the display timings and rate control parameters into priv->dsc
later in the encoder enable sequence.

If the panel relies on this PPS for decompression, could DSC decoding fail
and result in a corrupted display since pic_width, pic_height, and rate
control parameters are initialized to 0 at this point?

[ ... ]
> +static int s6e3ha8_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	u16 brightness =3D backlight_get_brightness(bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +}
[ ... ]
> @@ -313,6 +466,13 @@ static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
> =20
>  	priv->panel.prepare_prev_first =3D true;
> =20
> +	if (priv->desc->has_backlight) {
> +		priv->panel.backlight =3D s6e3ha8_create_backlight(dsi);
> +		if (IS_ERR(priv->panel.backlight))

[Severity: High]
Does registering the backlight device here create a race condition where
sysfs writes can trigger DSI DCS writes while the panel is unpowered?

The backlight device is exposed to userspace before the DSI device is
attached or the panel is powered. If a local user or process writes to the
sysfs backlight brightness file, s6e3ha8_bl_update_status() unconditionally
invokes mipi_dsi_dcs_set_display_brightness_large() without verifying the
panel's power state (for example, by checking priv->prepared).

Can this attempt to drive unpowered DSI lanes, wedging the command engine or
causing DSI host timeouts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-crosshatch=
-panel-v1-0-de6e9512da96@ixit.cz?part=3D8
