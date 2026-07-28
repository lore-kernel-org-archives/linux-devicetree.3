Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB63A9DA4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261562; cv=none; b=mdSKPwQZ04lpCtY3m2iMdC2KqPAe1YxrfxyOflZhe4+6MOJJ1U9WUYOJqb1x3JLDNyz7a5DH3y+fZodlpMYHA1m9ySTd3I24w9GR5P60t0yiC9fMzCJFjtDyl9MET3/5rarNfmIoJOiPpYGXUKqpjHFqKa7LewJhxGPE7rgQtEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261562; c=relaxed/simple;
	bh=5P9EbjtXYibkfd2Ts+ygXU/bp6VYo1EgLgpnePO2y5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HjbMS5cpXdO8sQlQa/TWTkoYYEDjCYDLIsFuhrjVKz8bw62H6HlGvcVuVi+kEtkGvu7jfy2XH/C4bld2x1KhcdnZw4X30jHSeipQxpOrWNm7CNaHIVUV4wwxfjr3V9trr417xQUXRe7KA4uKGzaKtLqApeiG0YRqw3I3yqbOciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCIoIJzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCIoIJzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED4A1F000E9;
	Tue, 28 Jul 2026 17:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785261560;
	bh=/fw9QSE2k7IsgMiJL6GU81wXH3ALqHXpbx5/TaAthks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QCIoIJzVccfxgGC8UedNrqTK5idM+MCf2WwxbSe1DV6gO/hyslEwSqNUHQg1XHIwy
	 fGCIa7m/hkOw6OQNlJNYcO+/wugyjM7W22q0zNhcAt99/qu2/rzpSFQDUzojNJ5YPm
	 F79l9O1ywuiIdy4j8ISn8emhppMo2zSl1siKgoKV9UOUAZNGeJd7ssoNzBgX+sp98P
	 5EVR/y1EklvFEIVwAS5qqBXu6otqYHSeVThfkzPrdrXa0PzZd6Yz/sMWBUpPw9FJNu
	 tW908F2aI0I91J9bnKXMVlOzADCMj1wAlJMd4mULrcOhm6Fevy0WZBlszISAjZGK0a
	 FRFKxkXJUTtEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/18] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-1-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-1-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 17:59:19 +0000
Message-Id: <20260728175920.3ED4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Premature global registration of the DRM bridge before resource in=
itialization.
- [High] Incorrect teardown order in `dw_dp_unbind()` causes hardware acces=
s after PHY shutdown.

Pre-existing issues:
- [High] Missing cancellation of asynchronous hotplug work leads to Use-Aft=
er-Free.
--

--- Patch [1]: [PATCH v7 01/18] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit d953a018bc82561ebc8b90aad3a536efae9649c9
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Date:   Tue Jul 28 17:40:37 2026 +0000

    drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind c=
allback
   =20
    Currently the Synopsys DesignWare DP controller driver's bind function
    requests lots of resources using device managed functions. These are
    free'd on driver removal instead of at unbind time. Fix this discrepancy
    by introducing a new probe helper function and moving over most of the
    early resource acquisitions.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 3445c82e6f50e..67d9cd0bf5fd4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	disable_irq(dp->irq);
>  	phy_exit(dp->phy);
> +	drm_dp_aux_unregister(&dp->aux);
>  }

[Severity: High]
Is this teardown order correct? Calling phy_exit() before
drm_dp_aux_unregister() powers down the PHY while the AUX device is still
registered.

If an active AUX transfer is waiting for completion in dw_dp_aux_transfer(),
disable_irq() will prevent the completion from firing, causing a timeout. W=
hen
it wakes up, it will attempt to read hardware registers. Because the PHY has
already been powered down, wouldn't accessing these registers trigger a bus
error?

> +EXPORT_SYMBOL_GPL(dw_dp_unbind);
> =20
> -struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> -			 const struct dw_dp_plat_data *plat_data)
> +struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_=
dp_plat_data *plat_data)
>  {

[ ... ]

>  	dp->dev =3D dev;
>  	dp->pixel_mode =3D plat_data->pixel_mode;
> -
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> +
>  	bridge =3D &dp->bridge;
> +	bridge->of_node =3D dev->of_node;
> +	bridge->ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_HPD;
> +	bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
> +	bridge->ycbcr_420_allowed =3D true;
> +
> +	ret =3D devm_drm_bridge_add(dev, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

[Severity: High]
Is it safe to register the bridge here?

By calling devm_drm_bridge_add() early in dw_dp_probe() before resources li=
ke
dp->regmap, dp->phy, and the dp->aux adapter are initialized, this makes the
bridge globally visible to other drivers prematurely.

If a concurrent driver discovers the bridge and initiates operations like
drm_bridge_edid_read(), could it attempt to use the uninitialized dp->aux
adapter and crash?

>  	mutex_init(&dp->irq_lock);
>  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);

[Severity: High]
This is a pre-existing issue, but is dp->hpd_work cancelled anywhere during
driver teardown?

The work struct is initialized and tied to the lifetime of the dp object, b=
ut
neither dw_dp_unbind() nor the remove function seem to call cancel_work_syn=
c().

Could this lead to a use-after-free if the workqueue continues executing and
accesses the freed dp memory after the device is unbound?

>  	init_completion(&dp->complete);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D1
