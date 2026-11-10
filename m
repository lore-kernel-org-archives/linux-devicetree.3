Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299519;
	b=cdOnJ5K/3B3qoNoRv2xRaDracpg/XZtLvk1MRdaQFUtwVlZymC+6Hj1/aiJLvllaLZJ2
	 H19mZCNzNH57+bCjkC0F5FAzHoIdZgvoObbd1Y2Wg+ol/Weg0YonNX+aWG5l8tRfy4YKI
	 Wv5Gcodc2NNjL4tNTiNDB3pAPGVWPkDtpUeQxL9PyEQnEgnkzJnTjOmu/UHXdeJ04rNZs
	 bZeGZl8vaoHtCeHktYSbQ2nSdhdtaTzLH9XVleNoFlsX1iJR6RI4KE6gLFNrzvSz+d9NP
	 yF6/WQtxtgYXHiH05BIkBwTTNG0W6czA72l4pAAZuWXlCm/2GBAEAeJyFVWB2ZVYwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XvORE3MO+QpGTemEFXAK4gwUdDzsakLGghinRkb/8ug=;
	b=C7YsnIyYvbCf6AYBFldpWkN3Nfq9D5zH8vkquCYzacykaJMYKnu0HVDIFgnIyqwLBmrz
	 pDgzWAAYFiY/u/4VO18zuoPLLGgHrj5A2uiLlzeeX/fLwVgOAkwtQy0CbX2KMAazbFNbl
	 Qf4ofPjLYNjtg4yZx4OPbjMIinbM+Nsde5IuinNohBYZ6O8DOGYf/YmjbzhOP7fvJ6JN4
	 YLuR6ld0rLtJMvM9Uz6U3wXEN36gSEbjNQNOX4VsaS4HLi17YuYKc0/7smFc0zgW3xTtp
	 8X10093AAchhq/tNYgCKDVNoPHHX/E3u0VQCLNdngPhII1zvoWZyhdw+sMViSqyRGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kQ/Hr+R2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9669606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQ/Hr+R2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10621F0089F;
	Tue, 10 Nov 2026 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299518;
	bh=XvORE3MO+QpGTemEFXAK4gwUdDzsakLGghinRkb/8ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kQ/Hr+R2cN7g1jzkNe+Nqe79U6K048oMkC5WBsV3+mUuZDeyt1VyoEiQirVWOkb9U
	 5DJ/SqiOJ5VVwWIqhx3bSO0hYrhha9yk4noizWv8npokMmbIBCIMd0ygtydN8m5PM9
	 /mUX/77S9FDX6FRauI7XQEtSS15jNGEYTHmUwyjsY3I61D/x+SLv8IEmKvolHet6sv
	 W6hNhqIeBy1zAUS4b5Hl8xn9kKXIy6KFY/0rHOtcOtObLYZP7bK57GUTD2JM9GDoMp
	 rKFWWRLNR5aRmcVbBQm7Fa6ZXXaN4OKgq3UcsLXL3Eg4HLgsbqW/2FJcTO9LlLD3xu
	 FHo2wB7+lW2wg==
Message-ID: <sashiko-outbox-206627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: rk356x: Add eDP controller
 and phy nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261110074533.4052196-4-damon.ding@rock-chips.com>
References: <20261110074533.4052196-1-damon.ding@rock-chips.com>
 <20261110074533.4052196-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:31:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: rockchip: rk3568-edp lacks binding/driver match
  and rockchip,grf
- [Low] arm64: dts: rockchip: rk356x: duplicate PCLK_EDPPHY_GRF clock in
  edp_phy_grf
--

commit 39d000ce8ae0719491fd06506c51a275929fc4ce
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

This commit adds the eDP PHY GRF, eDP PHY child node, and eDP controller
nodes to rk356x-base.dtsi for the RK3568/RK3566 SoCs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index 1a4562df20ee5..e3f370cad5d51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -402,6 +402,24 @@ usb2phy1_grf: syscon@fdca8000 {
>  		reg =3D <0x0 0xfdca8000 0x0 0x8000>;
>  	};
> =20
> +	edp_phy_grf: syscon@fdcb0000 {
> +		compatible =3D "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
> +		reg =3D <0x0 0xfdcb0000 0x0 0x8000>;
> +		clocks =3D <&cru PCLK_EDPPHY_GRF>;
> +		ranges =3D <0x0 0x0 0xfdcb0000 0x100>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		edp_phy: phy@0 {
> +			compatible =3D "rockchip,rk3568-edp-phy";
> +			reg =3D <0x0 0x100>;
> +			clocks =3D <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDPPHY_GRF>;
> +			clock-names =3D "ref", "apb";

[Severity: Low]
Should clocks =3D <&cru PCLK_EDPPHY_GRF> be dropped from the parent
edp_phy_grf node (and from rockchip,rk3568-edp-phy-grf.yaml in commit
"dt-bindings: phy: Add rockchip,rk3568-edp-phy") now that the child
edp_phy node claims and enables PCLK_EDPPHY_GRF directly?

> @@ -878,6 +896,33 @@ hdmi_out: port@1 {
>  		};
>  	};
> =20
> +	edp: edp@fe0c0000 {
> +		compatible =3D "rockchip,rk3568-edp";
> +		reg =3D <0x0 0xfe0c0000 0x0 0x10000>;
> +		clocks =3D <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDP_CTRL>, <&cru HC=
LK_VO>;
> +		clock-names =3D "dp", "pclk", "hclk";
> +		interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +		phys =3D <&edp_phy>;
> +		phy-names =3D "dp";
> +		power-domains =3D <&power RK3568_PD_VO>;
> +		resets =3D <&cru SRST_EDP_24M>, <&cru SRST_P_EDP_CTRL>;
> +		reset-names =3D "dp", "apb";
> +		status =3D "disabled";

[Severity: Medium]
Can the edp@fe0c0000 node pass dtbs_check or probe when enabled?

"rockchip,rk3568-edp" is not documented in
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
or matched in rockchip_dp_dt_ids[].  In addition, the binding requires
rockchip,grf and rockchip_dp_of_probe() fails with -ENODEV when that
property is absent:

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_of_probe() {
	...
	dp->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
	if (IS_ERR(dp->grf))
		return dev_err_probe(dev, PTR_ERR(dp->grf),
				     "failed to get rockchip,grf property\n");
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110074533.4052=
196-1-damon.ding@rock-chips.com?part=3D3
