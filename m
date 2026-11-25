Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602914;
	b=zZcwTfhwgEl3LYl5etLEFP1aj6vGKxhoCv1J0xF6YVp0cGiGXkLC6geGq4+XFJTZTHfU
	 q+/ABaKarDSAKqCQRyQ7HzNj7IQZF/bsVSJXynkTW2pSQwgmq9jKYkDCaJSlh4gS7dofr
	 fe1ioCnndQqKsveJUIY4TuK8lO/71/weIXZz+ohcAnCSaq947wx1dIHYc5qLPmiuPm10a
	 khbA8MsawEIg+nTNFjxQaAPDBMeS8u0/9SoJcAYxEGAebxCLqVCiNT8R7Wvj+hXtw1rwy
	 5Eeb/7ivu/Mf+znaE5qusBxVdcoTsFQqF/YnXNnrLjTAgmN6MORMelTC29Pt7ewLmkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wPIRkpFj+VSo60G8la9AkeFVrHqbs05EY6/zMJntnBM=;
	b=CZ/CMshL6ItWx4fRtqp6M2oCZOMgzdvVlGR4SPIkQia4i/ApyH9deUSZEUlyeBaMDzMS
	 Mzse0kCAcTfUg3vEfrPFHlCBfP5QjV9E6gu7oSf0c0zyyjtBGjx7FlHMbvdBcALHubegS
	 35hRW4oixIl9mWVNeZgLkTvTUXl29ET9bJ+KE7wibywAUVbf7iT+O+6o1egmbxvQRjJkL
	 z7iWMRZsJmRLE39JqMgvni4WYr03Gl1uGU0DtTVTg7DrGC0pMheGo+SrniFXm2wp7JkdQ
	 aGo57QxtGR6SNiRngpYd4B8RjtmaTTaP72lGmWPgqHHZ/kbzt39FHt+l/yi2O0EEEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLEyGsoy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C69606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLEyGsoy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66631F000CA;
	Wed, 25 Nov 2026 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602914;
	bh=wPIRkpFj+VSo60G8la9AkeFVrHqbs05EY6/zMJntnBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLEyGsoyucnIE7j2IRZtTUJcqt4HS+6vJ+D8cN9bYLdzjco10BPUFHd9Et/wzqY2j
	 JL63kooXErRUdscYJE8mzj1coAi+d6snST2VwYGomatsWppjtCcypEcbe7KviSfA1w
	 uDNL2e9+SQNWEkQIqtaMwJPkTV1fE25L6uC9MWpAfr98Zii/aszJMI09mYlBbyPnjB
	 6/jTHDyhc5XA+j4ENzBnAe3+OuBTbLNP80Qb4sqF5XSS4C1kKCL68q0hN6VdnF6y5E
	 B0UyU9r2aktgk/03fu6bbdONYuydgX2vCqiFT5syc4PpjtvACRr7w7Vebvq+hhRSHJ
	 eFdSxpYIOM8oA==
Message-ID: <sashiko-outbox-233133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/panel: simple: Add support for Goworld
 ILI6150H6 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125102700.126248-4-alessandro.zini@siemens.com>
References: <20261125102700.126248-1-alessandro.zini@siemens.com>
 <20261125102700.126248-4-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:35:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/panel: simple: missing DRM_BUS_FLAG_DE_HIGH in
  goworld_ili6150h6
--

commit 7f53184ccc00be47fc506de056145e3aebeaf6e0
Author: Wang Yang <yang.wang-wy@siemens.com>

drm/panel: simple: Add support for Goworld ILI6150H6 panel

This commit adds display timing, panel descriptor, and the
"goworld,ili6150h6" device-tree compatible entry for the Goworld ILI6150H6
LVDS panel.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 33d954f3ee289..9beba399119cc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2543,6 +2543,35 @@ static const struct panel_desc giantplus_gpm940b0 =
=3D {
>  	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSED=
GE,
>  };
> =20
> +static const struct display_timing goworld_ili6150h6_timing =3D {
> +	.pixelclock =3D { 44900000, 51200000, 63000000 },
> +	.hactive =3D { 1024, 1024, 1024 },
> +	.hfront_porch =3D { 16, 160, 216 },
> +	.hback_porch =3D { 160, 160, 160 },
> +	.hsync_len =3D { 1, 1, 256 },
> +	.vactive =3D { 600, 600, 600 },
> +	.vfront_porch =3D { 1, 12, 127 },
> +	.vback_porch =3D { 23, 23, 23 },
> +	.vsync_len =3D { 1, 3, 20 },
> +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc goworld_ili6150h6 =3D {
> +	.timings =3D &goworld_ili6150h6_timing,
> +	.num_timings =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 154,
> +		.height =3D 85,
> +	},
> +	.delay =3D {
> +		.enable =3D 25,
> +		.disable =3D 25,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +};

[Severity: Medium]
Should goworld_ili6150h6 set .bus_flags =3D DRM_BUS_FLAG_DE_HIGH to match
DISPLAY_FLAGS_DE_HIGH in goworld_ili6150h6_timing?

panel_simple_get_timings_modes() converts display_timing entries through
drm_display_mode_from_videomode(), which ignores DISPLAY_FLAGS_DE_HIGH,
and panel_simple_get_non_edid_modes() sets
connector->display_info.bus_flags from panel->desc->bus_flags.  Without
.bus_flags in goworld_ili6150h6, connector->display_info.bus_flags remains
0, so LVDS bridges and display controllers checking DRM_BUS_FLAG_DE_HIGH
will not configure active-high DE polarity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125102700.1262=
48-1-alessandro.zini@siemens.com?part=3D3
