Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EC3E3166
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 22:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846933; cv=none; b=GlR9tGp1eN55HKGern5xNTA01c7Dp8wA6fDTPE9m4kvEZxr4f+9CfS5F1H97ku1wrfu7vnbERUSjBcbQSoO4uiN8DV9HQ0f+9tmzftlLopGIta8TBQ3RChvT/ZzpcyTqknUv9ytO/EQc/dgDaFne3sxx5FshRVbT9ysqYxFhDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846933; c=relaxed/simple;
	bh=vAyx0qJPZWft4ME9XzdPTPdu7ShCVL107KwVpv0cesw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NAYS3A4BSkfw3WdZIaPOTZsCWLqRzuXpdjpzxxnTTMgMNb6q439XS9IXM4GLN/m022Xaokxid755AMzCMSCmu08QIWeiLyUQNXwDa3d4XuI5tuUhIJHZEImDp4FsTmRFv+9gBEo8SaT1qUF/VlFlcQfBoaHQV+1aM4qyyVocZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F34tzBaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F34tzBaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582F91F000E9;
	Thu, 23 Jul 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784846923;
	bh=JGlfuPSiUN6m7CugOJ9xk9c+x6EP5mdOXvsftLwgb5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F34tzBaQgweklwaQXFaWvovm57GsmxGvcR1RZaSocL2b3CgjF/JZP7BDhGson4keD
	 BaSIPH7nu8ReIIRcdRxbpGiZgWEWwr0M91IoRwFbzH8o5PlALJgqkzZrg38c6ZHR/p
	 qC32SHNhf2aFfU1GVRl8GHrGqY6mTAqv4/UvIFHn+x31FlEalzkzMPZ0FACq4zyjIO
	 PFMNqyK0Zw83ZLbKyMU7Dv3Gp0lk5VdmfIUgBN++vgzR6DGMJxDO5e2MHJxr2FU7x2
	 oR5mZcjDZmSbtiCe0EJpF0Xv90sTs6MNsViHYYjAOUyxyaUEqm0YdJ3PbKeg3w4I64
	 4QkwFHUW4Mrhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/15] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-3-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v5-3-9445c2e87441@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 22:48:42 +0000
Message-Id: <20260723224843.582F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `reinit_completion` in `dw_dp_aux_transfer` allows stale c=
ompletion signals to falsely succeed future transfers.
- [High] The AUX device is registered and exposed to userspace before the h=
ardware is initialized and the IRQ is enabled.
- [High] Concurrent HPD interrupts can overwrite `dp->hotplug.long_hpd`, ca=
using dropped hotplug events.
--

--- Patch [3]: [PATCH v5 03/15] drm/bridge: synopsys: dw-dp: Add missing mu=
tex cleanups on module removal ---
commit bc7168d1bf0fe1e3fae642d5cb72e8aa27942948
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add missing mutex cleanups on module removal

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 21bd08571dcfe..b28040d69fabf 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2031,10 +2031,13 @@ struct dw_dp *dw_dp_probe(struct platform_device =
*pdev, const struct dw_dp_plat_
>  	dp->pixel_mode =3D plat_data->pixel_mode;
>  	dp->plat_data.max_link_rate =3D plat_data->max_link_rate;
> =20
> -	mutex_init(&dp->irq_lock);
>  	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);

[Severity: High]
This is a pre-existing issue, but could concurrent HPD interrupts overwrite
dp->hotplug.long_hpd, causing dropped hotplug events?

In drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_handle_hpd_event(), the fl=
ag
is updated based on interrupt status:

	if (value & HPD_IRQ) {
		...
		dp->hotplug.long_hpd =3D false;
		...
	}

	if (value & HPD_HOT_PLUG) {
		...
		dp->hotplug.long_hpd =3D true;
		...
	}

Since schedule_work() ensures only a single instance of the work runs,
multiple interrupts firing in rapid succession (e.g., a hot plug followed
immediately by an IRQ/short HPD from the sink requesting link training)
could overwrite the long_hpd flag before the worker can process the first
event.

The worker would only see the final state (e.g., false for short HPD),
permanently dropping the hotplug notification.

>  	init_completion(&dp->complete);

[Severity: High]
This is a pre-existing issue, but is there a missing reinit_completion() in
dw_dp_aux_transfer() that could allow stale completion signals to falsely
succeed future transfers?

In drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_aux_transfer(), the driver
waits for an AUX reply:

	regmap_write(dp->regmap, DW_DP_AUX_CMD, value);

	status =3D wait_for_completion_timeout(&dp->complete, timeout);
	if (!status) {
		dev_err(dp->dev, "timeout waiting for AUX reply\n");
		return -ETIMEDOUT;
	}

If an AUX transfer times out, the completion's internal done counter is not
consumed. If the hardware later fires a delayed AUX_REPLY_EVENT interrupt,
the IRQ handler will call complete(&dp->complete), incrementing the counter.
Subsequent calls to dw_dp_aux_transfer() would then immediately return from
wait_for_completion_timeout() without waiting for the actual hardware reply.

[Severity: High]
This is another pre-existing issue, but is the AUX device registered and
exposed to userspace before the hardware is initialized and the IRQ is
enabled?

In drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bind():

	ret =3D drm_dp_aux_register(&dp->aux);
	if (ret) {
		...
	}
	...
	dw_dp_init_hw(dp);
=09
	ret =3D phy_init(dp->phy);
	...
	enable_irq(dp->irq);

If a userspace process opens the /dev/drm_dp_auxN device and issues a read
during the window after drm_dp_aux_register() but before enable_irq(), the
transfer will time out. This initial timeout would permanently corrupt the
completion state as described above, causing future legitimate EDID reads a=
nd
link training to fail.

> =20
> +	ret =3D devm_mutex_init(dev, &dp->irq_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	res =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(res))
>  		return ERR_CAST(res);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v5-0-9445c2e87441@collabora.com?part=3D3
