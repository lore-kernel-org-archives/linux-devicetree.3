Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13BC3D3499
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937365; cv=none; b=HeCrmkcRldtBShHTd1DLwTp+vwugW9MXlI51wmHKuS5+hgeMi+1BMZYDloRllwroqQZVTmxass81ANeek90lHPdzaCZYYh8yTnH/2tZ3rf1E/xBlIjCGsoJbxIzoQ72jSlSNwDUS8SPD6KYblKsE3DAFjo2BM773l8VLsiRr6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937365; c=relaxed/simple;
	bh=lhkVoLG495cUVPmVRblOAVrZc/N5vx5RtBT1oDrNgmc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZyFyJ5ikXqqGW9RwUgLkm/lfmt/SoXDKYdRwpGqWDAWACdztUHfjLQCBiDOTxCSXbAqraPZKXINCyuJWyI/fy3ejfLkq038if8dVqIjCcVhjDJHcQuOvnhK508j1ul3E5494NOj52w2O67sXxnl3zPnBB1qwu09hK3KBIC6xyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfFIO8Qe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfFIO8Qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83EB1F00893;
	Mon,  8 Jun 2026 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780937363;
	bh=s1PTTZvphbbwnAu1zwivaHaLice3xJM8yjaB+le9/as=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfFIO8QeCPyVO6Hg66PINzp21pSUEbTdK+KeKQ4/zJ7c1RpL7jOZa3qpBjw1yHHhg
	 llcjGk7Qc1Vs30xA8EHtczdv1MV9MHlcw4Z5b/iFnZCc6s1OcB3UGYldPzxwUijUET
	 BEKvTeW7MiEFUF6qyyWBl0H1fb8YKWSbwMiT2uHye0ymW1TX+9M47km+WUgTrhgIEM
	 etUhcCeU/xsMQK8eWJKTEue47WbCA1Qoidn9iGaEFCcsHpPcogPDczLZWL42SqciDJ
	 zPmuYb9URYMOOs4g7sFgtEvFPnq4vTH+Iifji9iPTRMbdrwNJSZLmOa8ZCjMLodTC3
	 NN6YycWv9x1nA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/panel: himax-hx83121a: add backlight regulator
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608162622.403713-3-zhengxingda@iscas.ac.cn>
References: <20260608162622.403713-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 16:49:22 +0000
Message-Id: <20260608164922.C83EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Probe fails unconditionally if the optional backlight regulator is=
 not present in the device tree, breaking backward compatibility.
- [High] Skipping the DCS brightness command when brightness is 0 prevents =
the backlight from turning off on devices without an external regulator.
- [Medium] The backlight supply regulator's enable count is leaked if the d=
river is unbound while the backlight is active.
--

commit 700de7e190150a663957123f411692a25d437849
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

drm/panel: himax-hx83121a: add backlight regulator support

This patch adds support for an external backlight regulator to the
himax-hx83121a panel driver. It turns off the regulator when brightness
is 0 and enables it when the backlight is operating.

> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83121a.c b/drivers/gpu/d=
rm/panel/panel-himax-hx83121a.c
> index 1a7e0125bced8..e31e2fba0a787 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83121a.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
[ ... ]
> @@ -195,7 +197,27 @@ static int himax_bl_update_status(struct backlight_d=
evice *bl)
>  {
>  	struct himax *ctx =3D bl_get_data(bl);
>  	u16 brightness =3D backlight_get_brightness(bl);
> +	int ret =3D 0;
> +
> +	if (!brightness) {
> +		if (ctx->backlight_enabled)
> +			ret =3D regulator_disable(ctx->bl_supply);
> +		if (ret)
> +			return ret;
> +
> +		ctx->backlight_enabled =3D false;
> +
> +		return 0;
> +	}

[Severity: High]
Does this early return prevent the display from turning off the backlight=20
via DCS?

For panels that do not have an external bl-supply regulator and rely entire=
ly
on DCS commands, disabling the dummy/absent regulator is a no-op, but the
early return bypasses the mipi_dsi_dcs_set_display_brightness_large() call.
Will this leave the backlight powered on at its previous level when it shou=
ld
be turned off?

> +
>  	/* TODO: brightness to raw map table */
> +	if (!ctx->backlight_enabled)
> +		ret =3D regulator_enable(ctx->bl_supply);

[Severity: Medium]
Could this leak the regulator enable count if the driver is unbound while t=
he
backlight is active?

If the panel driver is unbound or the module is removed while brightness is
greater than 0, the devres infrastructure will unregister the backlight
device without triggering an update_status to 0. Since there is no explicit
disable in a remove callback or devm_add_action teardown hook, will the
subsequent regulator_put() hit a warning for a non-zero enable count?

> +	if (ret)
> +		return ret;
> +
> +	ctx->backlight_enabled =3D true;
> +
>  	return mipi_dsi_dcs_set_display_brightness_large(to_primary_dsi(ctx),
>  							 brightness);
>  }
[ ... ]
> @@ -647,6 +669,10 @@ static int himax_probe(struct mipi_dsi_device *dsi)
>  	ctx->panel.prepare_prev_first =3D true;
> =20
>  	if (desc->has_dcs_backlight) {
> +		ctx->bl_supply =3D devm_regulator_get_optional(dev, "bl");
> +		if (IS_ERR(ctx->bl_supply))
> +			return dev_err_probe(dev, PTR_ERR(ctx->bl_supply),
> +					     "Failed to get backlight supply\n");

[Severity: High]
Will this break probe backward compatibility for existing device trees?

The devm_regulator_get_optional() function returns ERR_PTR(-ENODEV) when the
requested regulator is absent from the device tree. Because this bl-supply
property was just introduced and is optional, existing devices do not have =
it.
Should this code explicitly check for and handle -ENODEV (for example, by
setting the pointer to NULL) instead of failing the probe unconditionally?

>  		ctx->backlight =3D himax_create_backlight(ctx);
>  		if (IS_ERR(ctx->backlight))
>  			return dev_err_probe(dev, PTR_ERR(ctx->backlight),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608162622.4037=
13-1-zhengxingda@iscas.ac.cn?part=3D3
