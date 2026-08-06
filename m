Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9838837B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037773; cv=none; b=vDwWiGGwR+MSZUDwjf3T2xgELPIMiSWDIp9bKF1NmtvDaz+P+P1VKqpGG4lxEZxu/aNwo2lTSi5thsTvvHntfwtl1yR4b7bZlVyhAzBFX9d3SdoilAi2WY1Lp0Pv61NkA3c7BdI06NXKPeKYK6iOAnNnENUMg7TAcFSJPhcf2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037773; c=relaxed/simple;
	bh=Ec5kTxAFUL2q6723fbf9uMAdiQfAhh91XzHXaO/TiWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oau+6jnVy4OGf2Ay1wpY29TMy5Yz8bo4uI/EQqLm/lSCoCaB3sFj12vojhQvhmm7RFm9sWAskzeshkqaDBd6yn/HtcaPnxVIm3Ws5XrSVsD7douILTxB9/l43roju8o96nN8qSjrnv8mh6XVkw09LBl0xIwp2fk3rBvLESOIQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJjJTpuY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJjJTpuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0807C1F000E9;
	Thu,  6 Aug 2026 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037772;
	bh=0RKZVfuZa99jY3AirSYoCBLlGcBW84Q07fUWGbKux70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJjJTpuY8vKMUL1H/kQ+/L/EBslis/rE/4fU7PfoE+6wb1dvMWAKm+6c9ouIyMJn0
	 01WayQBYC08rq9uyGrslJhkMl30a9xgd38o2bVX/Njn3wIwIPfbYCDvsLERZi3Pvh+
	 X7+mzQuF+aBqnyOgc+myw7b/B8uort5negzzyvv5dkst9eApYmnMXm2BjLGdVa4SHk
	 +fE1Leu1und623TDdeqk3xNLtxgq6BqSwMdeaxc8t51U3CZHdqLiUKlZHtutfnn/kv
	 H/PAer/cmFWmLfsUSDH7MK4N3pFyVHNjHfGWEt1gnW3OYFc9Ou+ELVjdNPZIoQO2JI
	 FAJYETd49199g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 02/21] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-2-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-2-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:36:11 +0000
Message-Id: <20260806173612.0807C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free and -EBUSY on re-bind due to missing drm_bridge_det=
ach in component unbind.
--

--- Patch [2]: [PATCH v11 02/21] drm/bridge: synopsys: dw-dp: Fix incorrect=
 resource lifetimes in bind callback ---
commit 8317a23524c759645b1aec330e9a401578a81a81
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callb=
ack

This commit moves the bridge allocation and resource requests from the bind
callback to the probe callback using a new dw_dp_probe() helper. It also
disables the IRQ in the detach callback to prevent spurious interrupts.

Reported-by: Sashiko <sashiko-bot@kernel.org>

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 60feb3d1e14bb..d7945f7fe9f05 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1982,6 +1988,18 @@ static const struct regmap_config dw_dp_regmap_con=
fig =3D {
>  	.rd_table =3D &dw_dp_readable_table,
>  };
> =20
> +int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
> +{
> +	return drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_=
NO_CONNECTOR);
> +}
> +EXPORT_SYMBOL_GPL(dw_dp_bind);
> +
> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	/* nothing to do as bridge is detached automatically */
> +}
> +EXPORT_SYMBOL_GPL(dw_dp_unbind);

[Severity: High]
Since the bridge allocation was moved to probe using devm, the bridge
structure now outlives the component bind/unbind cycle. If the bridge is
not explicitly detached here, does this cause issues during re-bind?

Specifically, if we unbind and re-bind the component, won't
drm_bridge_attach() in dw_dp_bind() return -EBUSY because the bridge is
still attached to the old encoder?

Additionally, can this cause a use-after-free on driver removal? If the
platform driver is removed while a DRM file descriptor is kept open, devm
will free the dp structure. When the file descriptor is eventually closed,
DRM core will call dw_dp_bridge_detach():

static void dw_dp_bridge_detach(struct drm_bridge *bridge)
{
	struct dw_dp *dp =3D bridge_to_dp(bridge);

	disable_irq(dp->irq);
	cancel_work_sync(&dp->hpd_work);
	...
}

Since dp was already freed by devm, will accessing dp->irq and dp->hpd_work
here crash? Should this unbind function explicitly call drm_bridge_detach()
to prevent both the re-bind failure and the use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D2
