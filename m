Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0124202997
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298214; cv=none; b=WQIUdKajoqSdrX/AaRQM4AjfI5f0uNef5S/JVE1KJeftZQXx8GzVse7aflMeQ0p8c+QHTgXf1LnIm7OIQ4MMnQsWHklxeZ8cLzrig1JCJii6j7oH5Rz778MJuH3JUZ9yhVRpWi8KxIF2RbYvMW9Ky+N2GG0HLVuBl1PZe4dSkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298214; c=relaxed/simple;
	bh=dlvBdz4w64Sb3g8WJfrerI4w/z24Ny3wagq5uakhHzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KOIhhkS2ji0aL0GpBwxxR91r6yW7RrkNDdqDp1JdA0iqZWGoN6svYknPCMR6nlQWVoCjhDZbO8E1fN+aGT0ePMKkhm4M4DIV1TcZpoMHwGSSOmaAU+S5wwOo2jIsnpjYDsHfOGmRtwFwt8uWrfAkgOrqX+SX3qHNS/X59XoGb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J46ZWxZx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J46ZWxZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2841F00893;
	Mon,  1 Jun 2026 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780298213;
	bh=nz89qRb4ztxtS2jhUqjORz24ZtCU5cdFttieD5PldDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J46ZWxZxtxwyH4mPJeAK7EOxG88oQ73Ws+KgHe3bvzD3AjZNvu8WYD5HjMBGYTm1S
	 ya6S2A2cuDCrFDT6EjXGKteoWOokVAnDE+iTMZv2E6QiKgSMoZt1JyBVlTt6lqZj/6
	 k45Paxh0s/r/h1YE430jvW74utSKxjkk//lNwMO9Qde/meAHeRANTatcP/v6VqdrcJ
	 jO4oi9hmaGU3gA4JThhugtyucldGxnHzca3Ur1hSHtxpst2Pw0b5/JP/17lkMGloQX
	 7iLL3vS1vs5LMnfs53R8vfaosbz1licF/hGX3739Ue/X8SYDiLNbaLdeWyskOVuzk8
	 nilm5JTHoUD+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/11] drm/rockchip: analogix_dp: Add support for
 RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601065100.1103873-12-damon.ding@rock-chips.com>
References: <20260601065100.1103873-12-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 07:16:52 +0000
Message-Id: <20260601071653.1A2841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Ignoring the return value of `dp->plat_data->power_on()` in `analo=
gix_dp_resume()` leads to a bus hang and kernel panic if power-on fails.
--

commit 16c45b0fec5cc5f41b6c562365dd00c24ea63ad5
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Add support for RK3576

RK3576 integrates Analogix eDP 1.3 TX and Samsung combo PHY
hardware blocks that fully match the proven RK3588 design. Add dedicated
chip data table and device tree matching entry to bring up basic eDP
functionality for the RK3576 platform.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index b1ed25cefe5ed..776954c7d0525 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
[ ... ]
> @@ -543,6 +551,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[=
] =3D {
>  static const struct of_device_id rockchip_dp_dt_ids[] =3D {
>  	{.compatible =3D "rockchip,rk3288-dp", .data =3D &rk3288_dp },
>  	{.compatible =3D "rockchip,rk3399-edp", .data =3D &rk3399_edp },
> +	{.compatible =3D "rockchip,rk3576-edp", .data =3D &rk3576_edp },

[Severity: High]
This is a pre-existing issue, but adding a new platform here raises a
question about how power-on failures are handled.

Does this platform risk a bus hang and kernel panic if power-on fails during
resume?

If rockchip_dp_poweron() fails (e.g., if rockchip_dp_pre_init() fails),
it disables dp->pclk:

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_poweron() {
    ...
	ret =3D rockchip_dp_pre_init(dp);
	if (ret < 0) {
		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
		clk_disable_unprepare(dp->pclk);
		return ret;
	}
    ...
}

However, the core driver ignores the return value of power_on() and continu=
es
to access memory-mapped registers via analogix_dp_init_dp():

drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:analogix_dp_resume() {
    ...
	if (dp->plat_data->power_on)
		dp->plat_data->power_on(dp->plat_data);

	phy_set_mode(dp->phy, PHY_MODE_DP);
	phy_power_on(dp->phy);

	analogix_dp_init_dp(dp);
    ...
}

Since attempting to read or write memory-mapped I/O registers when the APB
bus clock (pclk) is disabled causes a synchronous external abort on ARM
platforms, could this cause a kernel panic if power-on fails?

>  	{.compatible =3D "rockchip,rk3588-edp", .data =3D &rk3588_edp },
>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601065100.1103=
873-1-damon.ding@rock-chips.com?part=3D11
