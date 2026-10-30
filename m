Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343873;
	b=3tksKboeP4kM0CsL+/5uqyZi2ST+9c+s3b78UMSiz0eLQpg7VPjd2/I7SGpLPDPH4ulL
	 psscR32iY6rpcwh4xRqxiE1WVqLFsPcteg8Pag3yyhtggcLsnzKYte5wyZxoftyf13VEv
	 EeSSH/6u6w/I/nb3chBIqcm7NUUiqvE5kPbVWYSWs0A+cfxKey5E3qA8ErOfiN5v4u5vV
	 g0yhy84llNX8JthWlK8Zzmn0Pexbr5iwxGqQRyyuTLsLfIj9/Z3lDF/4f3UElLU90NVG6
	 NCwW3/FCoBbJF4nZMkzntn7wGLUei9NJg8/28TdnZCWYcTIFW4u4oye/Wge97SvLN5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343873;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AQViuW8zNNdDAkH107WPOx22iLQNlN+ChjPHckc5kic=;
	b=qCyuVfRxR46apuaWova+wlwVF3+Ssmfq3EjI51FT7e55IyLtFFlO5VV+uoRXIaZZ+z2m
	 uzHuIr//OaExxCurwgq2IT3eDBH42VZY0SfjKAVniXP195t8RDHa5sN5QjcCEcGDSY3FT
	 ceX+6LnzlaeBO6x+84b05zcLQhpBlYJ61e4qGqDkpzWhbPchBAXjG90FS5xTe+aAxOvWV
	 XMoH9kH28lAWQieqgYAFhXYbGGrk4++c1PgrFU14RAj+NwlAPckCgceYzBrAIX7COR0/C
	 kse0XSLrRmGcgMxm85g/eeGpVotIUhYpFp9iinmEtftCZl2RGdjyOqcZfyAfhVRqEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSoY2mcq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22582606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSoY2mcq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A94C1F000C1;
	Fri, 30 Oct 2026 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793343872;
	bh=AQViuW8zNNdDAkH107WPOx22iLQNlN+ChjPHckc5kic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dSoY2mcqvqDL58RwSOhHCB5YpG++Rnuw+wuGxJW6GLLCmp+zxBEIkUeSBCfXXFTwF
	 i9yXIVDIipmzmiA2xPVuXOu0BBY4CBlA2jJ147qUO33Yr//TeyteBZ9jyZGQGFWV9Y
	 LoyH8uKCmLE7fKfC6z5d2sw9lmh+Pl7/r9hvspPWUA1pz/ELJ5OX0KrudtgH7lkUkP
	 F6xYUH0o0G0oXyGe+cFf56/Jfq1i3XjfL1bKtIrUNfbNkaO5XsgxgNtfwxV/woZUkk
	 TjJdk3Hc0zIF2ktnzbb8DGdi6IBxITdyLdiSSKbj08c6iW6O47y8cksTbLM8LkXTH4
	 6NVDprYg2LTRg==
Message-ID: <sashiko-outbox-190625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: rk356x: Add eDP controller
 and phy nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261030064905.2248999-7-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-7-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:04:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: rk356x: PCLK_EDPPHY_GRF never enabled for ed=
p_phy
--

commit 4fc93be7caab95400abe782b268ff22b9c12b905
Author: Damon Ding <damon.ding@rock-chips.com>

arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

This commit adds the eDP PHY GRF syscon node, its child eDP PHY node, and
the eDP controller node to the RK3566/RK3568 base device tree.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd392..7a5168548e55a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -403,6 +403,24 @@ usb2phy1_grf: syscon@fdca8000 {
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
> +			clocks =3D <&pmucru XIN_OSC0_EDPPHY_G>;
> +			clock-names =3D "refclk";
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +	};

[Severity: High]
With PCLK_EDPPHY_GRF placed on the parent edp_phy_grf node while edp_phy ma=
ps
its register window directly, will PCLK_EDPPHY_GRF ever get enabled before
the PHY driver accesses the registers at 0xfdcb0000?

In drivers/phy/rockchip/phy-rockchip-naneng-edp.c, rockchip_edp_phy_probe()
maps the child reg window directly and creates its own MMIO regmap rather
than looking up the parent syscon regmap, and only gets refclk:

drivers/phy/rockchip/phy-rockchip-naneng-edp.c:rockchip_edp_phy_probe() {
	...
	regs =3D devm_platform_ioremap_resource(pdev, 0);
	if (IS_ERR(regs))
		return PTR_ERR(regs);

	edpphy->regmap =3D devm_regmap_init_mmio(dev, regs, &rockchip_edp_phy_regm=
ap_config);
	if (IS_ERR(edpphy->regmap))
		return dev_err_probe(dev, PTR_ERR(edpphy->regmap),
				     "Failed to init regmap\n");

	edpphy->refclk =3D devm_clk_get(dev, "refclk");
	...
}

Because no consumer calls syscon_node_to_regmap() on edp_phy_grf (and even =
if
one did, syscon only attaches the clock to its own regmap), and simple-pm-b=
us
treats simple-mfd as ONLY_BUS without managing its clocks, nothing claims or
enables PCLK_EDPPHY_GRF.

In drivers/clk/rockchip/clk-rk3568.c, PCLK_EDPPHY_GRF is a gated clock that
is not marked critical:

	GATE(PCLK_EDPPHY_GRF, "pclk_edpphy_grf", "pclk_top", 0,
			RK3568_CLKGATE_CON(34), 14, GFLAGS),

Wouldn't clk_disable_unused() gate PCLK_EDPPHY_GRF off, causing unclocked
MMIO accesses in rockchip_edp_phy_configure() and rockchip_edp_phy_power_on=
()
when an RK3566/RK3568 board enables edp and edp_phy?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030064905.2248=
999-1-damon.ding@rock-chips.com?part=3D6
