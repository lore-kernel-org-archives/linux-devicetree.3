Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088A342515
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388461; cv=none; b=F/CsBvk3FvoTyxiX9yPOXbS9HmRClw7sFsEZ8h2teC9o342ZGgR51lLLHngA/WnF+lmK8GpZrYDmX2mDe0V9jZhMpcIlxAF58RgNpB9omoVcVNXMTWxJAiwzNWrN85CwnNaZQ4BnrjAeqLH3MhIF18te6JYrU/LxPSPN3peCAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388461; c=relaxed/simple;
	bh=anVEe3puRlTgTtuVbDbGkmblA4u35nXzxiBHyFKGXHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WHXxqPYd79BXwnYLL/ScWR/TNDufqHEOfJlMLkoxxvksTWcLz4Pp17g+RR/YElpLehuh7JzETi080bCC4C/LjWqTdB8y0OXcZun1uJUWBxg6+nlrzZVS8UXhSAu4/yHsz/b9fBxq0lpj1sHmS/yXfBm9izXDUlbesEWaDjpm69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZxbN/mE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZxbN/mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFDC1F000E9;
	Thu, 30 Jul 2026 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785388460;
	bh=HE+hzAe3KgkNjbBq5qgRR10IXQNHm0cEAOL2LnejTRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XZxbN/mEq/KFdQNSRKf4QYc/S4cUYdloBE74zH6SSrRqNRbpO5RM//0HLEg8LtPAH
	 g7jus5+mZsOb0PY7m6jNALkrlbhVo8+ZJDoSCNWh0ugJGQVmpihY4qLavfc9J1lPDo
	 7hV7WRE9yxPWKkp1eEoqLI+SZhDgIfLp15j2gp5LBL/xgJMECyQsxGEoFYrCuyvE4B
	 om1WYQWT4z/Gz1jAnSi6K9tvFp9FdUOnldOqqHaTu0ROp45TpoH4UCAgcwBkpumF5n
	 8gS+sk+i69moQbxtnSkAnKx0mJf3QeNBxEmwNK0SuXKHP9BStESAiiWvoEuZp2fd9A
	 rI90Re+kHbr4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730045947.388660-3-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
 <20260730045947.388660-3-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 05:14:19 +0000
Message-Id: <20260730051419.ACFDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The SD card interface specifies `max-frequency =3D <150000000>;`=
 without hardware capability to switch to 1.8V.
- [Medium] The `phy-supply` property is incorrectly placed in the MAC node =
instead of the PHY node.
- [Low] Mismatch between v2 changelog claims and implemented fixed regulato=
r naming.
- [Low] Logically contradictory suspend states in PMIC regulators.
- [Low] Invalid `pwm-supply` property used in the PWM regulator `vdd_log`.
--

--- Patch [2]: [PATCH v3 2/2] arm64: dts: rockchip: Add Vicharak Vaaman boa=
rd ---
commit 2ba03c57ee758ea3f8ebf1be9be041bcd351ec42
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: Add Vicharak Vaaman board

Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
single-board computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> new file mode 100644
> index 0000000000000..01b8c1536c4cf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

[ ... ]

> +	vcc5v0_sys: regulator-vcc-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc12v_dcin>;
> +	};

[Severity: Low]
This isn't a bug, but the v2 changelog claims fixed-regulator node names
were updated to use a regulator-[voltage] prefix consistently. Does this
node name intentionally omit the voltage?

[ ... ]

> +	vdd_log: regulator-vdd-log {
> +		compatible =3D "pwm-regulator";
> +		pwms =3D <&pwm2 0 25000 1>;
> +		pwm-supply =3D <&vcc5v0_sys>;

[Severity: Low]
Does the generic PWM regulator binding support pwm-supply? It seems the
proper property for an input supply would be vin-supply or power-supply,
which could cause the regulator core to ignore this supply dependency.

> +		regulator-name =3D "vdd_log";
> +		regulator-always-on;

[ ... ]

> +&gmac {
> +	assigned-clocks =3D <&cru SCLK_RMII_SRC>;
> +	assigned-clock-parents =3D <&clkin_gmac>;
> +	clock_in_out =3D "input";
> +	phy-supply =3D <&vcc3v3_lan>;

[Severity: Medium]
Should this phy-supply property be placed inside the child ethernet-phy
node (rtl8211e) rather than the MAC node? Standard ethernet PHY bindings
typically require the supply in the PHY node, which could prevent the PHY
driver from finding its supply and managing its power state.

> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&rtl8211e>;

[ ... ]

> +			vdd_center: DCDC_REG1 {
> +				regulator-name =3D "vdd_center";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <750000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-ramp-delay =3D <6001>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <900000>;

[Severity: Low]
Is it semantically valid to specify both regulator-off-in-suspend and
a specific regulator-suspend-microvolt? Requesting a voltage during
suspend while turning the regulator off seems contradictory.

> +				};
> +			};

[ ... ]

> +			vcca0v9_hdmi: LDO_REG7 {
> +				regulator-name =3D "vcca0v9_hdmi";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <900000>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <900000>;

[Severity: Low]
Similar to vdd_center, this specifies both regulator-off-in-suspend and
a specific suspend voltage.

> +				};
> +			};

[ ... ]

> +&sdmmc {
> +	bus-width =3D <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	max-frequency =3D <150000000>;

[Severity: Medium]
Will this 150MHz (UHS-I) configuration cause SD card initialization to fail?

The SDIO supply (vcc_sdio) is fixed exactly at 3.0V without a vqmmc-supply
provided, preventing the required switch to 1.8V for speeds above 50MHz:

	vcc_sdio: LDO_REG4 {
		...
		regulator-min-microvolt =3D <3000000>;
		regulator-max-microvolt =3D <3000000>;
		...
	};

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cd &sdmmc_cmd &sdmmc_bus4>;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730045947.3886=
60-1-hrushirajg23@gmail.com?part=3D2
