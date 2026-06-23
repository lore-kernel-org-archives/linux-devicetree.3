Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F33955FD
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248618; cv=none; b=TkeN7UuPCiXHxrqLelS4tV6BzV+UijX53SWK1mpkGgjq8ikF36BU4mw6iMInJndUZHfhyKhL5LDvgZDb9+ZIUDjBHXQVaG9vRIJ5RM2HnqXv6Gvhp7p7/IQH8SVYmlVdWpn6AtksNb2S4QO5IKdVn6FZK3+HFRbkgJ1xHOCBYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248618; c=relaxed/simple;
	bh=hYJp5q0QpjbqvwDPwj44ir2rv5FoWuB2Vc4gRtbLtwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nK/BLNpvopkE6bOGb1TlfZZRTEQEaGKs/NEdNbxqHNAOl6VTa399BVdoP7kgrc/tT4H761OYxyPbDZVr/2LQh5cY9JHw0qy1Pewdtr9nVKgQ0yfTeUJtKsO2igioImZ2tnrbuG1g4TtHU8yCGbhlLGvg9XCwWJ7qjIvzg7HHSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RC0PfHzF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RC0PfHzF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B5E1F000E9;
	Tue, 23 Jun 2026 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782248616;
	bh=g6z07HIddUQIv5yP8llaSZlv6I3Zv/zIjhZiWeI08cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RC0PfHzFHycY1SQJLc4J7uGToLzs4rIAA9rtbc7mUhFZZrDcdyIAn6fhF1P63ov6J
	 R9oceZQtPskfLvX/MLANn8NoqfX6MeUeQyOIlR6q4exXijK9pIUHSE04dkszx8JN0K
	 I9yE5ecggCJPRS4ZcE4VCDTUwVf+sF47x5HxZUq/8yYGVAnLrBzLlOZH1FTF8hzPsP
	 qfo8b79aMNdqKCVk+rVKbxZwaNHrMPBM63g7d5JOm0mRKYhMTTdhASD7wjNUUWQEZv
	 VxMYk5Is13VJ9U3cVSjDdSFCEirps6n/zJfwtZokj7VsA0tTGMWsR8k0aTPwKjQyMU
	 ocIS24YtxXyYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-8-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-8-a665cfd06d7d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 21:03:35 +0000
Message-Id: <20260623210336.68B5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware State Mutation in Atomic Check
--

commit 88f697e7fc21ab15ca1c009f0f830ab90e6ec4e7
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Enable YUV420 output format

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place. Advertise it via the platform supported formats so
the HDMI core can select it.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 3a1c027aa90bb..e29522afc6f05 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -612,7 +612,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
> =20
>  	plat_data.supported_formats =3D BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> -				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
> +				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> +				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);

[Severity: High]
This is a pre-existing issue, but I noticed that adding new formats might
exercise the atomic check path more frequently.=20

Looking at dw_hdmi_qp_rockchip_encoder_atomic_check() in this same file,
it appears to mutate hardware state during the atomic validation phase:

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_encoder_=
atomic_check() {
	...
	ret =3D phy_configure(hdmi->phy, &phy_cfg);
	if (!ret) {
		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
		s->output_bpc =3D conn_state->hdmi.output_bpc;
		s->bus_format =3D ingest_fmt;
	} else {
	...
}

And in the PHY driver, phy_configure() mutates global state:

drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_configure() {
	...
	ret =3D rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi, &hdptx->hdmi_c=
fg);
	if (ret) {
		dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
	} else {
		hdptx->restrict_rate_change =3D true;
	...
}

Does this sequence cause problems when a userspace application (like a disp=
lay
compositor) submits a test-only commit using the DRM_MODE_ATOMIC_TEST_ONLY=
=20
flag?

Since the atomic check runs for test-only commits, won't this corrupt the
active driver state and potentially break subsequent real commits if they s=
kip
necessary hardware configurations due to the cached state already matching?

> =20
>  	encoder =3D &hdmi->encoder.encoder;
>  	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_nod=
e);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-dw-hdmi-qp=
-yuv-v1-0-a665cfd06d7d@collabora.com?part=3D8
