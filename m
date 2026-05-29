Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD330F934
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037951; cv=none; b=meTYFXUx4QMdIJJv4JvysM63jYday9/WRl2tYjoHF61RpTeJjKeIltJxgm22NV0mZTBEaaJVBzkw6L2B394CjXuDkl+fDVk1+jsHT8U6z5jaZGDsjmp6ig1ulzwZcQ5HUhDNBK6kZgGDEDunlDyjNlYoEsmZD+7s/HbeVEykxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037951; c=relaxed/simple;
	bh=St5E5R7OS3lPM/stbb3ycHkxy1fxXzzRaZNmlv8kL6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uG4tjSptCY1thFJQ+S8rVeagdYPdFF+6YvqhZja3BSvsTgdbBAl3Kc4UCUtzCqJN9FHBL8dM2m+Yx8bjdRE7ds3C2BXFo0Ew4tldNpwqC1pFd3+JmCY14M8F+kxfW+sY29zQdF36Kzzu7nf5SehRNaJ25KbHpRMPo6NJNey2Uyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu1PXjym; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu1PXjym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01291F00893;
	Fri, 29 May 2026 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780037949;
	bh=K7UCCjzdzPJnaymTzSsUCK2Usi0gkersRKV3OkBu3DI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iu1PXjymio9Ch6lcpPG1Ptqo9L+KoiZyUWyzpAzuKfW0YBtnsFtzJ+CXPxY/aBGUA
	 2BuP75RA+MrwxOhB0lw83L0DGtCKyTcpmt45ORAVHSuksCPQLcbU38ekVDArtNFl1i
	 stwIZRhX5mDzhtEs7wt/3MilcOsoDiV8RS2KuGwkFmZAfqsp5eUyFhidlpwkG5/kMO
	 aqSN/2AydtdV9O3rdyHWWHYot82s4BZ9cwxUrMwPs1CccLf8g4hSfFcjFwVqVAbF6C
	 c4bsVyB5phlvB/tEvO72XLONItGgkf86sKN2Cm2zqCEfxLScnflenbCWviijAl2XlD
	 9Yl6RvOW+oyBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/panel: Add Ilitek ILI9488 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Reznichenko" <igor@reznichenko.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529062836.203990-3-igor@reznichenko.net>
References: <20260529062836.203990-3-igor@reznichenko.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 06:59:09 +0000
Message-Id: <20260529065909.A01291F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing NULL pointer check for the return value of device_get_matc=
h_data() leads to a kernel panic.
- [Low] The driver calls devm_drm_panel_add(), which is a non-existent func=
tion in the DRM subsystem, causing a compilation failure.
--

commit 279cca9ce157e0fd7f3b036067b2491d2e280fa4
Author: Igor Reznichenko <igor@reznichenko.net>

drm/panel: Add Ilitek ILI9488 controller driver

This commit adds support for the Ilitek ILI9488 DSI controller used in the
FocusLCDs E35GH-I-MW800-CB 320x480 MIPI DSI panel.

> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/d=
rm/panel/panel-ilitek-ili9488.c
> new file mode 100644
> index 0000000000000..7302766034fc9
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c

[ ... ]

> +static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct ili9488 *ili;
> +	int i, ret;
> +
> +	ili =3D devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
> +
> +	ili->desc =3D device_get_match_data(dev);
> +	ili->dsi =3D dsi;
> +
> +	dsi->mode_flags =3D ili->desc->mode_flags;

[Severity: High]
Is it possible for device_get_match_data() to return NULL here?

If the device is instantiated without matching device tree data (for exampl=
e,
via a manual sysfs driver bind to a DSI device created without an OF node),
device_get_match_data() will return NULL because the driver lacks an id_tab=
le
and only provides an of_match_table.=20

Dereferencing ili->desc immediately after might lead to a NULL pointer=20
dereference in these cases.

[ ... ]

> +	ret =3D drm_panel_of_backlight(&ili->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get backlight\n");
> +
> +	ili->panel.prepare_prev_first =3D true;
> +
> +	ret =3D devm_drm_panel_add(dev, &ili->panel);

[Severity: Low]
Does devm_drm_panel_add() exist in the DRM subsystem?

Looking at the DRM panel API, while there is devm_drm_panel_alloc() and
drm_panel_add(), there does not appear to be a devm-managed version of
drm_panel_add(). Will this cause a build failure when compiling the driver?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529062836.2039=
90-1-igor@reznichenko.net?part=3D2
