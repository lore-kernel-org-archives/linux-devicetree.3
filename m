Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E983370AEC
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785977892; cv=none; b=BVulNgBdj8CVBprNumjC0G2fDzEx5wmuBnq2EvrBdAsOaTYJbtvyRW10QgihvkBFafzgXStp6syBwpIthRsRFT5n+CoqJzKhga4Hd9F4adyJ3MVVfaEo8GFlJjWgZ+sYdvMT8QSDXyYuqGwDktNx3vK77go8cVX+t1t0r+uypLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785977892; c=relaxed/simple;
	bh=UD83pf3Ll8LcoznejXr6VEsc7P4KP09D/zyorTEyLHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L6K1EOlBQNhJ15TH1824TbMi6DjIxm1XpP4wIfZlYYmUQvSkWNgKn3LgNdXhPRwUn7/4zcbLA4Omf6lmWVK3rLeCikhBt4C7ef09+U87NiM7vTX282+ZfHzDMjJy2u/xSGTSM7a2AFJHxiYsIQkysREWv64yuoZ89hE9KS6zB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRZGIQoP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRZGIQoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5498E1F000E9;
	Thu,  6 Aug 2026 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785977890;
	bh=7AWH//gXPFLvXN3gdc4kzHqE9I2/zeqwyaviqZE30VY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QRZGIQoPy+hRdOgZf/mK6glGGMRqNnzVqqtQx/5CMJ4SjK/o8B1dxgQXn7luYU+xp
	 GqmZWG3xz8JeYKyFZr7/b5rPUdDtfSwG05DmM04e/SsPtpkqIfSzVgcRei/KXyf9FF
	 Jn7nKjtfv+IGnhrMimdB2/XyJ9jLlXoQY0NO3mv3GxdpZuK7XcaVaIZPUZHpY3K+HI
	 a1B8Ugm8VSFACGzN/byRrzHmV4UbQuGHWHjpJxgZ+ApzTTVQVl5DYvanMD0X2z/f90
	 FAZLKZ70e4jIn1WcDkFtdNTHpGoOKepeLTQYuiCphGG4aPuhbgXnZLltOAlWqwBuyP
	 7guuOpU36+R4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/21] drm/bridge: synopsys: dw-dp: Add missing
 mutex cleanups on module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-5-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-5-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 00:58:09 +0000
Message-Id: <20260806005810.5498E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of asynchronous hpd_work in devres teardown l=
eads to Use-After-Free.
- [High] TOCTOU race in dw_dp_link_retrain() can cause DP link training whi=
le the PHY is powered off.
- [High] Missing reinit_completion() in dw_dp_aux_transfer() breaks subsequ=
ent AUX transfers after a timeout.
--

--- Patch [5]: [PATCH v10 05/21] drm/bridge: synopsys: dw-dp: Add missing m=
utex cleanups on module removal ---
commit 58a91370c6467a81d51233b812a70d21f2296081
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add missing mutex cleanups on module removal

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index fd7663013faaa..535af11e617c4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2045,10 +2045,13 @@ struct dw_dp *dw_dp_probe(struct platform_device =
*pdev, const struct dw_dp_plat_
>  	dp->pixel_mode =3D plat_data->pixel_mode;
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> =20
> -	mutex_init(&dp->irq_lock);
>  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);

[Severity: High]
This isn't a bug introduced by this patch, but since we are fixing cleanups
on module removal here, does the asynchronous hpd_work also need to be
canceled during devres teardown?

If the driver is unbound, devm_request_threaded_irq will free the IRQ. If a
hotplug event occurred right before this, hpd_work could be scheduled. Since
there is no devm action to cancel the work, the work handler dw_dp_hpd_work=
()
could execute after devres has freed the struct dw_dp memory and destroyed
the irq_lock mutex, leading to a use-after-free when it calls
mutex_lock(&dp->irq_lock).

>  	init_completion(&dp->complete);

[Severity: High]
This is also a pre-existing issue, but I noticed dw_dp_aux_transfer() uses
this completion without reinitializing it.

If an AUX transfer times out:

dw_dp_aux_transfer() {
    ...
    regmap_write(dp->regmap, DW_DP_AUX_CMD, value);
    status =3D wait_for_completion_timeout(&dp->complete, timeout);
    ...
}

wait_for_completion_timeout() returns 0 without consuming the completion's
internal done count. If the hardware interrupt fires shortly after, the
handler calls complete(&dp->complete), leaving the completion in a signaled
state.

Since dw_dp_aux_transfer() does not call reinit_completion() before starting
a new transfer, will the next transfer immediately fall through
wait_for_completion_timeout(), reading stale hardware status?

> =20
> +	ret =3D devm_mutex_init(dev, &dp->irq_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	res =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(res))
>  		return ERR_CAST(res);

[Severity: High]
This is another pre-existing issue not introduced by this patch, but looking
at the hpd_work handler, is there a TOCTOU race in dw_dp_link_retrain() that
can cause DP link training while the PHY is powered off?

dw_dp_link_retrain() checks the link state before acquiring the mutex:

dw_dp_link_retrain() {
    if (!dw_dp_needs_link_retrain(dp))
        return 0;
    ...
    drm_modeset_acquire_init(&ctx, 0);
    for (;;) {
        ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
        ...
    }
    if (!ret)
        ret =3D dw_dp_link_train(dp);
    ...
}

dw_dp_link_retrain() is called asynchronously from hpd_work. Concurrently,
userspace could issue an atomic commit to disable the display, which acquir=
es
connection_mutex and disables the link (powering off the PHY via
dw_dp_link_disable).=20

When the atomic commit releases the mutex, dw_dp_link_retrain() acquires it
and unconditionally calls dw_dp_link_train(). Could this result in hardware
lockups from attempting to read or write registers of a powered-off PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D5
