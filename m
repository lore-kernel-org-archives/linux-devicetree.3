Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F455253958
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783288108; cv=none; b=Lq2+4DlPbIuHM0AorpZzTbBY7x0xf5j8jC6P9cTDll/5tF+Blsc1JGSGVCeFlrUHgvCFfpgQhWAXNdYKNU5QvSWzBZ8cBF5nrpxHk6XIYn3hQm6a00T19xqCpyL3QzJKxjP63CBNvdd4f60MxgTzQMgeSCt0rQWnGBMI+geQEl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783288108; c=relaxed/simple;
	bh=w4GTMUCYcF3k+EkHzVA+YC/gFhEwLMLrCdIlxXjBNPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bgb6GN0S3NrDQNiHZONx0v8V2r5VqmiwEcZAZeNCg8vL3VTEyVttME15I2i4Fn/hpy7TDJXnWAOVe+3PD5/5CsbRmU9GFpeQYAnbBjcD+NwrdGrr4UZiGshhqh/x4mD7QNpBVXEX7HxUySJmvremwhE+xy3NHc1Y+r672oFEk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJbaducx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJbaducx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628831F000E9;
	Sun,  5 Jul 2026 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783288106;
	bh=Tp86uxBuIZjZs9vBBJ1470oPYHfK/BnnieKa06s4UVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJbaducx5XEZKTwKoCYxOGimOV1iHcx89G0ASd2rj4v+9jv6i7+yFyBsH8N1Jucf1
	 Xoxk7d3Oo+94ZNGWHLTR2h+x7VhW7Z8XxOqLtpqN6fqtePnSlOACz1vLjE+zFEkBqb
	 o6Kvnp+A9XFNXUKKgpD9J5A9kttAbOrHrivhzsGFYrR82l40AC3uXR1v2CbWnmnmHm
	 98NRmmYe4A/VMACdts+OvLbGVmAglw/JU7lzDrrNVRahK3orAf4YBkTWOVl+d+/GNu
	 1dto7UyXFIdqqcvAXV44MqUDh5hYwPXAe+HScwZ4g5716+7s7rCfSbts93Lh5LMjV5
	 /RF4U4IAUW7jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/bridge: display-connector: Fix I2C adapter
 resource leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260705213542.28987-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 21:48:25 +0000
Message-Id: <20260705214826.628831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of devm-managed resources due to DRM bridge lifetim=
e mismatch
- [Medium] Hardware state leak of `ddc_en` GPIO on probe error paths
--

commit 9c76898e592dfddd3f50beaa692cc32ae295e2c7
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

drm/bridge: display-connector: Fix I2C adapter resource leak

If the probe function returns an error after getting the I2C adapter for
DDC, the reference to the adapter is never released. Fix it by releasing
it in the bridge .destroy() handler.

> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm=
/bridge/display-connector.c
> index d1e74dd2e0518..eb3412ec30a07 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -43,6 +43,13 @@ static int display_connector_attach(struct drm_bridge =
*bridge,
>  	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
>  }
> =20
> +static void display_connector_destroy(struct drm_bridge *bridge)
> +{
> +	struct display_connector *conn =3D to_display_connector(bridge);
> +
> +	i2c_put_adapter(conn->bridge.ddc);
> +}
> +
>  static enum drm_connector_status display_connector_detect(struct drm_bri=
dge *bridge)
>  {
>  	struct display_connector *conn =3D to_display_connector(bridge);

[ ... ]

> @@ -439,9 +447,6 @@ static void display_connector_remove(struct platform_=
device *pdev)
>  		regulator_disable(conn->supply);
> =20
>  	drm_bridge_remove(&conn->bridge);
> -
> -	if (!IS_ERR(conn->bridge.ddc))
> -		i2c_put_adapter(conn->bridge.ddc);
>  }
> =20
>  static const struct of_device_id display_connector_match[] =3D {

[Severity: High]
This isn't a bug introduced by this patch, but does the bridge lifetime=20
mismatch with devm resources cause a use-after-free?

In display_connector_probe(), the bridge is allocated with=20
devm_drm_bridge_alloc(), tying its lifetime to the DRM bridge kref:

display_connector_probe() {
    ...
    conn =3D devm_drm_bridge_alloc(&pdev->dev, struct display_connector, br=
idge,
                                 &display_connector_bridge_funcs);
    ...
}

However, devm-managed resources like the HPD GPIO and IRQ are tied to the=20
platform device unbind. If the device is unbound via sysfs while the DRM=20
core still holds a reference to the bridge, devres will free the GPIO and=20
IRQ resources.

If the DRM core later invokes callbacks like detect or hpd_disable, would i=
t=20
dereference the freed GPIO or attempt to disable the freed IRQ?

display_connector_detect() {
    ...
    if (gpiod_get_value_cansleep(conn->hpd_gpio))
    ...
}

display_connector_hpd_disable() {
    ...
    disable_irq(conn->hpd_irq);
    ...
}

[Severity: Medium]
This is a pre-existing issue, but is there a hardware state leak on the=20
probe error path?

In display_connector_probe(), the DDC enable GPIO is acquired and=20
immediately asserted high:

display_connector_probe() {
    ...
    if (type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
        ...
        conn->ddc_en =3D devm_gpiod_get_optional(&pdev->dev, "ddc-en",
                                               GPIOD_OUT_HIGH);

        if (IS_ERR(conn->ddc_en)) {
            ...
        }

        ret =3D display_connector_get_supply(pdev, conn, "hdmi-pwr");
        if (ret < 0)
            return dev_err_probe(...);
    ...
}

If a subsequent step like display_connector_get_supply() or=20
regulator_enable() fails, the function returns an error. While devres will=
=20
free the GPIO descriptor, it doesn't revert the physical pin state.

Unlike display_connector_remove() which explicitly sets the GPIO to 0, does=
=20
this error path leave the DDC bus permanently enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705213542.2898=
7-1-laurent.pinchart+renesas@ideasonboard.com?part=3D2
