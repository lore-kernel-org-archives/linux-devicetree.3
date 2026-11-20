Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188078;
	b=yLKDI4vv3MZSlj2eNkLKhRmEPrAHEMHL7bPn2Dfs+KG7bLz6i1kqH0QJM0X7qT3AKh6n
	 nratrU/Q1Hdjo+SJt2NhITDGYmMgZFs+rzVTkUx6MnrpIxrYCkvMIS9zaOq6gfXDTQdqz
	 waNVdvs9OtHxTYj3BddzB8KFCwOJ6iwUXXfdBXZAnkOdnispjWMCJqy6gU+Q2Tp/U/Lz4
	 2Qt4JdD0AawsDePdTgQ7OueHlGhSHy6u6WYNHa7H2+GJfgqcdKdV4pW/sQtfPcqgJBOQE
	 m8ECirKweCjyK1VUKLujigCm2IkOaJb0icI2ceWpDSg08SMwu2vIm7YE5wZj+nIAwXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Wv9TDIMq5PIGRvCOwikSsZTS+PIHBKiUu+4pIUxBoCE=;
	b=HFGbnqcGep01R0MHVop3XG2cyvx6Ao1RxsfsEcIfFcySYiWI4Q0lO8V7naqufAGFgIBO
	 zQqNV3PeK1x3LzthPbI+AqAQJuwi6lSE+qAD4Q8Rv0h2NFED4mFtVET0UWusyPcKrm1Ci
	 Aott44CvrcxlC6Gony+67J47qLYZSzuVyabVwMQ8KAlg/B++Poeg/DdhfVL1Jp9cscm0N
	 175cj4EKUlreeDjM1e5l0sK4LI/xc7hY0cT9OKdGO7mZvU98BJuxCyhpP4/aWG9sQSgFl
	 HPtgPFPj9xkgNH8Ul4XMkPDMwn1JrdMe2Oy7w0g5AdL/Xe92EgwySw0E6CkeoQR980A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nCgyD0/d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C496606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCgyD0/d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890C11F000D1;
	Fri, 20 Nov 2026 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188077;
	bh=Wv9TDIMq5PIGRvCOwikSsZTS+PIHBKiUu+4pIUxBoCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCgyD0/dcFtUGgd+vYm6b1hzhTK1dWtmnFrBrewyIrNIbNDlnB5PtL3BcGd7dSFM7
	 b3L7GeAebvKa2ZihumsWi7MujBeW2H1sSHGA9XnBcpaA+LRNNcciKe8HfQMczZFYH7
	 M3klp2wNxLqRn5gmNCGqZYb1JQiOJ+HQ+9MUFfWyHGYSGMGPWNogP+S+GU0g+qvPIh
	 kcL+lRdlj3hAX66IehEuiyomx+yn32GRzxUb4qCS8CQeJLxbgfCdf9z4E7MxYlyM9D
	 RNBBLowYvqaunc3T9W92UbcLAbF1/DpDu7+EZiEDKUaxWY58ufzu9zl7MdXdVlhflj
	 gf3vaJ+yicUHg==
Message-ID: <sashiko-outbox-225452@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152055.556266-5-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
 <20261119152055.556266-5-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:21:17 +0000
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
- [High] ARM: dts: rockchip: NULL regmap dereference in pinctrl on
  RK3506 banks 0 and 1
- [Medium] ARM: dts: rockchip: missing pinctrl configuration on enabled
  fspi node
--

commit 4fbf9c971fb720e3dc9fb2b66cb41a8a5d9471ec
Author: Jonas Karlman <jonas@kwiboo.se>

ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards

This commit adds device trees for the Rockchip RK3506G2-based Luckfox
Lyra and Luckfox Lyra Plus boards.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra
Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Plus

> diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi b/arch/a=
rm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
> new file mode 100644
> index 0000000000000..d02d3a18b052f
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
> @@ -0,0 +1,124 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			color =3D <LED_COLOR_ID_RED>;
> +			default-state =3D "on";
> +			function =3D LED_FUNCTION_HEARTBEAT;
> +			gpios =3D <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&led1>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};

[Severity: High]
Does probing led-0 (on bank 1) and uart0 (on bank 0) cause a NULL
pointer dereference in the pinctrl driver during boot?

In rk3506.dtsi, gpio0 and gpio1 specify per-bank rockchip,grf phandles
(populating bank->regmap_ioc), while the parent pinctrl node omits
rockchip,pmu and rockchip,ioc1 (leaving info->regmap_pmu and
info->regmap_ioc1 NULL).  However, on RK3506 the pinctrl driver ignores
bank->regmap_ioc for banks 0 and 1 and uses info->regmap_pmu and
info->regmap_ioc1 instead:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_set_mux() {
    ...
	if (bank->regmap_ioc)
		regmap =3D bank->regmap_ioc;
    ...
	if (ctrl->type =3D=3D RK3506) {
		if (bank->bank_num =3D=3D 1)
			regmap =3D info->regmap_ioc1;
		else if (bank->bank_num =3D=3D 4)
			return 0;
	}
    ...
}

drivers/pinctrl/pinctrl-rockchip.c:rk3506_calc_pull_reg_and_bit() {
    ...
	switch (bank->bank_num) {
	case 0:
		*regmap =3D info->regmap_pmu;
    ...
	case 1:
		*regmap =3D info->regmap_ioc1;
    ...
}

When led-0 applies &led1 on bank 1 or uart0 applies &uart0_xfer on
bank 0, rockchip_set_mux() and rockchip_set_pull() pass a NULL regmap
to regmap_update_bits().

[ ... ]

> +&fspi {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "spi-nand";
> +		reg =3D <0>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +		spi-max-frequency =3D <80000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <1>;
> +	};
> +};

[Severity: Medium]
Should &fspi configure pinctrl-names and pinctrl-0 here?

Unlike other peripheral nodes in rk3506.dtsi, the base fspi node defines
no default pinctrl properties, and fspi_bus4, fspi_clk, and fspi_csn in
rk3506-pinctrl.dtsi are marked /omit-if-no-ref/.  Without referencing
them on &fspi, dtc strips those pinmux nodes from the DTB and the
controller probes without muxing GPIO2_A0..GPIO2_A5 for 4-bit FSPI,
breaking SPI-NAND access whenever prior firmware has not already
configured the pins in 4-bit mode (such as when booting from SDMMC).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152055.5562=
66-1-jonas@kwiboo.se?part=3D4
