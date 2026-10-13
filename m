Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91C5616C2
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933169; cv=none; b=vGO7gwS9/vJflQwtei7x+M4MxI+8Mkrqo0XJywPpy+eMtXuOG49XC4PVYihApHuwFabYNt+Bb8zTprBxzDN94om+BBvZX+hRTsl0Uji+jTsFgXaH6g9ZigvP5XBJM1HtqsuKrd3UEh+g2KYlWKoMZoI13/jINRrx/cKDM8lkutM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933169; c=relaxed/simple;
	bh=SeTPC5CD4lJ34EeFgyXFrlfuJLirFsqmHAzND92OMUQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UmoDZI3KPiLxQlHI3p11RB//b82/Q27I9+vfNEe03hvcpLTXF/b7oK+dUSo6ioLxo6fhOAM5ikhW8sFqSfvq92uK8602rajc7hZQbIgMXhXScqC5Pehfq8Euv44PFTg8GrI6+2HIJa8OLWdwFN+mJMhs0OFyA2W580P+HrHCiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrv0dJO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrv0dJO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E585B1F000FF;
	Tue, 13 Oct 2026 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933168;
	bh=MwwSZ9tU4MCrJ5+lp72ySnRVD9y8LVCfzIVRG0+uc6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lrv0dJO6c/RTVWqVzCns6Gu7KkB4w1TPgQCmxZ0RaFVYxPu4MXKofTjma+5TcZAvB
	 QK7Sc3DpFr1MogqvsYpf2ObwoZtbvHUmfbDqXnJjcMNsz9zK6+Ryb6NXlg5A9X5ngl
	 oqIvivXCD9zWT8oudMmTln44+/UzfZIe9K89KFAlAxLavPwt+ufn4/64buzWmOB4Jg
	 POdwXbzQIwwdCMafMhLK9mwuXSnItivWqwd+W3bUgn/2iquYnGhxhe/AhsmtyQOj4l
	 TubAsxciNuJ7y3WBiu8+3keI2EOj6lEjXTtE9nzYNR618CVizleu7/c/XsnSEKy1rf
	 Rc5UxFFyyLm7w==
Message-ID: <sashiko-outbox-170630@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit
 YUV422 output format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 23:12:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/rockchip: dw_hdmi_qp: state leak in atomic_check corrupts PHY =
bpc configuration
--

commit 197f61f0c784edd007d1f4b375c9dad379eab849
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format

This patch adds support for 10-bit YUV 4:2:2 output to the Rockchip DW HDMI=
 QP
encoder by using the MEDIA_BUS_FMT_UYVY10_1X20 format. It also forces 8 bpc
when YUV 4:2:2 is used to keep the PHY PLL output aligned with the TMDS
character rate.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index db1933d75ced5..380dd9ca6870d 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_=
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

[Severity: High]
Does calling phy_configure() in this atomic check function leak test-only
state to the PHY driver?

Because dw_hdmi_qp_rockchip_encoder_atomic_check() executes during
DRM_MODE_ATOMIC_TEST_ONLY commits, calling phy_configure() here updates the
PHY driver's cached state (like hdmi_cfg.bpc) with test configurations. It
also mutates the global encoder state when it sets hdmi->tmds_char_rate on
success.

If a TEST_ONLY commit changes output_bpc while tmds_char_rate remains
unchanged, the new bpc is cached by the PHY.

A subsequent full modeset on the active state could then hit the early
return earlier in this function:

	if (hdmi->tmds_char_rate =3D=3D conn_state->hdmi.tmds_char_rate &&
	    s->output_bpc =3D=3D conn_state->hdmi.output_bpc &&
	    s->bus_format =3D=3D ingest_fmt)
		return 0;

This would bypass phy_configure() and allow phy_power_on() to apply the
leaked TEST_ONLY bpc state, potentially desynchronizing the PHY PLLs and
corrupting display output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dw-hdmi-qp=
-yuv-v5-0-6fab0fe43a9b@collabora.com?part=3D13
