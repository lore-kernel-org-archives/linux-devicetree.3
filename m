Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD137A829
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543676; cv=none; b=mJRcIx2kMNQtLXBQ99nZb9gTgBivOFVtIiD5LSJZClzScESqRrGk4irUAoWUx8OqGAqrDzmIj3o6ITgsGipcQomtKvX1QPhv043O4Dxs8s81pL9CK589MTxnHImdRA7EtyGFJwnLkkbJXyiZjVEZqdESIuZPhwVa/t1EzDYiigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543676; c=relaxed/simple;
	bh=QBzNdRtS7JcK31xOiJwNDWpm/GSDIEyr5WCGCqD6XYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hIOiGXR1MTELe2VE7pUz9TSpC+6c3zCfgKaQp6qCYaYDJIUBrCxmrj32PubgLbOL/kimCPGrHPfYpeHrELUx8LS7BnWTzxX+qmEJuimxkF1Uy3l+Ahkb+VGKWqtjvdMFrNMw/TNUPjfZSejqbJ4K1+ToXAYnysihAlYQwcb4wyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLdtlL5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLdtlL5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B9D1F00A3D;
	Fri,  4 Sep 2026 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788543675;
	bh=YusEUZyQ5+YYORtWEn5uAmqra/Skq1w9OYjuDPNcdhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLdtlL5ze4sza34RguF94HwCHpI5oWriVvXe/jlgLCQn7AVHwXr4owEB458NVGntQ
	 VP8tkcfs1Kwn6tJNllVkHOxS4/0LO5L3/0FckJhd3mo3kReGl8qpObovf49ejcGMLd
	 B3saVE2jiWQIKbUGi4CoeFKuJH50Eq+IRCeLM5WoGG9Mm7ASrhPGekb82VdvhVgxnr
	 vYjAELw8ZohGfvmxnxJZYrW51BmSOjy1UxnczqmKFpWXhguFhiu7ZXB3/P9LkZePaE
	 +XjAkUnU5T0ECIQuJM/BdA4AEeSTL8BhklTg1LYQg/f9MJC2aDOl0sYMxfIQyNJBDk
	 wJvSVdiHyAPaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: add support for lontium lt9211c
 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: vishnu.saini@oss.qualcomm.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260904-add-lt9211c-bridge-v8-2-36d66168e176@oss.qualcomm.com>
References: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
 <20260904-add-lt9211c-bridge-v8-2-36d66168e176@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 17:41:14 +0000
Message-Id: <20260904174114.D7B9D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-after-free of `ctx->dsi` in the deferred work item during devi=
ce unbind due to incorrect devres registration order.
--

commit f4afb8a9dbec6141c1ce6b1a75c1128b1885dc29
Author: Yi Zhang <zhanyi@qti.qualcomm.com>

drm/bridge: add support for lontium lt9211c bridge

This commit extends the existing lontium-lt9211 driver to support the
LT9211C variant. It adds LT9211C-specific regmap support, initialization
sequences, and schedules a work item to handle RX auto-detection once a
DSI stream is active.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/br=
idge/lontium-lt9211.c
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c

[ ... ]

> @@ -454,6 +552,656 @@ static int lt9211_configure_tx(struct lt9211 *ctx, =
bool jeida,
>  	return 0;
>  }
> =20
> +static int lt9211c_configure_rx(struct lt9211 *ctx)
> +{
> +	unsigned int pval;
> +
> +	const struct reg_sequence lt9211c_rx_phy_seq[] =3D {
> +		{ REG_DSI_LANE, REG_DSI_LANE_COUNT(ctx->dsi->lanes) },

[Severity: High]
Does this code dereference a freed pointer during driver unbind?

When the device is unbound, the workqueue is destroyed, which flushes any
pending work. If the work item executes here, it dereferences ctx->dsi,
but ctx->dsi might have already been freed due to the devres teardown order
configured in lt9211_probe().

[ ... ]

> @@ -748,45 +1516,48 @@ static int lt9211_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> -	ctx->regmap =3D devm_regmap_init_i2c(client, &lt9211_regmap_config);
> +	ctx->chip_data =3D i2c_get_match_data(client);
> +	if (!ctx->chip_data)
> +		return -ENODEV;
> +
> +	ctx->regmap =3D devm_regmap_init_i2c(client, ctx->chip_data->regmap_con=
fig);
>  	if (IS_ERR(ctx->regmap))
>  		return PTR_ERR(ctx->regmap);
> =20
> -	dev_set_drvdata(dev, ctx);
> -	i2c_set_clientdata(client, ctx);
> +	if (ctx->chip_data->chip_type =3D=3D LT9211C) {
> +		ctx->wq =3D create_workqueue("lt9211_work");
> +		if (!ctx->wq)
> +			return -ENOMEM;
> +		ret =3D devm_add_action_or_reset(dev, lt9211_destroy_wq, ctx->wq);
> +		if (ret)
> +			return ret;
> +		INIT_WORK(&ctx->lt9211_work, lt9211_work_func);
> +	}
> =20
>  	ctx->bridge.of_node =3D dev->of_node;
> -	drm_bridge_add(&ctx->bridge);
> -
> -	ret =3D lt9211_host_attach(ctx);
> +	ret =3D devm_drm_bridge_add(dev, &ctx->bridge);
>  	if (ret)
> -		drm_bridge_remove(&ctx->bridge);
> -
> -	return ret;
> -}
> -
> +		return ret;
> =20
> +	return lt9211_host_attach(ctx);
>  }

[Severity: High]
Is there a devres order mismatch here that leads to a use-after-free?

Because devres actions are executed in reverse order of addition, registeri=
ng
the workqueue teardown action before registering the DSI device in
lt9211_host_attach() means the DSI device will be unregistered and freed
before the workqueue is destroyed.

During driver unbind, if the initialization work is pending, the workqueue
destruction flushes and executes it. The work function then calls
lt9211c_configure_rx(), which accesses the already freed ctx->dsi pointer.

Could the workqueue destruction be deferred until after the DSI device is
attached, or could the DSI device attachment be moved earlier in the probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-add-lt9211=
c-bridge-v8-0-36d66168e176@oss.qualcomm.com?part=3D2
