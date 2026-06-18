Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6935838A
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778748; cv=none; b=lg3QHrhMdx4oudNBZ2CGvOhqwa0Gurm4mgasf69kq6k7VTC3QM60wgExQHE4dm9fixoK3DV04V507VDIJ4k2YbflIa3W9ce1X3Cp5+cvdBQTaiHp9aP/GVjKSpitABUo0MJTghsY5kG5A5rctb10zd38fkdiWNJZ7RxSWXn0Ovo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778748; c=relaxed/simple;
	bh=GEAZFzgykOTJ3oLUJPK29eLxfh3CbSvczbxZG7sj5PE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KK87tlGx51VjY7LI2aOulLtT/pLO/dbX7RuyOWIj8bYipsDZG7icuyRzUIbS00NhS+FaMYVhU6cUTod5GmE5DXRKNKNqD7hYpoKTRRE+kyw3Fv816hS//o3zkXzicO4OEr70MSUG5yO+5oXT27kl/y2rG/RVbJLe7NEJaorBUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGITPyEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGITPyEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82581F000E9;
	Thu, 18 Jun 2026 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781778747;
	bh=W6rEgeEeqygUkmFeq2ogoXjlREWW/dmk0kBslBFvzwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGITPyEhqNbuKau+J7QXnvr3U/OdTvv3VjgT1NONzmxhGhuHRxjLAi0yQJPK3Pcdj
	 JwNjpUZfuP6rjEcrcTo11Qa4/Ip5iZ24hF1P+yoVsqBnET9Bp7psBoucPb87foxBxq
	 qp9+AHyapZl1BtNc04Pu/720GiYfufv75UN9NzIZTWyjvne62NJSNi1k3s0j6gpjOr
	 bw/KmjdkIM2OccibwkhCWP8Gig1UcbP7IG45Xe05jMpRUS4Y6DNgIdQ7D6plIw1z3y
	 vvDNap82vKeMT0X8sSyzFMMjw0JEcxDcbR9x4gm8ZwkC6N4wllgdeUVdEcjXdiyx/V
	 SkSUGO4/MLnBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: add Ilitek ILI7807S panel driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arpit Saini" <arpit.saini@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260618-ili7807s-v2-2-b3f0c109b102@oss.qualcomm.com>
References: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
 <20260618-ili7807s-v2-2-b3f0c109b102@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 10:32:26 +0000
Message-Id: <20260618103226.C82581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Inverted manipulation of MIPI_DSI_MODE_LPM in backlight update_sta=
tus callback permanently corrupts DSI mode flags.
- [High] Concurrent read-modify-write operations on dsi->mode_flags can cau=
se state corruption.
- [Medium] Backlight update_status callback sends DCS commands without chec=
king if the panel is powered on.
- [Medium] Incorrect devm registration order causes the DSI device to be de=
tached while the DRM panel and backlight sysfs are still active.
- [Medium] Missing NULL check for the return value of of_device_get_match_d=
ata() leads to a potential NULL pointer dereference.
--

commit 97a4deef0ca55e71f3420d40260130de4242cae3
Author: Arpit Saini <arpit.saini@oss.qualcomm.com>

drm/panel: add Ilitek ILI7807S panel driver

This commit adds a DRM panel driver for the DLC DLC0697 1080x1920@60Hz
MIPI DSI panel based on the Ilitek ILI7807S display controller.

> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili7807s.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c

[ ... ]

> +static int ili7807s_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> +	u16 brightness =3D backlight_get_brightness(bl);
> +	int ret;
> +

[Severity: Medium]
Is it safe to send DCS commands here without checking if the panel is
currently powered on? If userspace writes to the sysfs brightness control
while the regulators are disabled and the panel is off, will this attempt
to send commands and cause DSI bus timeouts?

> +	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

[Severity: High]
Does this sequence invert the intended mode flags? The default panel mode
flags do not include MIPI_DSI_MODE_LPM. Clearing it beforehand and setting =
it
afterward will permanently force the DSI host into Low Power Mode after the
first backlight update, which might break subsequent video transmissions.

[Severity: High]
Can concurrent calls to ili7807s_on(), ili7807s_off(), and this backlight
update callback cause a data race? These functions all modify dsi->mode_fla=
gs
using non-atomic bitwise operations, which might clobber each other's chang=
es
if a backlight update is triggered from userspace simultaneously with a DRM
DPMS event.

[ ... ]

> +static int ili7807s_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	const struct panel_desc *desc;
> +	struct ili7807s *ctx;
> +	int ret;
> +
> +	ctx =3D devm_drm_panel_alloc(dev, struct ili7807s, panel,
> +				   &ili7807s_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	desc =3D of_device_get_match_data(dev);
> +	ctx->desc =3D desc;

[Severity: Medium]
Can of_device_get_match_data() return NULL if the driver is bound manually
via sysfs without an associated device tree node? If so, will dereferencing
desc->lanes later in this function cause a NULL pointer dereference?

[ ... ]

> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add panel\n");
> +
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to attach dsi\n");
> +
> +	return 0;
> +}

[Severity: Medium]
Does this devres registration order cause a teardown issue? Since devres
cleans up in reverse order of allocation, devm_mipi_dsi_detach() will run
before the DRM panel and backlight interfaces are removed. Could this leave
the sysfs interfaces exposed to userspace while the underlying DSI device is
already detached?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ili7807s-v=
2-0-b3f0c109b102@oss.qualcomm.com?part=3D2
