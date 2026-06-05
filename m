Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C443BFE38
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780627125; cv=none; b=lcOsFDbXqnTl4u/GqNMPJC+qC0M/VT7bGh5/9jaXUyEHk/s4s1sHHoG+IB7i6JdAVvsdIPW3L2WZ/+kVR1giRg57DROcqTnryoE8NNkUndi3goE7swmNdKA/QBymAxNY1HsKYvGxsaC36zAatAsysOqqNkE0/FdOJrLc7Bgfi0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780627125; c=relaxed/simple;
	bh=KJJ91VtR76aev5sg0mmlv0Bg7ug6NZzG/9LXShbFgvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DORn5h70NOJHQdyy2cvpitSSxxQ43Y/SEVbrcNXC0f7xI3mc0r0gw7w8EQ6fKmALgsADUDhVF2/W22Bw7zSG+y7CDDPaBDwC7h/vzh99Ntx7Y4bNLEQw73uWAwoezbge9nHJ9MgdNrG1WA/LbQhPwxlIozmv9WgWOZPELbEM5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JM7Svhiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JM7Svhiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99E51F0089A;
	Fri,  5 Jun 2026 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780627117;
	bh=4GnsV9O6Rdij5b/EPcx79wjcKhjuJQSjqf1MjrueHp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JM7Svhiv4/+N98VzbcHR3uOzfv/eIZRaNghXvyjpgo95J3z1R4ByMsWU/5nftMO7h
	 15tIlLaVOzUqntyds21R+lKOFuqGBG79MZeC9qYDU4nbovnxh+D1/4O1B3OcdU4xb8
	 sF6dkdqIhfDIXniPIZ+sY9LKYb8EuOuHysU+ELIFq0ennYmxaI+DwY3kmIZCkgU2JG
	 wI3iGO9YJuYC5TXF+5YD/xcr5ScEEsS6PKfLPP9UzC0Yjr6xlXZXJ8FiyKZyNHRory
	 DlFPcVwMOr+iau+Serad6V5OnEKlrvZO+o4KkpvLGJ2WLzHfRnX/+gTZzQs7Xhu9ut
	 zzrbd5ottrVtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] arm64: dts: rockchip: Add missing hclk for
 RK3588 eDP0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260605022305.3058853-2-damon.ding@rock-chips.com>
References: <20260605022305.3058853-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:38:36 +0000
Message-Id: <20260605023836.B99E51F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds the `HCLK_VO1` clock to the `edp0` node but incor=
rectly names it `"hclk"` instead of `"grf"`. This violates the `rockchip,an=
alogix-dp.yaml` DT schema, which strictly mandates the third clock to be na=
med `"grf"`. Furthermore, it causes the driver's explicit clock management =
to silently fail: `analogix_dp-rockchip.c` requests the clock using `devm_c=
lk_get_optional(dev, "grf")`. Because the DT name (`"hclk"`) does not match=
, the driver receives `NULL` and its explicit `clk_prepare_enable()` calls =
become no-ops.
--

commit 1f0c2ce9ff98f7230f0fe6e03686f09557a50f13
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: Add missing hclk for RK3588 eDP0

This commit adds the HCLK_VO1 clock to the RK3588 eDP0 node. This is
intended to allow the eDP controller to correctly access the video output
GRF, transitioning from implicit enablement to explicit definition.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 4fb8888c281c8..24a5ccbac08cb 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1712,8 +1712,8 @@ hdmi0_out: port@1 {
>  	edp0: edp@fdec0000 {
>  		compatible =3D "rockchip,rk3588-edp";
>  		reg =3D <0x0 0xfdec0000 0x0 0x1000>;
> -		clocks =3D <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>;
> -		clock-names =3D "dp", "pclk";
> +		clocks =3D <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO1>;
> +		clock-names =3D "dp", "pclk", "hclk";

[Severity: Medium]
Does naming this third clock "hclk" conflict with the driver's expectations
and the device tree schema?

The rockchip,analogix-dp.yaml schema expects the third clock to be named "g=
rf".
Additionally, looking at rockchip_dp_of_probe() in the analogix_dp-rockchip=
.c
driver, it explicitly requests "grf":

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_of_probe() {
    ...
    dp->grfclk =3D devm_clk_get_optional(dev, "grf");
    ...
}

Because the name is specified as "hclk" here instead of "grf", will
devm_clk_get_optional() return a NULL pointer? This would cause the driver's
subsequent explicit clk_prepare_enable() calls for this clock to become
silent no-ops, bypassing the intended explicit clock management.

>  		interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
>  		phys =3D <&hdptxphy0>;
>  		phy-names =3D "dp";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605022305.3058=
853-1-damon.ding@rock-chips.com?part=3D1
