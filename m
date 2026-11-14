Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794646521;
	b=Ebl3sB9kohxUo4AetQCzzAItHJPuQBpq0V2vszH8INbuV+yUGCLjSucK53Lgl88NATEM
	 RSc5qDwAmfSiK+m1nV7vFm4M+mJsj4y2UwikGGzA9Oi0ko9SoVU/WbXQSO+LlSlS8mlty
	 ThzGy0nyfSiEOg8eboneS2FfU+oqN9ZdPierYuWK2jhSEKFuMg1kityltkt7Zxp4d3px4
	 xV+xF5aZKCOPaCpaMA8/BVHbd/Ex4D93DmmEGI2x16uH10q7yBKX4zTRw/gDJNt+zW746
	 1uGfASH0EuKRtxCd6gVhO/mOKKMEE4TZRCzBImQYB1TQWFksI8/vY59iZ4qryIhIZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794646521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q1/P+bPtgD2V3RPgoRQp6AqrV4+asKkLVxsg1b8gEOY=;
	b=pnLswRrIOmcvVZJERADVpSJqNimB+QBrwsR+l6A0ZDW19CmSdlsx2xtqne4b+Ee2+Q50
	 tWDzNC9te8q0yjY/l8DWwtGkB7xxftn5tTPROjtm05xPzuOZR/PTveCn4CwS1dHcrrp4E
	 6oxSlyXd/H8RMmTDWhrsHnFz0rc4Oc+LgCL0Vd0QpCe0pTcyDOoAUjbvYivCLvk40EmdR
	 /ArXHwrOSkZxofQRAJR+8XZ2FbDyvLO9y9PTpFADaAEdmtoF5vxPubiqTdkfpZTPQ7C20
	 ULddobdt3rVC/RATPu0Mz4WbnWcxvgQrPaTw55mV3HCnQbu55tplnW9nOrvTBneooKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDtdXLtw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41030606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDtdXLtw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDE41F000C4;
	Sat, 14 Nov 2026 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794646520;
	bh=Q1/P+bPtgD2V3RPgoRQp6AqrV4+asKkLVxsg1b8gEOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UDtdXLtw0N+DDEVEP42NqeVEhmwfxEqfkHhnH8bweNBCQ2wb79zpVl06x4z3xXWYC
	 eS22PMS755e6MHEtm4cgbOuQjZnF9FK3RPCxI6gD0hkrMdIKz/FhhTIGr/023LDqDq
	 /z5Ej9tdSg6TVH1fX0HgvwFPQj65InHIBSLYqMYN6S/ChVoNfeSclCFRAPyHw/GEmz
	 FP4MQuSxMO380MWLP8hBKugDul9ZtjpsLWd+lprKXYBy5SBQvRE7sKjXbuFeOzJ8zR
	 GLmOFG+syX80jHvVzLQDvizdu9L6TzKuLwutPL/LPA2amQkm3XehVgWCWkoqPb8+Z4
	 4d2W022E7kxRA==
Message-ID: <sashiko-outbox-214312@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: rockchip: rk356x: Add eDP controller
 and phy nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114083339.600986-4-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
 <20261114083339.600986-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 08:55:19 +0000
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

commit f7a9ae47dd93488d5a85b663ab5846186e851cbe
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

This commit adds the eDP PHY GRF syscon, child eDP PHY, and eDP
controller device tree nodes to rk356x-base.dtsi for RK3566 and RK3568.

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
Should clocks =3D <&cru PCLK_EDPPHY_GRF> be removed from the parent
edp_phy_grf node (and from rockchip,rk3568-edp-phy-grf.yaml)?

The changelog states that PCLK_EDPPHY_GRF was moved from the parent
syscon node to the child PHY node, and rockchip_edp_phy_probe() maps its
own MMIO window and enables the "apb" clock directly on edp_phy without
using the parent syscon.

[ ... ]

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
Can the edp node pass dtbs_check or probe when enabled on a board?

"rockchip,rk3568-edp" is not documented in
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
or matched by rockchip_dp_dt_ids[] in
drivers/gpu/drm/rockchip/analogix_dp-rockchip.c.  In addition, the node
omits the required rockchip,grf property, which causes
rockchip_dp_of_probe() -> syscon_regmap_lookup_by_phandle(np,
"rockchip,grf") to fail with -ENODEV.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114083339.6009=
86-1-damon.ding@rock-chips.com?part=3D3
