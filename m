Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227553D0D5
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932649; cv=none; b=VXuXLg/7sd3HV+ajuRwHkvfAWvUWMhiTMWouWk9NlOSmaMy0+pd7ZzbhNmXCc2SiGRPBkBL/+mKUDlXmcDC8kbQd1b2IHDn4rTjbTz8HJr7ekKJCSG2dpKPiPSgfe0DTvt8woQpnovCW+vdJO/Z5JBDySmCuGYcpWlwcyQRqzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932649; c=relaxed/simple;
	bh=7mD5rp3WSzR2tDDjECRf0JvgoZ90CQJjUSklkq+KDgk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ciDIHImkyEsCf9zyC5W9/07Vg9KJoHt0dHY4tJQIwTkLt7tXjJmHexgtNAXg9kDNzBIGxo1d0A+aOQFZ+yqhlCR7P92FwZ/v4kmPCG8+MCzcpmZO/WX/GzKsp1NOcHUtw2usRN2k4KY4KVnd//95AJwXedovqec6tplhJsLya98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtPE9HtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtPE9HtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E3E1F000FF;
	Tue, 13 Oct 2026 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932647;
	bh=XcrHCguC6sgAHfwM3zk2+fPmspvT64Oze4rNPv6wWVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtPE9HtG14tbOQCUF1r2zsrXO5q6AyYvrOcft3x+aID1pK6yZcS6TzdC+A8Jgu8g6
	 VftXVmr149Gtlj/qB1zEvYp9idKf8u98hGo/kFA3fl6d41q7yhiF3xIMwbq5HpFJ7r
	 HaSBwe+2mrtBM1pNZHJuycFTD2BSEkTT5DHzwfKY8DCmviiRpmBE/1gQfiSlPFzIHV
	 A54Spbt7AwxGNLJVEwqHWPec0CO7Aw4LJUyrlgjLW5hGU0fLVJV0Yrq3durSHr59eU
	 kp+FjfEMmB1mLqsVMbeiDc6Efv/TdJinzpcaQpOhZ1QWlWIm79DcU/QUto/SaBtzb/
	 LaTdvSF+IAfHw==
Message-ID: <sashiko-outbox-170620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/15] drm/rockchip: dw_hdmi_qp: Do not mask error
 code in atomic_check()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-12-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-12-6fab0fe43a9b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 23:04:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/rockchip: dw_hdmi_qp: state corruption in atomic_check()
--

commit af42e0a2c16e4fdcedcd0540fb2c150fc25ebb0c
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Do not mask error code in atomic_check()

This commit changes dw_hdmi_qp_rockchip_encoder_atomic_check() to
propagate the error code returned by dw_hdmi_qp_rockchip_get_vop_format()
instead of masking it with -EINVAL. This ensures that -EDEADLK can be
propagated up to the DRM core to trigger the ww_mutex backoff mechanism.

Link: https://lore.kernel.org/all/20260902230603.AF5C61F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index f2a1ea8dfefa5..db1933d75ced5 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -203,7 +203,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_e=
ncoder *encoder,
> =20
>  	ingest_fmt =3D dw_hdmi_qp_rockchip_get_vop_format(encoder, conn_state);
>  	if (ingest_fmt < 0)
> -		return -EINVAL;
> +		return ingest_fmt;
> =20
>  	if (hdmi->tmds_char_rate =3D=3D conn_state->hdmi.tmds_char_rate &&
>  	    s->output_bpc =3D=3D conn_state->hdmi.output_bpc &&

[Severity: High]
Does this function improperly mutate hardware state during the
validation-only atomic_check phase?

The DRM atomic framework uses atomic_check for configuration validation,
which executes during TEST_ONLY commits that are never applied to hardware.

However, further down in dw_hdmi_qp_rockchip_encoder_atomic_check(), the
code calls phy_configure() and updates global driver state:

	ret =3D phy_configure(hdmi->phy, &phy_cfg);
	if (!ret) {
		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
		s->output_bpc =3D conn_state->hdmi.output_bpc;
		s->bus_format =3D ingest_fmt;
	} else {

If userspace issues a TEST_ONLY commit with a new mode, the hardware PHY
state and driver tracking (hdmi->tmds_char_rate) are modified to reflect the
test configuration.=20

If the commit is then aborted, the hardware state and driver tracking become
out of sync.

Could this cause a subsequent valid commit to break display output by
incorrectly skipping the necessary configuration due to the fast-path
check shown in the diff above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dw-hdmi-qp=
-yuv-v5-0-6fab0fe43a9b@collabora.com?part=3D12
