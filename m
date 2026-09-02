Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789C4570E9
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390492; cv=none; b=go1RNYllkN7Hg3rtmUygT4Z0gK5m7rL5faZBAfzgxOkNJ/q/mXowlsjEYkFoZrJ6+j+SBa+nK05Gn1XR3UGxbIU4qdXeIRO/hFWAwcGCLcUkvc9fQIGi+TAKw6dfdd4mlM60om9/cQF5Sj03Bly0aFe8KXwsn9c0UHT2obQ3JKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390492; c=relaxed/simple;
	bh=Jn7xrwX2rKsnXH4NUGXOfhDBeZ5J8qaGVa8QVyzgGFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdqzP5twQgrFgQA6xZ12MwSCPi04egyk9RGpGHIH4KnzPYevisvIlKlA+QjYqwARfjB+Gy+a4gzdfznqur9ffWgN6Wpk/ss7uxtHiIY2vKR4E25g0k2sRpdZEiy0v9iNf4+Xds6H5/J8q1W0AME9fCFw17jVkRLwQMFv5MkoA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdFEyYG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdFEyYG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47841F00A3A;
	Wed,  2 Sep 2026 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788390490;
	bh=WLPf47PWTCFDDNx/hJ7DIlBhf7CBEJ+2EGNvk/G2tFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AdFEyYG1POmduhOqP35FV1tuKCpmQOG67eJ77xV8Ia3z/yoYzjldNafTyGXNkuGy6
	 dF3E1BndNrblI68epN7r6k/0bXBw7ewNw5N4OPfCGFP4zDRHxiAzpGV9GePZ0gETum
	 DLHKAKvH8SPCiNdzXas2fOzbnUjntJzdCGyFhYMRB++pZlWaon8VG1DRWUhP0JQZzz
	 aReJiTNh8d5u3lDWuOsjSyLRTz5ZguuTjCZepoVh97O85Hnw7j4nrMoC6NCVzC9SC2
	 p458z7IUAEBS/NPS8zVulmV2gQJkeIP+zk9qLmf8m/W9SIsgCrjeclWC7Jvlm+LLwB
	 /iV6Osf4oTLvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/14] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-13-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
 <20260903-dw-hdmi-qp-yuv-v4-13-fb45bf4147eb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:08:09 +0000
Message-Id: <20260902230809.E47841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware PHY is programmed and driver software state is mutated du=
ring the DRM atomic_check phase.
--

commit 37fcce32843c9e542a409c0b36a4aca043a38c1a
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Enable YUV420 output format

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 78473f9a0fce3..1af29066a0a31 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -611,7 +611,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
> =20
>  	plat_data.supported_formats =3D BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> -				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
> +				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> +				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how the
atomic state machine is handled.

In dw_hdmi_qp_rockchip_encoder_atomic_check():

	ret =3D phy_configure(hdmi->phy, &phy_cfg);
	if (!ret) {
		hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
		s->output_type =3D DRM_MODE_CONNECTOR_HDMIA;
		s->output_bpc =3D conn_state->hdmi.output_bpc;
		s->bus_format =3D ingest_fmt;

Does this actively program the hardware PHY and mutate global driver state
(hdmi->tmds_char_rate) during the DRM atomic_check phase?

If userspace issues a DRM atomic test-only commit, it appears this will
overwrite hdmi->tmds_char_rate. Later, when the actual atomic commit is
performed with the same configuration, the early-return condition at the
beginning of the function will evaluate to true:

	if (hdmi->tmds_char_rate =3D=3D conn_state->hdmi.tmds_char_rate &&
	    s->output_bpc =3D=3D conn_state->hdmi.output_bpc &&
	    s->bus_format =3D=3D ingest_fmt)
		return 0;

Will this cause the driver to incorrectly skip configuring the PHY during t=
he
actual commit phase?

Also, could calling phy_configure() outside of the enable paths bypass
expected runtime PM references, risking bus faults if the block is suspende=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dw-hdmi-qp=
-yuv-v4-0-fb45bf4147eb@collabora.com?part=3D13
