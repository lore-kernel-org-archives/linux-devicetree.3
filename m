Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188077;
	b=IV7Pr5/4ZxyT3BxTUUYbzR2kDVuZwJwG1qhz+NdEDL1VKuKpf95OkUbU+XHXvH1qd6EM
	 EZlVoYzMTN5PjF8bfGV/Yo6YCO4rJPi/Qxg3PqmihtRMWXqmdBqXvzjCfKhQ23t5t6Yn2
	 F7OJty0lkpOMWC6cK6XzK71MzjG21Aijn8FH4pBmOjG8zjf2HXL2/fAWCuPfGoFOSlj1j
	 XpqAH62+2aDdFvqOWsLOdOAc/aMxwnhJkb+rOY5TZzhfSbzatvHrbuF8ZLsJnBnLanihS
	 6b6kIPJVf+xsdptXDMFX18APNj+slPeDav0KXshBygb4Xm9ixtWGgyX6jkSOkxELzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188077;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kYL+jqY6VgqR4oVW1GbkKpD1M8uQxNL9I/zUtkve4IE=;
	b=4TuuiWj22y6IE0m7m2b4GZHH7Xj4veSEP+xw9hlQ/FPGcNLYKugYXMziZgKYS+h6HOUr
	 gzfJ/yim5szZvJUDO2AROzeW9IHNZ5GwN/k7Rg0+svBccSNRhnJywBF8YB4K0Zfp367e5
	 Y37kRJqQcZuudQ0Mm09c5PqeJ5Wg0UcdMGxSKJic1ZIcvTnh9GqHcznmzry8q0KkPtO7J
	 wlqJKuSfC6WC7DPBpZzVg4cpf2G2V134obuh22eSHIHlYypHgJbQ71rtNl9kcm3jnL/Wt
	 xpfLSsx3xyP88aH8RyZh40vb4IJtUSY3YSDwnrUoblFUR+eHZmrRw4kSlGNqNmcp9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ni2ho/4z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82081606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ni2ho/4z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC0F1F000CA;
	Fri, 20 Nov 2026 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188076;
	bh=kYL+jqY6VgqR4oVW1GbkKpD1M8uQxNL9I/zUtkve4IE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ni2ho/4zdq70vFLRoZzi+padiZ4TMvHhP6pL5lN11XRmhIoVJihHyd4w7/hwiyZxR
	 MTRY9aW49AEMhuGZEefoY+YiQ/1f5XFIcEzKMapqtK6kkHUx27zHZSWlzA59j8/8VF
	 UHawGiofEeYXzqdiypfCb5VE9+STDgjtW0QQiIzk/RkMjDbWuko1Kch+Bss3BJB0en
	 RM8M7TT+vKA5XUgko7eEA/W7VB9EgVen52XlLR4ZezlLMXWlhuGnAKnO4NhAL98irJ
	 s5ceJujxnh7FL4z7pO1G6tWIZYlmrx5wL2T3C4DZXPoTOlE6B55Lz7VCBD40dMUNjQ
	 55TdZmMuLow6Q==
Message-ID: <sashiko-outbox-225450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] ARM: dts: rockchip: Add support for RK3506
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152055.556266-3-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
 <20261119152055.556266-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:21:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ARM: dts: rockchip: rk3506 pinctrl syscon properties mismatch
  driver
--

commit 0d85ace454fdd5b29f4d3efc2ed9fcf711e63afd
Author: Jonas Karlman <jonas@kwiboo.se>

ARM: dts: rockchip: Add support for RK3506

This commit adds the initial SoC and pinctrl devicetree files for the
Rockchip RK3506 SoC.

> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/r=
ockchip/rk3506.dtsi
> new file mode 100644
> index 0000000000000..d8e942e6d0b1d
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> @@ -0,0 +1,540 @@
[ ... ]
> +	pinctrl: pinctrl {
> +		compatible =3D "rockchip,rk3506-pinctrl";
> +		rockchip,grf =3D <&gpio234_ioc>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		gpio0: gpio@ff940000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0xff940000 0x200>;
> +			clocks =3D <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			rockchip,grf =3D <&gpio0_ioc>;
> +		};
> +
> +		gpio1: gpio@ff870000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0xff870000 0x200>;
> +			clocks =3D <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			rockchip,grf =3D <&gpio1_ioc>;
> +		};

[Severity: High]
Does omitting rockchip,pmu and rockchip,ioc1 on the parent pinctrl node
leave info->regmap_pmu and info->regmap_ioc1 NULL in the pinctrl driver?

rockchip_pinctrl_probe() populates info->regmap_pmu and info->regmap_ioc1
from rockchip,pmu and rockchip,ioc1 on the parent pinctrl node, while the
per-bank rockchip,grf properties on gpio0 and gpio1 populate
bank->regmap_ioc.  However, the RK3506 callbacks in the driver ignore
bank->regmap_ioc and use info->regmap_pmu and info->regmap_ioc1 directly:

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

rk3506_calc_drv_reg_and_bit(), rk3506_calc_schmitt_reg_and_bit(), and
rockchip_get_mux() do the same.  When a board enables pinconf on bank 0
(such as uart0 with uart0_xfer) or pinmux/pinconf on bank 1, the driver
passes a NULL regmap pointer to regmap_update_bits() or regmap_read(),
causing a NULL pointer dereference during boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152055.5562=
66-1-jonas@kwiboo.se?part=3D2
