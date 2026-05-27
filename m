Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90026B08F
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779853037; cv=none; b=HGPPkzD/u5POuaKE3l/soaHpiiwmMebAOL3BQS9O/BRb56vQHuneos10Ih7KmSYDzAFoXjweSuQCWE6HCQZ4nSddZaVv0HHfyzp/C6hy3bEpOSOM/9AEvXywqMP+O/nq53Vq7YGW7o089BbKtBsWIqU1EwhZK5oKeyzB9ToLQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779853037; c=relaxed/simple;
	bh=mXtz+pBLtDz/9LacSh8wdtt0OU+Gy1t9jH5gFboVUXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ap3x3aBV93N8XZZMa4AeMhD6HmmK6YC5JDaGHwxbe9xaadyUuNaPike6TsIHb6Dj1jFSbZXOutbbhvwxJRJwLe6nAS0EoHr+UXGW5mdYOo+o8H73ExQ7mkpRa9FCeB4GrdfzQYO/HF6WDzmOj+ty8nI3jcLDZLAITw5lBWD30TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRMw+na/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRMw+na/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549091F000E9;
	Wed, 27 May 2026 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779853036;
	bh=gFQzta5gBtK2IvR5JRxTjbYdFIJ4YkZyDLWzx0n4GUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jRMw+na/Rbu0jHB3oARVH5KI25ia+CqYCXvfMd1usNID3yRqYsN6KMnLPgmF3AXqd
	 a0yN02OfG6hZy6XNJrTJu5pov5V3kN2L5MG6SlSRfZ/IuSnK5XvKuu1Mv/4NPbHXpy
	 kvjr8j2wGGILKVKYFj1U53JsHtlNaTyyraokznlDRKWLn52O3+LvmtkK6Zmem++oua
	 F7VNPGQs7qPlEV1QWExOTK6Oi64E4BKcjYYTi8XHqAU/JTa/5OvHm30FeGlnGTA8Yj
	 tz5WRvD19MdTLMt01R1Z6oZk+5ukADzqZKTJissAGmL1VT8ivwrKblVUMP4KtOYz/k
	 hizKaYR3rMHVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/10] drm/rockchip: analogix_dp: Add support for
 RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527024336.191433-11-damon.ding@rock-chips.com>
References: <20260527024336.191433-11-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 03:37:15 +0000
Message-Id: <20260527033716.549091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete hardware configuration or mandatory syscon lookup failu=
re for RK3576 eDP.
--

commit dba937ab560aacd4dd5f156770d047256a5462b7
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Add support for RK3576

This commit adds Analogix eDP support for the RK3576 platform.
It introduces a new chip data table and device tree matching entry
for basic eDP functionality.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d2af5eb29dbb5..d4c5dd61e95bb 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
[ ... ]
> @@ -522,6 +522,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[=
] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static const struct rockchip_dp_chip_data rk3576_edp[] =3D {
> +	{
> +		.chip_type =3D RK3576_EDP,
> +		.reg =3D 0x27dc0000,

[Severity: High]
The commit message states RK3576 fully matches the RK3588 design. RK3588 us=
es
the .edp_mode GRF field to switch the combo PHY into eDP mode during
rockchip_dp_poweron(). Is the .edp_mode field intentionally omitted here? If
RK3576 requires this bit like RK3588, will the hardware fail to power on
correctly without it?

Additionally, if RK3576 genuinely does not use the GRF for this and it is
intentionally omitted, does rockchip_dp_of_probe() still unconditionally ca=
ll
syscon_regmap_lookup_by_phandle(np, "rockchip,grf")? If so, will omitting t=
he
property from the device tree cause an immediate probe failure?

> +	},
> +	{ /* sentinel */ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527024336.1914=
33-1-damon.ding@rock-chips.com?part=3D10
