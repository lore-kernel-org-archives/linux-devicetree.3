Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C09449B1B
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720365; cv=none; b=rJY8dVzRWfDazzDhNWsePIZH0d6PkGGJwnQOU0h0ORirBbY6oL1ZkpBItC9hUg/TS8FxfhxijRlcmYcibtE1AzZHbvtdt5UGoVdxsy4T8tip9m63ikvuAR3TwKq2iqGHnz8+U/RYrnYIy4SJuwnaa5zKFfj4HDlowHX3zKx9ges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720365; c=relaxed/simple;
	bh=wdnzU5mOrxe2Z6nOXnjkLDeGIupHAoJclyH8rs50rS4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OiZyqaJ638m81JJYQoOuL+CbRG+B9SCarMikEO/+e6dzqasCcbzC66XER6qp89FpZxVNHzLW50lvM9u9W2bjfLbGOsH18Mh8zVkfeKFLch26VL+1ppMhnhf5R70hzB4uR85jEPWLnW1IVXJDJji4DGQu/ElrbnYzxU+ZuFgDSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtfUWMqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtfUWMqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5098C1F0089C;
	Sun, 11 Oct 2026 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720353;
	bh=MNLCQspolKcCIMDjldD6RTX5OPFjK2nxySy34gwW64M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtfUWMquR+3g/q4ImMXvEZ/PULdyI0pXrnY8XuQ2xzuKMbA/havMuGWc0GE/7OJQU
	 BeXVDR7FuoXjLfMP3u3PfCz/0B7Jb+9vJBX0vTPgrn44wboc4kBmIzHMikxXXrtiLJ
	 6fpNgz22jvYfQzl3j8RRlAg4dcBtXvBOEy2e3ZLCgIlUrOXMyhrEythlpyOX4yrIzV
	 bBBe8UO3+8HYHEEFo+18C5eQdLYV9/zUskDDSTodvVhSCP7h+aFQiVl70BYVk9JeoO
	 Etbbv19og/fbZD9daMIakvFHcipZ/q/cWmdRdAa6E1EXSZmpENDvkdEVkdvrFm1l7Q
	 AQIglTJVsPLhA==
Message-ID: <sashiko-outbox-167214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] drm/panel: novatek-nt36672a: Add 3 panels used
 in Xiaomi phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Minnekhanov" <alexeymin@minlexx.ru>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261011-nt36672a-panels-v3-6-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-6-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:05:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm: panel: missing accum_err reset skips panel sleep on deinit =
error
- [Medium] drm/panel: nt36672a: regulator leak in prepare() error path
--

commit 219f9f92346f508583b813b9a7fbcd8b92f75a49
Author: Alexey Minnekhanov <alexeymin@minlexx.ru>

drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones

Add support for 3 panels used in 2 Xiaomi smartphones, all based on
Qualcomm SDM636/660 SoC:

* Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
  exact model string is unknown
* Tianma TL063FVMC43-02  for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
* Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index a445c8067aa5f..d356348d39608 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c

[ ... ]

> +static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *ds=
i_ctx)
> +{
> +	dsi_ctx->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +}

[Severity: Medium]
If mipi_dsi_dcs_set_display_off_multi() fails, it sets dsi_ctx->accum_err t=
o a
negative error code. Since there is no dsi_ctx->accum_err =3D 0; after it, =
will
the subsequent mipi_dsi_msleep() and mipi_dsi_dcs_enter_sleep_mode_multi()
calls immediately exit as no-ops?

This seems like it would abort the deinitialization sequence prematurely,
skipping the panel sleep command and required delays before system regulato=
rs
disable power.

For comparison, tianma_fhd_video_send_deinit_cmds() explicitly resets accum=
_err
to continue with the power-down sequence even if prior commands fail.

While looking at how the new send_init_cmds() function interacts with the
preparation path:

drivers/gpu/drm/panel/panel-novatek-nt36672a.c:nt36672a_panel_prepare() {
	...
	dsi_ctx.accum_err =3D nt36672a_panel_power_on(pinfo);

	/* send init cmds */
	if (pinfo->desc->send_init_cmds)
		pinfo->desc->send_init_cmds(&dsi_ctx);

	if (dsi_ctx.accum_err < 0)
		gpiod_set_value(pinfo->reset_gpio, 0);

	return dsi_ctx.accum_err;
}

[Severity: Medium]
If send_init_cmds() fails (for example due to a MIPI DSI write timeout) and
returns a negative dsi_ctx.accum_err, does this leak the regulator reference
count?

It looks like the error path pulls the reset GPIO low and returns the error
code, but fails to call nt36672a_panel_power_off() or regulator_bulk_disabl=
e()
to clean up the regulators enabled earlier by nt36672a_panel_power_on().

Since the DRM core's drm_panel_prepare() does not set the panel's prepared
flag to true on error, drm_panel_unprepare() will skip the unprepared panel,
leaving the regulators permanently enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-nt36672a-p=
anels-v3-0-9ea238627f8a@minlexx.ru?part=3D6
