Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C11442FD8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513026; cv=none; b=P/PkYNAsyTJqMSxFxvrhP6/ZiDSkrLW77KdeRXTGlQDGu2rOQGb/TQBayCSiI69a/RItnciQh4dCP/X3XIPk/b8AzcqX/eKN/oSP6wlj3kPNwxNT++TfKyxsgwmEIrSVxbl7+sxHiT1JrYeFUv1tsVepYMEy1mnjbbwlJYG7ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513026; c=relaxed/simple;
	bh=ayk4Maf/UOLiXDyqVOlRM7lrMJLTlW3yVaznk6I4SFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rAfhTlCMqaNypF/2vvUJV4O0SSjyMfRneyYA2oJcH3Gk7tdN+bsixUXsgbsnZr3FtntJBRCzIedf9Vdv8igi+72MjMYw3+Tz7W6npzMeSl0CpDBsvPkpMZJBNP9mWBuYR0xNoN3hQlgoTrn1F4bUgu19ZuuJfu+Umo4Nr0x4hbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjugO9Mb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjugO9Mb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EBF1F00A3D;
	Fri, 31 Jul 2026 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513023;
	bh=CQZ3cAskTiDl7tR3fmut01xCZl1oIh0uhY8slfCYFMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjugO9MbECW2q8NJKCHVvXZk1tIn5j9jXrKCmUZ+hgn/R5BBhNKBmDuEfVza+aLVb
	 l2CI9PHldwBmcwuDaSgST6YnSN5DXmlE7a4jGAFUYkuwqQQD0UMQGk1+uEwjGxY4PJ
	 vMJ9JRib86OlolBe3+/Ilu7MZXUzSkjitDxiTICZDYsWfwwIMcTExBnykDckRcTWR/
	 MhC8Hghu1gXAVdPuUK0OmXGBYGc0YYx+LRRZ56IHO4MPFodW8EN58xCcPxzxgo1ii8
	 G7cFwvLFFSSiG8yMJhopkW1XKkd4z0tWv9WT2DNGXBy/kFpR4PMfrhxbmUC9rpTKqp
	 YnLp+KROBiPNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/21] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-5-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-5-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:50:22 +0000
Message-Id: <20260731155022.B9EBF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DRM bridge is registered to the subsystem before its internal =
resources (IRQ and workqueue) are fully initialized, creating a race condit=
ion that leads to a Use-After-Free.
- [High] The completion structure `dp->complete` is not reinitialized befor=
e an AUX transfer, causing subsequent transfers to prematurely return if a =
previous transfer timed out.
- [High] The shared `dp->link` state is modified without locking during con=
nector detection, racing with link training in the atomic modeset path.
--

--- Patch [5]: [PATCH v8 05/21] drm/bridge: synopsys: dw-dp: Add missing mu=
tex cleanups on module removal ---
commit a0602d7d2fea7b25f801546caecd555dc659c65d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add missing mutex cleanups on module removal

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index a8ae13cf91d60..f373643a9cc10 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2027,9 +2027,12 @@ struct dw_dp *dw_dp_probe(struct platform_device *=
pdev, const struct dw_dp_plat_
>  	dp->pixel_mode =3D plat_data->pixel_mode;
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> =20
> -	mutex_init(&dp->irq_lock);
>  	init_completion(&dp->complete);

[Severity: High]
This is a pre-existing issue, but since we are looking at the initialization
of dp->complete, I noticed that dw_dp_aux_transfer() waits for this
completion without reinitializing it:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_aux_transfer() {
	...
	regmap_write(dp->regmap, DW_DP_AUX_CMD, value);

	status =3D wait_for_completion_timeout(&dp->complete, timeout);
	if (!status) {
		dev_err(dp->dev, "timeout waiting for AUX reply\n");
	...
}

If a transfer times out, wait_for_completion_timeout() returns -ETIMEDOUT
and leaves the completion state unchanged.

If the hardware later generates a delayed interrupt and dw_dp_irq() calls
complete(&dp->complete), wouldn't the next invocation of
dw_dp_aux_transfer() immediately return success by consuming the stale
completion before the new transaction finishes?

> =20
> +	ret =3D devm_mutex_init(dev, &dp->irq_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

[Severity: High]
This isn't a bug introduced by this patch, but looking further down in
dw_dp_probe(), could the probe error handling cause a Use-After-Free?

The bridge is registered globally before the IRQ is requested:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_probe() {
	...
	ret =3D devm_drm_bridge_add(dev, bridge);
	if (ret)
		return ERR_PTR(ret);

	dp->irq =3D platform_get_irq(pdev, 0);
	if (dp->irq < 0)
		return ERR_PTR(dp->irq);
	...
}

If devm_request_threaded_irq() or another subsequent step fails, devres will
free the struct dw_dp memory.

If a KMS driver probing concurrently has already found and attached to the
bridge via of_drm_find_bridge(), wouldn't it hold a dangling pointer to the
freed bridge?

[Severity: High]
This is another pre-existing issue, but I wanted to ask about the locking
around the shared dp->link state.

When userspace triggers connector detection, dw_dp_link_parse()
zero-initializes dp->link fields:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_link_parse() {
	...
	dw_dp_link_reset(link);

	ret =3D drm_dp_read_dpcd_caps(&dp->aux, link->dpcd);
	...
}

Concurrently, a non-blocking atomic modeset commit executing in a workqueue
might call dw_dp_link_configure(), which reads those same fields:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_link_configure() {
	...
	ret =3D dw_dp_phy_configure(dp, link->rate, link->lanes, link->caps.ssc);
	...
}

If the read in dw_dp_link_configure() races with the reset in
dw_dp_link_parse(), could the driver program link->rate =3D 0 and
link->lanes =3D 0 into the PHY registers?

>  	res =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(res))
>  		return ERR_CAST(res);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D5
