Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B33126D9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548785; cv=none; b=IvbsvKtjqLsulgHB3941LgZqzOHojilRGFyECGf5zHD4m7qA/OQczsZI7aoGVtK/EIO5HrzUS6UzdHKcRX0WSXjjtH7QP8gy9voV5pmLoMnbLt4DyrXtU6UaPPvUynlVmqzW5Tcx26rDS9c/j/1jS2w83cXJ81BqcD0rZefgmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548785; c=relaxed/simple;
	bh=zN4v7cfhTwjhxtqqhA38Rut2uuDsl0XmhzBLeRbDz8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7bd9tgvUbbmlHFPABvDCubQarpaZ5wbqDCu2tiil5wLn/6uJ5vDgtL4fmNB3ZVIQRaaOR6erswsxR9yn0iSfw5KUFDxXqzHIPLK9St0vV9H0u1VaZMxJJLQl2YQgsQgb45vUThY5O/PwufR6kPSlQhJ94U6d//K7GMsmg9My04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYRiQVVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYRiQVVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266FB1F000E9;
	Wed,  8 Jul 2026 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548782;
	bh=P/gg+CaCjmsXVBsMQxP0pFI2Lsw/Kd3DlGYTL4UIgv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYRiQVVRDyUfvVIOgc3053mNa3V4PN/KNZvNZrkeU+mDEmlv49d6SWMeOkhrLwYet
	 s+pVLMHnBhdXAQFrQc/+0kSRX1Qo9cN/LkdHloJFFVKvjWfTeLPQ+hLIT2hIaCCkUU
	 Hl3Wp2ti7zEm9LmPC70EW3o+h6ltFMwJlhV+Kd19bvMsxnIKynN5pf3W/IiNzifjby
	 5muTouUnDjsHFjLGZj5XMIAN+QaetXSzARHDwE4L1ZtLedbIdCn9GcKaH2QLKaf5UV
	 nGzOhiGxrRs7Z6T353n5TJc1OXsRA/N5Mh/Am5iWpcDXNxdmqSGIsBIC03UHuE0wCk
	 4p06ESpYIHFqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/14] drm/rockchip: dw_hdmi_qp: Support 10-bit
 YUV422 output format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-12-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260709-dw-hdmi-qp-yuv-v3-12-a4a982a9f2e7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:13:01 +0000
Message-Id: <20260708221302.266FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `atomic_check` callback unconditionally mutates global driver =
state and configures hardware PHY, breaking DRM atomic design principles an=
d corrupting state during `TEST_ONLY` commits.
--

--- Patch [12]: [PATCH v3 12/14] drm/rockchip: dw_hdmi_qp: Support 10-bit Y=
UV422 output format ---
commit 4acf186e6f48344c73efb358bbf5b17c6a065aa5
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format

This commit adds support for 10-bit YUV422 output via the
MEDIA_BUS_FMT_UYVY10_1X20 format. It also forces 8 bpc for the HDMI PHY
configuration when YUV 4:2:2 is in use to keep the PHY PLL output aligned
with the TMDS character rate.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -226,7 +227,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_=
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

[Severity: High]
This is a pre-existing issue, but does dw_hdmi_qp_rockchip_encoder_atomic_c=
heck
mutate active hardware state and global driver state during TEST_ONLY commi=
ts?

Because atomic_check callbacks are executed when userspace issues a
DRM_MODE_ATOMIC_TEST_ONLY ioctl to probe display configurations, calling
phy_configure() here could actively alter the PHY hardware under an active
display.

Additionally, modifying hdmi->tmds_char_rate mutates global driver state
even if the test commit is subsequently discarded by the kernel, potentially
corrupting the active configuration. Should these side effects be deferred =
to
an atomic_enable or atomic_update callback instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dw-hdmi-qp=
-yuv-v3-0-a4a982a9f2e7@collabora.com?part=3D12
