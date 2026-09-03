Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F35EEB3
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406889; cv=none; b=gnZ2lF8czB+lYR2l6bf18s2bfoov+QltxVRQraJVtgu1VdZx/8RTltM5RW/WOyVir0FSPT+Cj3Pr4n5Bd4W7rlJ5vOoVnBV9YOPOU1Rgj09VcFfOTpk4FT0JMDn2Gi7hopMX4b6VWDUR4GT4Ud9vXRYgTDtZAyrF35bxQjGcR94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406889; c=relaxed/simple;
	bh=X+F2zdhwyb3TWLjvxC+eVolji2cQvPdCDj2CX8lhT7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ui1/gtcjSysuKhyg1KzpLvg1Xw0eBrodGRTgz8yp/gI4jXFuMC7pxA9sjfL97gUhPKVFo5hi9B89G1aKUGz7rtZSTEi1ryau1PEHxSx5MhYGhWzUQ+uQjVNHrji8JBuh91O5wFdHr0aRjczcTr5hlZvKGeOjdzDinQdVB1w6hV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvOWonB+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvOWonB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8B31F000E9;
	Thu,  3 Sep 2026 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788406887;
	bh=i5G6VnmFShYHrpO/V4rqc9yWyThmWOo6lihVTDrgJ/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvOWonB+AU23DueAUaafvV/c1mBCiLxgcRU9x4gnMyIrhI0JEXEfWvQ0B+zNao9Ku
	 G94vK0ChHy0yVwmMROpGOx/yHd2X5uq8j8ufzjlbJefp6S1hmFAAOD63giGpRiBL5n
	 l9fKXdBZxpoKMvsbszTVH/QiP3k58RzmTfCBHGqTvcob/8qwO1x3XeaYUT/5Hj2S1L
	 R7UjfHEOKPZ0/LOIANRNI8oheu/vW1voVaCX64LI0sBk4wcfeJp3o+0iPLJL4F1q1F
	 RATi/aAK8UutfWCSq8j0S3MY93gwHXNhC88O03ikuDD3VmCFkbaGSAzoGSAnjyRy7b
	 +QoNcjPh2aSow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260903-b4-lvds-panel-doc-v4-2-861738a0d5de@oss.qualcomm.com>
References: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
 <20260903-b4-lvds-panel-doc-v4-2-861738a0d5de@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 03:41:26 +0000
Message-Id: <20260903034127.4C8B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DISPLAY_FLAGS_DE_HIGH flag in boe_dv215fhm_r01_timing is silen=
tly ignored because it is not propagated to the panel's bus_flags.
--

commit e8dda804d95e117a2144e77d29d6c181f747ad91
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

drm/panel: simple: Add BOE DV215FHM-R01 panel
   =20
This commit adds support for the BOE DV215FHM-R01 21.5" FHD (1920x1080)
dual-channel LVDS panel in the panel-simple driver.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index c95964ba25a95..0b516385b2673 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1593,6 +1593,31 @@ static const struct panel_desc boe_bp101wx1_100 =
=3D {
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
>  };
> =20
> +static const struct display_timing boe_dv215fhm_r01_timing =3D {
> +	.pixelclock =3D { 148500000, 148500000, 148500000 },
> +	.hactive =3D { 1920, 1920, 1920 },
> +	.hfront_porch =3D { 88, 88, 88 },
> +	.hback_porch =3D { 148, 148, 148 },
> +	.hsync_len =3D { 44, 44, 44 },
> +	.vactive =3D { 1080, 1080, 1080 },
> +	.vfront_porch =3D { 4, 4, 4 },
> +	.vback_porch =3D { 36, 36, 36 },
> +	.vsync_len =3D { 5, 5, 5 },
> +	.flags =3D DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc boe_dv215fhm_r01 =3D {
> +	.timings =3D &boe_dv215fhm_r01_timing,
> +	.num_timings =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 476,
> +		.height =3D 268,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +};

[Severity: High]
Does this panel descriptor need to set .bus_flags =3D DRM_BUS_FLAG_DE_HIGH?

The display_timing structure for boe_dv215fhm_r01_timing specifies
DISPLAY_FLAGS_DE_HIGH, but this flag appears to be silently ignored by the
panel-simple framework unless it is also propagated to the panel's bus_flag=
s.

When the boe_dv215fhm_r01 panel is probed and its modes are added via
panel_simple_get_non_edid_modes(), the connector assigns:

    connector->display_info.bus_flags =3D panel->desc->bus_flags;

Since .bus_flags is missing from the descriptor initialization here, it
defaults to 0. This causes the Data Enable (DE) polarity requirement to be
lost. If the controller defaults to DE low, the display might not function
correctly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-b4-lvds-pa=
nel-doc-v4-0-861738a0d5de@oss.qualcomm.com?part=3D2
