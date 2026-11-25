Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602491;
	b=Du6oCOlyRehnmSf6vAWyBgyXcFJ18okceYUEqjtQRQWsrg4yRZrzsasiDScu86z3S8ae
	 cAFIUlAdHhjS0bCMZmR+zGKZvnVJmfQeze5Dxbyrijf/mbRP2+CwWVa3/kVu6Si6vT5WE
	 jPGECkzywX/movpwG68jGUyarwzSF9oVkgte3LX1DNiR/blRBWIwIdm6mzLRclWuxOkQ8
	 d+oTGuSaxPvLfehMSBdqc7kq31uogcnPb6c2p3OpDS0tOzau+Ru7lKh/qK0umEAKvjygF
	 TnT0cnedOFo4v5BOmj/FlzNhc08rwthk4AuX0R1oGjtVyX+qn6FJqJeZngObjCAG9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T/vjXrDrOmURMsVld3JH//LKMEf80TQjoe2Cv0+uAys=;
	b=v0IVTBNmnD752wQWc4TxTtQUZpQRYayGRIFlnU+lnWdeU3pAwg5qYKEj5ZjTNnVJkkq/
	 9Qw8RbSE3xg7KcbIeY+whPLxM8I8xquDhS+gNn1UOrX7lPoYRwpo6lHqpakygHHLy946p
	 RK1skqbQD+enjkVBHU89XkvCUNl6oFRv03Nm4fiNzFSASQooSnICehvCCJrTtg6zNqGM6
	 LDC9dbMQEa9iA0xdxogT9TexeMXPqFUq9zZ856WzPUvtw5tq8e+ivCKUyPOT8arnFKzF3
	 IRI6raDvUh3rrNtI6Sp60FnglW6tKNGhz1ScvG5fjvuzRCF/idhoRG0V0H9mGyYhjOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDdAPcZc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138E606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDdAPcZc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12161F000D8;
	Wed, 25 Nov 2026 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602491;
	bh=T/vjXrDrOmURMsVld3JH//LKMEf80TQjoe2Cv0+uAys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDdAPcZc2Q4Bf/WCMlIN9w/CxQEAfqerEpoqp0j+8QVqw3vNxvm1XFu6pjImg47VZ
	 uNAglPEjw5IWri/tJKx16jWiLx9ZNUL0PUFBxcjKqXwDaJBgdFhPujrB53h10UMVYf
	 /D1VYxguXIeM21AYxNuHnTwR+JonzTBhXRThPe6R4SjX1TKE66WJvSJayJQExdrnXx
	 zxmO7MZnMB/PguZoDWEuHGpbwgZJOMdzOLwngGxEVsYNDAA0MqrlK9RUznj9HBOZsh
	 E/l6xbg7WosS4qn4x1XpaefMc/hCvo0nOLIohXD9WR5s6kQYgM3X8Ja7ysDv1KqS2p
	 GCod0YIo4lLnw==
Message-ID: <sashiko-outbox-233121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/panel: simple: Add support for Techshine
 TS-P0700031A panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125101936.103094-4-alessandro.zini@siemens.com>
References: <20261125101936.103094-1-alessandro.zini@siemens.com>
 <20261125101936.103094-4-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:28:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/panel: simple: missing DRM_BUS_FLAG_DE_HIGH in
  techshine_ts_p0700031a
- [Medium] drm/panel: simple: outline dimensions used for
  techshine_ts_p0700031a.size
--

commit 09cc823426aa17952fdeb447b0b574537835dc2b
Author: Andrej Valek <andrej.v@skyrain.eu>

drm/panel: simple: Add support for Techshine TS-P0700031A panel

This commit adds a display timing descriptor, a panel descriptor, and an OF
match table entry for the Techshine TS-P0700031A LVDS panel.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 33d954f3ee289..8eda4f74bc44f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4827,6 +4827,35 @@ static const struct panel_desc tsd_tst043015cmhx =
=3D {
>  	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGED=
GE,
>  };
> =20
> +static const struct display_timing techshine_ts_p0700031a_timing =3D {
> +	.pixelclock =3D { 44900000, 51200000, 63000000 },
> +	.hactive =3D { 1024, 1024, 1024 },
> +	.hfront_porch =3D { 16, 160, 216 },
> +	.hback_porch =3D { 160, 160, 160 },
> +	.hsync_len =3D { 1, 1, 256 },
> +	.vactive =3D { 600, 600, 600 },
> +	.vfront_porch =3D { 1, 12, 127 },
> +	.vback_porch =3D { 23, 23, 23 },
> +	.vsync_len =3D { 1, 1, 128 },
> +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc techshine_ts_p0700031a =3D {
> +	.timings =3D &techshine_ts_p0700031a_timing,
> +	.num_timings =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 165,
> +		.height =3D 105,
> +	},

[Severity: Medium]
Are 165 mm and 105 mm in techshine_ts_p0700031a.size the mechanical module
outline dimensions rather than the active display area?

struct panel_desc.size specifies the active display area in millimeters and
populates connector->display_info.width_mm and height_mm.  For a 7.0-inch
1024x600 panel, 165x105 mm yields a 7.7-inch diagonal and non-square pixel
aspect ratio instead of the ~154x86 mm active area.

> +	.delay =3D {
> +		.enable =3D 25,
> +		.disable =3D 25,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +};

[Severity: Medium]
Should techshine_ts_p0700031a also set .bus_flags =3D DRM_BUS_FLAG_DE_HIGH =
to
match DISPLAY_FLAGS_DE_HIGH in techshine_ts_p0700031a_timing?

panel_simple_get_timings_modes() does not translate DISPLAY_FLAGS_DE_HIGH
into connector->display_info.bus_flags, which panel_simple_get_non_edid_mod=
es()
copies directly from panel->desc->bus_flags.  Leaving .bus_flags unset leav=
es
display_info.bus_flags as 0 for display controllers and LVDS bridges that
configure Data Enable polarity from it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125101936.1030=
94-1-alessandro.zini@siemens.com?part=3D3
