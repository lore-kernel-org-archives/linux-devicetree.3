Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C51A9FB7
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716350; cv=none; b=uJUrUDQCWPCoQPvFHP1mILajyGrtRbTQNTKK24y29S/5BKLsxXl+f/gAzEx9iGacVoaWo0EN3d938vjYqtmExDJBN80XJgD4Vatfv/JicZYDmAexgiPaTbL6JmJx06xEWoTrWuxWXGcAQC8oOXt8kOT+PJXAa+TK8iyliZbUb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716350; c=relaxed/simple;
	bh=DuPgZDJDbXo3l5cJCTHCT2790gHROZQKequtKd9cHcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jFhBKIS2OrE2z2ODeDls38nVXAiJT/Ae89ms9Q5fwm6nuHbcJ1UTWfz7ojFS4/DQegWvQxZTWxoH+PTGblWadcN2hLNb++82TZ9V5hYniyut16aAjWAoA/WhU9qtbi37uZ6Q5WGf5cOpgAmSA3xdciwrDAWhS6hq0DYrkUVQo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwyFVHRW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwyFVHRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021461F000E9;
	Mon, 25 May 2026 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716349;
	bh=xzhEhR36oPeX2DU0pD+KVPm4upihkZozqGy4NjEsh5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RwyFVHRWfEDuuiXsKMy8QABXA9/qE6JaoAyk2yB+EwvehKN8Tx1bGDRV+CvvNSqIt
	 wv806PI/K0dkhANLSLkJTvVubEdkhQrOvS+XEz0Te8wJKeYkQLVJU3q8S++iAFGwfv
	 3F08j2KTG+5zzoQFItUQglXwhqrBu+yScS266T6X3vuBMt2698y/+0wtP0j19nCn/Q
	 oVv6PevqzFi5dScKz77yuN4C3HNg8vITev2g4y/1MdKimKsVDhp1WoZVwAkRuDtLBC
	 iHcUBtfI2rWCEOCJsEdfAov//48rNHCCqjtTMPDyEA0S4L1QlXEx09Xq5FYs8u8lKj
	 rLhKpj0C8wkSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/10] arm64: dts: rockchip: Add missing hclk for
 RK3588 eDP0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525125331.140059-4-damon.ding@rock-chips.com>
References: <20260525125331.140059-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:39:08 +0000
Message-Id: <20260525133909.021461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] System Crash / Unhandled Clock State during GRF Access
--

commit 4e13c2219274a6bd1764125601fd9e53185296bf
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: Add missing hclk for RK3588 eDP0

This commit adds the HCLK_VO1 bus clock to the RK3588 eDP0 node and
updates the clock-names property to include "hclk". This is intended to
allow the eDP controller to access the video output GRF properly.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 546e19487219e..a8e8e844bb930 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1775,8 +1775,8 @@ hdmi0_out: port@1 {
>  	edp0: edp@fdec0000 {
>  		compatible =3D "rockchip,rk3588-edp";
>  		reg =3D <0x0 0xfdec0000 0x0 0x1000>;
> -		clocks =3D <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>;
> -		clock-names =3D "dp", "pclk";
> +		clocks =3D <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO1>;
> +		clock-names =3D "dp", "pclk", "hclk";

[Severity: High]
Does adding this clock here before the driver is updated break git bisect?

Adding HCLK_VO1 to the clocks property causes it to be managed by the
generic PM domain via pm_clk. The pm_clk framework automatically disables
all clocks in the clocks property when the device is runtime-suspended.

During a modeset, drm_atomic_helper_commit_modeset_enables() executes the
encoder's atomic_enable hook before the bridge's atomic_enable hook. Since
the analogix_dp driver relies on the bridge's atomic_enable hook to call
pm_runtime_get_sync(), the device is still runtime-suspended when the
encoder's atomic_enable executes.

Consequently, HCLK_VO1 is disabled when the driver attempts to write to
the vo1_grf registers. Can accessing the GRF without its bus clock enabled
cause an asynchronous external abort and hang the system?

While this is fixed later in the series by commit 8a60fbccaa8c7
("drm/rockchip: analogix_dp: Enable hclk for RK3588"), adding the clock
to the device tree before the driver is prepared to handle its PM lifecycle
appears to break git bisect by introducing a crash on modeset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525125331.1400=
59-1-damon.ding@rock-chips.com?part=3D3
