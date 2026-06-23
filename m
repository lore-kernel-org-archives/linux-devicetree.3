Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9D331230
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247878; cv=none; b=AH5aOsuVO+KVhzefe2H7pNgm7hHKy6s/gwG7rXQUFU4zA2xXpXnoXPmTC6JOsLxfyb0P8gwv1xuGgeRK2QTclykNOzenCuqKAV4Ay4LtZQQkKHri2gf2tpNRcEG0zsgVgiVDJ8VcKXrzX335kZF+WN9LgSOhA5qGwwcv7oPfd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247878; c=relaxed/simple;
	bh=MLiWQhZiHyzNl2gHTuNWxi64JgJaVTyCM+boG/wM2EY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HJWBqGSdWu0Ol7JKvUPaOfAjHAlM4sW0GW827yT/ssDex1aEdvtQp9rAYlSoA5fPlJVKRE2idodVEJHXm4z/FSPGeGloaoy39sCEKWBFARr2cIGS8qZ6KkgUTlrrD/WE6IVNrgrVFCROxxvhtYa+6MJwwj6xKpD12aXajhPvQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgHGa1mW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgHGa1mW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF271F000E9;
	Tue, 23 Jun 2026 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782247876;
	bh=ayLBPgvBZ3FBSH7Pyg9Se35v0qo5SoF/f3h+0edTIOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PgHGa1mWVDgmJeRoTarYse9R6uCsdNs2BYML/311fxFc7KuMSo7DEIm89416wLOf9
	 hWA8POFRNSACPm/nUrv1yTvQrrcsy1eAsugPXaaGtDuV2GXgiinEx22vvbZUJxhlJz
	 kY6Gv/fvpAzoLpH4iP8/cjs+lQRAOK2wsD/+oKBZGBr/lPbzHGN613PcS172IQu3AD
	 bGSNKK3kbtGFGpCEgBaNCryLBWsjffybQzACWefaoUYiyBb+uQqsrBNZOj8/kzBvPb
	 q6YUe6ji01pFLIoklfpEGKTFqY9bE/rtFeWJxIAehteh9LFf647nOXS5EsAHHIQRUo
	 aQcaXzoilI4jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-7-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-7-a665cfd06d7d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 20:51:15 +0000
Message-Id: <20260623205116.4FF271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mutating hardware state and global device tracking variables insid=
e an atomic_check callback.
--

commit ee5f0003f61d5c3a78b5bc65346f39307471c74c
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format

This commit adds support for the 10-bit YUV 4:2:2 output format
(MEDIA_BUS_FMT_UYVY10_1X20) to the Rockchip DW HDMI QP encoder. It also
forces 8 bpc when YUV 4:2:2 is in use to ensure the PHY PLL output remains
aligned with the TMDS character rate.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

> @@ -227,7 +228,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_=
encoder *encoder,
>  	}
> =20
>  	phy_cfg.hdmi.tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
> -	phy_cfg.hdmi.bpc =3D conn_state->hdmi.output_bpc;
> +	/*
> +	 * YUV422 always transmits two 12-bit components per clock cycle,
> +	 * regardless of the color depth, which from a rate perspective is
> +	 * equivalent to three 8-bit RGB components.  Force 8 bpc here to
> +	 * keep the PHY PLL output aligned with the TMDS character rate.
> +	 */
> +	phy_cfg.hdmi.bpc =3D (s->output_mode =3D=3D ROCKCHIP_OUT_MODE_YUV422 ?
> +				8 : conn_state->hdmi.output_bpc);
> =20
>  	ret =3D phy_configure(hdmi->phy, &phy_cfg);
>  	if (!ret) {
>  		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
>  		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
>  		s->output_bpc =3D conn_state->hdmi.output_bpc;
>  		s->bus_format =3D ingest_fmt;
>  	} else {

[Severity: High]
This is a pre-existing issue, but does
dw_hdmi_qp_rockchip_encoder_atomic_check() mutate hardware state and global
tracking variables during an atomic check?

In the DRM atomic framework, the atomic_check phase is expected to be
side-effect free. However, this code calls phy_configure(), which writes
directly to the PHY hardware registers, and then modifies the global
hdmi->tmds_char_rate variable.

Could this corrupt the active display configuration if userspace performs a
DRM_MODE_ATOMIC_TEST_ONLY commit or if an atomic commit fails a later
validation stage?

Furthermore, if the device is runtime-suspended, could accessing unclocked
hardware registers here trigger a synchronous abort and hang the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-dw-hdmi-qp=
-yuv-v1-0-a665cfd06d7d@collabora.com?part=3D7
