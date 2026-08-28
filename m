Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5402F3612F3
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900541; cv=none; b=K+FXB7lM+E1UQ5o5j9+wj7kohV+HCQxnKiJ915QerbGlG1Myp7zGNAVGDkzjttvGR6NkuMyIY20daxsdloSwLTEl/XpHIBU6x921c1YrQLINopb0keum3SFJ/b/s9mne89NIM9oy/zj2XqaXcBwG9gBu6XmFjqGFIMs7Y1VoWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900541; c=relaxed/simple;
	bh=cxaKjK6ZR1g9FgXX77kDQTePw9tLfHVD3PLeo/wGlYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=COsRqCqCWo3SfBdTU9F0UZ1s9NofGnNDlns0BLd5q9yQmVPiwtKey6An3euev6iv53t2TwutePJ4j1FNiil7dRaSiewDO2p8cVIYrArWb8Xa0briexrBwWspwbnFmJxetVEkg3YQYJYgyloKons8bVdtrj+fx1J6BbMO5HQZCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2uqfu55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2uqfu55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB0A1F00A3D;
	Fri, 28 Aug 2026 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900540;
	bh=tx/PN1t3hNq6PABQ1WcZYGwr+G27wjV/zT+1n/o3XeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2uqfu553yBe6hYdIuY9d7iq0ysP6gs+u7SMm18BTs6THc5UbD2BxOinMfDiYvfaJ
	 duf9AxeiFdkIJGRx5VwzWSWXnVa5Lz6uY8VdKX4ozbtDXrDG8uOqDv4bWfZ99jDGkx
	 sa2p/15dv7YT0U+936pmqGVd2OX/m9k3EhDBLLrthDL5tPr0/ksFWjgSoPzMhi1bn0
	 WbJjFmWtod9Z6NZDosh/kGMbpYqgvOSD1RddMwSa0BZauHhddhminwgVIphtaMX1ph
	 xw57rfBBPs4LH0hJs8R1z/4gCPAXEkpe+QSmMJPjlIcYI01x5vgZtkXzzsTfb0KFHs
	 0LKnXh1CR6itQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260828065153.590802-5-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
 <20260828065153.590802-5-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 07:02:19 +0000
Message-Id: <20260828070219.AAB0A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] devm_drm_bridge_add() is used inside a component bind callback, ca=
using devres leakage and double-add on re-bind.
- [High] Missing analogix_dp_unbind() and encoder cleanup in component bind=
 error paths.
--

commit 3586f9db6c3c7447ea980ac18be62fa966e709ae
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add validation for samsung,lane-count property

Add validity check for samsung,lane-count to ensure DT-provided
lane count values are specification-compliant.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 4213cd68d5a0d..ba12fde8accde 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

[ ... ]

This isn't a bug introduced by this patch, but I noticed an issue in the
analogix_dp_bind() component bind flow:

drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:analogix_dp_bind() {
	...
	bridge->type =3D DRM_MODE_CONNECTOR_eDP;
	ret =3D devm_drm_bridge_add(dp->dev, &dp->bridge);
	if (ret)
		goto err_unregister_aux;
	...
}

[Severity: High]
Since devm_drm_bridge_add() is called in a component bind function, does it
tie the bridge registration lifetime to the platform device rather than the
component?=20

If the master DRM device defers, unbinds, and later rebinds,
analogix_dp_bind() executes again. Because the devres actions are not
cleaned up during component unbind, would this trigger duplicate devres
additions, list corruption via double list_add_tail() in drm_bridge_add(),
and double initialization of the bridge's hpd_mutex?

This is also a pre-existing issue, but I noticed the error paths in the
component bind functions seem to be missing cleanup steps:

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_bind() {
	...
	connector =3D drm_bridge_connector_init(dp->drm_dev,
					      dp->plat_data.encoder);
	if (IS_ERR(connector)) {
		ret =3D PTR_ERR(connector);
		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
		goto err_cleanup_encoder;
	}

	return 0;
err_cleanup_encoder:
	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
	return ret;
}

[Severity: High]
If drm_bridge_connector_init() fails, does this error path skip calling
analogix_dp_unbind()?=20

This would leave the DP AUX device registered. If component binding is
retried, would drm_dp_aux_register() be called again on the same device,
causing a sysfs duplicate name error and preventing the display from ever
initializing?

A similar issue appears in exynos_dp.c:

drivers/gpu/drm/exynos/exynos_dp.c:exynos_dp_bind() {
	...
	connector =3D drm_bridge_connector_init(dp->drm_dev,
					      dp->plat_data.encoder);
	if (IS_ERR(connector)) {
		ret =3D PTR_ERR(connector);
		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
		return ret;
	}

	return 0;
}

[Severity: High]
If drm_bridge_connector_init() fails here, does the error path miss cleaning
up the resources by skipping both analogix_dp_unbind() and the encoder
destruction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828065153.5908=
02-1-damon.ding@rock-chips.com?part=3D4
