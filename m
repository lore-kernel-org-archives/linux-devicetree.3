Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967A4A0147
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791307252; cv=none; b=X90e6ojjxyraopTrFUH/qomAL+fSFfX+8/5f3Kj57MpVnxn4rvsl/B9Xg7VN/0rfwLIVKkauovPkZ+MHLBa1ZyVwXi8PT3hJ3X3W1XPFPw6LSHHAKS9Z5z0xf3Br6aPlQr5zTz2oRy/3aae6XJwot/H0w/zPBBFo9po8M7HTKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791307252; c=relaxed/simple;
	bh=RC810j3E+YCCtmcFbhRGhu+gTofUzr24EXEZJaqrf5g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LQupdoBwnmhghrg3+LJCV3zAo17XuemEoYnQEYi5SHA6IPL68m9XNwyGzKgc2AQCh0gSoBSVtg18y2B4Ftm+FG2myVHqXIxNrrp4OkmcMEXcaNFVh5wIj8WgiR1NtkunbG1bLhBGimVT26bcMbA/S1/fl/wP3PFEXUwgc9FA7sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXkewPXh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXkewPXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467721F0089B;
	Tue,  6 Oct 2026 17:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791307248;
	bh=LSOs3zVHzq5LUJvNes94dLczj6Rt4dKClh/3Q9n7mfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SXkewPXh5kDzTG5mujLO01HdpUS/kgu3z8v06yBNcD+fCAbT8G2qdEu7P/CFl7L5P
	 XEXiDV+xX0Vw6ZCD8oLVAImQSkthr249qhJuOlEkPl9pzIuoX0X0rctLABqDsTz61W
	 mLfrix1OmWBzPD+VRFAbEuNCZQoQNx3smOSJXkk3V/OBrQm+WuMdZeI95F4xVgJrp9
	 wfH6gxA5xL3M0l5wV6XudRo0pFhOSL+dlGAcO9KsCCbukwKzsuAUfh5JKahttiupnE
	 Qsr3Let8wBrfzGnq5wLf78q1oi0RDUjvo/PchIIaGPgQntxHznOW6C7E2Uzv6LcuHk
	 TJrKtUJrT7/fg==
Message-ID: <sashiko-outbox-162297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007-quarkpi-ca2-v7-v7-2-a84c6d5d6ef6@163.com>
References: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
 <20261007-quarkpi-ca2-v7-v7-2-a84c6d5d6ef6@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 17:20:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing enable-active-high in vcc_3v3_sd_s0 inverts SD card p=
ower
--

commit 4624c6a23d34c30caad9b329d1a8fc7579634e41
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer. The board supports variants with different amounts
of LPDDR4X and eMMC. Various peripherals are configured including SDRAM,
eMMC, PMIC, Ethernet, HDMI, USB, and audio components.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..d81b96d8daec0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
[ ... ]
> +	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
> +		compatible =3D "regulator-fixed";
> +		gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sd_s0_pwr>;
> +		regulator-name =3D "vcc_3v3_sd_s0";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc_3v3_s3>;
> +	};

[Severity: High]
Does this configuration invert the SD card power polarity?

The vcc_3v3_sd_s0 fixed regulator specifies gpios =3D <&gpio0 RK_PA0
GPIO_ACTIVE_HIGH> but omits the enable-active-high property. In
drivers/gpio/gpiolib-of.c, of_gpio_set_polarity_by_property() checks for
the presence of enable-active-high on regulator-fixed compatible nodes.

Because it is missing, of_gpio_quirk_polarity() evaluates active_high as
false and forcibly adds the OF_GPIO_ACTIVE_LOW flag to the internal GPIO
descriptor. This actively overrides the GPIO_ACTIVE_HIGH phandle flag
and emits an 'enforce active low on GPIO handle' message.

When the SDMMC driver subsequently calls regulator_enable(), the fixed
regulator driver sets a logical '1', which gpiolib translates to a physical
LOW signal due to the inverted polarity. Will this physically cut power to
the SD card when the driver attempts to enable it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-quarkpi-ca=
2-v7-v7-0-a84c6d5d6ef6@163.com?part=3D2
