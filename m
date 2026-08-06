Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFA38A72F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037612; cv=none; b=LTo0sxSl0fm3osA58rGTmht1m4BKCoXuti3ywlC1thUIw909cErG7qqJZ47Dgg9BB0DbAsBzPZOaKn0YUTwA7ENvFvLSv23DojM8kf9HBkUF3xw1qPBvMczk//LCmBa0CVu1LPiPpyY2TnzccWOpMWxJ5wW7ei9GHhSqoyEH3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037612; c=relaxed/simple;
	bh=c6uApuOLgKF9mYdn7V1GBdA5xt61z7FaYYZ+fv+epJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dZaGuTG4l7CpJfj6VEJYXbh1KmUZmJTh/YrE0X5tkgRTMpRMFOwy3QIBizci0Mv3B4FvPpPnOmAsWjxUI+f3dwbov3g7EsKSuIpRDHpU2mLDlCM3xFB6l2dP09aVKvhVLUIJgOfAKfxL8HdPGELN0rwVbwr5qZFiFk4lJgpg3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTXyvhgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTXyvhgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401D21F000E9;
	Thu,  6 Aug 2026 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037609;
	bh=7jpt+YYle2i3ytz3HquKvnqOm99pkDhpVR/2TkX5Ex8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTXyvhgyVbBqBpKV+iGNxw3np1QamIQbeZrQUSh6iBqvFDysCZhwRY3PvnmdNPGfm
	 3WZV4SPm6F9DetLw0auOwJBiXZVq/Z/xLrjtO3x798TJ5c+Xjp6GFOk3BMP+hJIOPe
	 7fDdr54x3c46u4Yqq+9bZd3hPLljhoHJpEARdm5mWzUC9Ui38igv/xRmW1DOlPvhGf
	 boVX3kUo3LgwLw+GYFOXY37QAXsgHoY690N15KoT75SS4G5B7Za/d0KDeka0R1Gbyx
	 /DAiuNx4K0MnsxT2ydxf3NkQPUPX9wKIlBn4cbQPelUVlV/yoYfdN6tkrpYETvxJWn
	 7sRpDnWXGqOwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 09/21] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-9-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-9-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:33:28 +0000
Message-Id: <20260806173329.401D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DW DP bridge accepts explicitly negotiated output bus formats =
without verifying if the resulting bit-per-pixel (BPP) exceeds the DP link =
bandwidth.
--

--- Patch [9]: [PATCH v11 09/21] drm/bridge: synopsys: dw-dp: Support MEDIA=
_BUS_FMT_FIXED ---
commit 8f5ee9653fefa35534059addf0b8fba75d680cad
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Support MEDIA_BUS_FMT_FIXED

This commit adds support for MEDIA_BUS_FMT_FIXED for USB-C DP chains where
the final bridge does not implement atomic_get_output_bus_fmts(). It updates
atomic_check to resolve the output format from the negotiated input format,
and adds a custom .atomic_get_input_bus_fmts hook to advertise all
bandwidth-validated formats when FIXED is used.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index d35dcd4a413f7..b9864a17c01d0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1830,6 +1834,32 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmt=
s(struct drm_bridge *bridge,
>  	return output_fmts;
>  }
> =20
> +static u32 *
> +dw_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state,
> +				       u32 output_fmt,
> +				       unsigned int *num_input_fmts)
> +{
> +	/*
> +	 * MEDIA_BUS_FMT_FIXED means the downstream bridge does not constrain
> +	 * the bus format. In that case, advertise all formats supported by the
> +	 * DP link so the upstream encoder can negotiate the best match.
> +	 */
> +	if (output_fmt =3D=3D MEDIA_BUS_FMT_FIXED)
> +		return dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
> +							       bridge_state,
> +							       crtc_state,
> +							       conn_state,
> +							       num_input_fmts);
> +
> +	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
> +							 crtc_state, conn_state,
> +							 output_fmt,
> +							 num_input_fmts);

[Severity: High]
This is a pre-existing issue, but does propagating the downstream format
unconditionally bypass bandwidth checks?

When output_fmt is not MEDIA_BUS_FMT_FIXED, it is propagated directly. Then
later in dw_dp_bridge_atomic_check(), the corresponding BPP is assigned
to the state:

    fmt =3D dw_dp_get_output_format(out_bus_format);
    if (!fmt)
        return -EINVAL;
   =20
    ...
    state->bpp =3D fmt->bpp;

It appears the format's BPP is assigned without validating it against the DP
link capabilities. If a downstream display requests an explicit, high-BPP
format (e.g., 36-bpp RGB) that exceeds the link's maximum bandwidth for the
selected resolution, could this cause the driver to accept an unsupported
configuration?

If the atomic check succeeds but the hardware lacks the bandwidth, would th=
is
result in a failure to transmit the video stream, causing a blank screen or
link training failure?=20

Should the explicitly negotiated format be validated against link bandwidth
limits here or in atomic_check?

> +}
> +
>  static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(stru=
ct drm_bridge *bridge)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D9
