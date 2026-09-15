Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B411347BDB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481019; cv=none; b=tpS1fdsHc986AuDSGp3ZrS4slhaGbeXMpqtf94pXVicA9W8ZVXPbfOepj5kn3mmUjVQNVVx8oKGrfnvfib+hgO+UXIVk4WA1MMIgX89DkofaQ8366KO2tSqEPXEYK633NTaZf/cNB8do5CPM8HB91pXGAN6I7tkIigPiBoN2bU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481019; c=relaxed/simple;
	bh=kgmN7oW35dKdAA6pVd0Q1hlw7V8667fDcpuURzfwi24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TgoaOmdsilIAb4iKw3jVssrnerm2bTMaftpJktafP5WHGp2EXQw55qBBoOSEdCbL5iuBl6TE4m9UV27zewjzYm+nP6sxKJySAFCvNl6+/xFDp5JW/gBO5qFWrV0c0IzRN5pDRzJ/uX5DCYD4wfay0V53kywuNKa7Gf07x27kPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSKMrDpK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSKMrDpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31661F000FF;
	Tue, 15 Sep 2026 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481018;
	bh=WNivz6zoRX7tVHZc8jF5TKz+H/N85t38y1JGRxfFgDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KSKMrDpK7kFHnOElon6p/mKYmWbzd4zizM2T4nD+0HTpOw5g50pLSk4zC5sfSden7
	 VfOYWwS4JO7OChQX4S15xWSBjDU45IxJ6fx64ua3ceT1ujrVy02rBoF+i2wEtYAMjK
	 PlFbczmRdKmCGWnpTAmfnR5XG1OhP+vnvE7Ny4W9r+6/tQwLlGyER6seYUZIzpVjNq
	 la8LS1wWgGsSfWHlLVoSc5Go34nrnqglAELMUvoNfu5csdoB6pYs5lRYtUHePAjkc8
	 SgVmFnfJHbVW8JiRzt7FxsNnClGLpQN2xgUgnbXz5DE2xccAMsU7nAQFsppF/0221j
	 BD+bQT48P+6JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 11/16] phy: rockchip: usbdp: Support single-lane DP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:03:37 +0000
Message-Id: <20260915140337.C31661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: rockchip: usbdp: errant DP lane enable in USB-only mode
--

commit eaea7c0e371c41abc4589c0ac17cb5d7fe7f1179
Author: Zhang Yubing <yubing.zhang@rock-chips.com>

phy: rockchip: usbdp: Support single-lane DP

This commit implements support for using just a single DisplayPort line in
the rockchip usbdp phy driver.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index b72daf80af15f..4fce9cd664735 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1049,18 +1038,17 @@ static int rk_udphy_dp_phy_power_on(struct phy *p=
hy)
>  static int rk_udphy_dp_phy_power_on(struct phy *phy)
>  {
>  	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> -	int ret, dp_lanes;
> +	int ret;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> -	dp_lanes =3D rk_udphy_dplane_get(udphy);
> -	phy_set_bus_width(phy, dp_lanes);
> +	phy_set_bus_width(phy, udphy->dp_lanes);
> =20
>  	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
>  	if (ret)
>  		goto unlock;
> =20
> -	rk_udphy_dplane_enable(udphy, dp_lanes);
> +	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);

[Severity: Medium]
Could this unintentionally enable unclocked DP lane drivers on the physical
pins in USB-only mode?

If the DP controller calls phy_power_on(), rk_udphy_power_on() might detect
that UDPHY_MODE_DP is not supported in udphy->mode. If it does, it prints a
message and returns 0 (success) without powering up the DP PLLs. Execution
then proceeds to this rk_udphy_dplane_enable() call.

Prior to this patch, rk_udphy_dplane_get() returned 0 when DP was disabled,
which safely disabled the lanes and asserted CMN_DP_CMN_RSTN. Now, since
rk_udphy_typec_mux_set() unconditionally sets udphy->dp_lanes to 2 or 4 in
Type-C states (even without DP altmode), a non-zero value is passed here.

Does passing the decoupled udphy->dp_lanes skip asserting the reset and
erroneously enable unclocked DP lane drivers, potentially causing undefined
PHY behavior or electrical contention on shared pins?

[ ... ]

> @@ -1356,6 +1345,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
>  			udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		}
>  		mode =3D UDPHY_MODE_DP_USB;
> +		udphy->dp_lanes =3D 2;
>  		break;
>  	}

[Severity: Medium]
Does this unconditionally set dp_lanes to 2 for USB-only Type-C states with=
out
updating udphy->mode, contributing to the DP lane enable issue mentioned ab=
ove
in rk_udphy_dp_phy_power_on()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-rockchip-u=
sbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com?part=3D11
