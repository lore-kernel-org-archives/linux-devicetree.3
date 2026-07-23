Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453D4908C5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846061; cv=none; b=iL+ieBVXteIAFwWE1qDxZyW5j+bxJWXjXpwljOm4/t/iCe/HlNvyLwLQTNcjl5p+U1qcu+LvMEimMFmEHVBSPj3011IqxRxx+ePOVSP+O9NOITbWuC5xypIFyYChnJCgIGPzo4M5h3rOQIvh8PGnLSimn4S/fNIvFsvJTeMaAC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846061; c=relaxed/simple;
	bh=aU5RbrqHZf79yDA+vUOEaPoi9VuBFmFMeAKQzggm3+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KiBNSMNZ5ZwnV2UCpruEryLb04pPsNprake8XCMGFrsSPG11BUytVG5n31FfPfsJk3lN6rIEEJTkC1rKwLdetUxKvyZ+kmZRaVmZsfhlKKOdKfehJwjxrrH3GojyhkJ0da9vmR48kx2pfLAxK2zxB+JzzZTOB/NCc0fX4YGWMWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYLpG8Di; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYLpG8Di"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5F21F000E9;
	Thu, 23 Jul 2026 22:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784846059;
	bh=QlbJX5mQ02oqQKJvelC0JLCr/Y5xuwr8U78FZbaMwok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYLpG8DiiSlMkFziacj9DcCmx35TPt+J3+MZtqMUNn1r7+uQx8TEyGq5PGrlbYbMm
	 BOHgFdtxPQc16mORV1s0nf9Yvn0UPVtKhCP0n9N+TRP5WhKcVupom4BPhDG23xp4+j
	 8Uy3lN9JpQXgillrpg3hx7CqTaDlLWlIWRxWZH/JfV1eaw6QUt3E3xcibh7UXGNicJ
	 6RI53aV1kxMdkHnwBanHFxNwYaHPHkV6Uf49JWFqajHPz8KMQhQulqZ0GsXbofMj67
	 oODz6k9Qk8Ns1jRu0tZp99mzD1DPU2Kx4u6ZvoFmXdKit1rsXJVq+BgxgWkEwz6Vt4
	 QOlg0rTbUGIFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/15] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-1-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v5-1-9445c2e87441@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 22:34:19 +0000
Message-Id: <20260723223419.6F5F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancel_work_sync(&dp->hpd_work) in dw_dp_unbind leads to u=
se-after-free
- [High] Missing reinit_completion() in AUX transfer function causes stale =
completion state
--

--- Patch [1]: [PATCH v5 01/15] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit f51b82393e0acdef468182d74c204f63a5e111ae
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callb=
ack

Currently the Synopsys DesignWare DP controller driver's bind function
requests lots of resources using device managed functions. These are
free'd on driver removal instead of at unbind time. Fix this discrepancy
by introducing a new probe helper function and moving over most of the
early resource acquisitions.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 3445c82e6f50e..368e1f85e6253 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> +	dp->aux.transfer =3D dw_dp_aux_transfer;

[Severity: High]
This isn't a bug introduced by this patch, but does the AUX transfer functi=
on
need a call to reinit_completion()?

Looking at dw_dp_aux_transfer() in drivers/gpu/drm/bridge/synopsys/dw-dp.c,
it waits for completion like this:

	regmap_write(dp->regmap, DW_DP_AUX_CMD, value);
	status =3D wait_for_completion_timeout(&dp->complete, timeout);

If a previous transfer times out and the hardware interrupt eventually arri=
ves
late, it can leave dp->complete.done greater than zero. When the next trans=
fer
is initiated, wait_for_completion_timeout() could consume the leftover
completion and return immediately without waiting for the new transfer to
finish, causing it to read garbage DPCD data.

> +	ret =3D drm_dp_aux_register(&dp->aux);

[ ... ]

> +void dw_dp_unbind(struct dw_dp *dp)
> +{
> +	disable_irq(dp->irq);
>  	phy_exit(dp->phy);
> +	drm_dp_aux_unregister(&dp->aux);
> +	drm_bridge_remove(&dp->bridge);
>  }

[Severity: High]
This is a pre-existing issue, but does dw_dp_unbind() in
drivers/gpu/drm/bridge/synopsys/dw-dp.c need to call
cancel_work_sync(&dp->hpd_work) to prevent a use-after-free?

If a hotplug event occurs when the driver is being unbound, the IRQ handler
might schedule dp->hpd_work. The disable_irq() call here waits for the IRQ
handler to finish but does not cancel pending workqueue items. After the
driver unbinds and the devm-managed dp structure is freed, the workqueue
could execute dw_dp_hpd_work() and access the freed dp structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v5-0-9445c2e87441@collabora.com?part=3D1
