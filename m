Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF83E2ABE
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698084; cv=none; b=KrDqHacDTRiWmGJcL+RnwHCbbMtkZsn/9S1b6KWWpYq+vXDC1J4rFghpp6gRKbhktJSAvE8fuE3tp1vcr2U46HZWd0B//1Z/IKDa+3FnKkkbcz3M+5m5UoEHfof1o3h2fAycvzzlcHZIt6zv6mxhRGsptTeEYbP217A7RnTThgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698084; c=relaxed/simple;
	bh=MVBBHE8SWv91mQiaPGPsaKwZoGbikp5M5b0Fg3fB22E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jRQIppBcUy428eyRftP1WWRRM8rkThdk4q61fTaQE8J4Ns7iNm5WjYrqDjKokfCloKznFb/AJRZLvP14xuX0BBTiYet5n67COSxL+JjaYmRsTqFrURg+EEKAZSUztwalNygIWgz8HZVzezcFz7vzsUwDCvf5O9LhjL9kU3NoC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL1Cyur0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL1Cyur0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CE41F000E9;
	Mon, 25 May 2026 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698082;
	bh=9kakHKwxuA/qioHkLSZ7sGtjQFBNbcwLo9T+lTz4Ht8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jL1Cyur0+exKFBfzHqk6oO8M/1CA0dkKVPixsCuPm7m0+BWEXB1IWBGnOPmBgXDn4
	 TWt1tvMof15QCWZ3UJsWE5Zp/bSYRxBqGqpk0Q8kdJhXMRJTLMWiSuzR3pAtp0SFZk
	 //NG9repbwbPFGUF8TSfLyD8twdag5s5y1K3gkdw8rIRKsbQZL4i2UCwOA7uy4C9BJ
	 1rVth+jwkmHbqGArkTRvzGjkSTDJ1siBHMWKDuf/AYsjuDZFE/HZubDLMgRwrIi3Fi
	 Y2P6IoQ8u1uy7CocvnR/iWKDWTTJcbh9GRUPWmNSE3WEbdUPGdFYsu5daZ3XzdE+lY
	 /Rapf7s4hwb+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/10] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525082033.117569-9-damon.ding@rock-chips.com>
References: <20260525082033.117569-9-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:34:42 +0000
Message-Id: <20260525083442.74CE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The atomic_check callback mutates the global connector->display_in=
fo structure instead of the proposed atomic state.
--

commit 5fc8c5d4b78e6b76c23cdd9ac4c790dbc7cd793d
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Rename and simplify is_rockchip()

This commit renames the helper is_rockchip() to analogix_dp_is_rockchip() to
align with the driver's namespace convention. It also refactors the internal
comparisons into a switch-case statement to improve readability and make fu=
ture
additions easier.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac0..116de3bd83a30 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -870,7 +870,7 @@ static int analogix_dp_bridge_atomic_check(struct drm=
_bridge *bridge,
>  	struct drm_display_info *di =3D &conn_state->connector->display_info;
>  	u32 mask =3D BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COL=
OR_FORMAT_YCBCR422);
> =20
> -	if (is_rockchip(dp->plat_data->dev_type)) {
> +	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
>  		if ((di->color_formats & mask)) {
>  			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>  			di->color_formats &=3D ~mask;
>  			di->color_formats |=3D BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  			di->bpc =3D 8;

[Severity: High]
This is a pre-existing issue, but does mutating the global
connector->display_info structure inside an atomic_check callback violate t=
he
atomic API contracts?

Since atomic_check is designed as a dry-run validation without side effects,
particularly for TEST_ONLY commits, modifying di->color_formats and di->bpc
permanently alters the connector's recorded physical capabilities. This str=
ips
YUV support from the connector entirely upon the first atomic check, which
seems like it would lead to incorrect behavior for all subsequent commits.

Could format selection and fallbacks be tracked within the connector_state =
or
bridge_state instead of overwriting the global display_info?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525082033.1175=
69-1-damon.ding@rock-chips.com?part=3D8
