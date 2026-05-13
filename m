Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177123741
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778632983; cv=none; b=atItDQ5NJVItnSICXvgw/vkY1nWG9XnqMNY7kMLtr15TRG7Mar2R5DJyuC0sqNJ4N0gGPz+Fd+kkUj4SGsqChg8VSTPjLqPzInMNlmXa08MHkVF+D/Ahf04V2HY9SNXmF5QCZwI1MzUIB4KrHXE2Orx4ErQ6QNnIvCYYhc6Y3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778632983; c=relaxed/simple;
	bh=Aq1/kDc8hxCGfp2GZazqOmojbr6hzdKgMPLJN3H6UGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZyceixEoJy9LLLgXDBsgpMY6nXDjjgSBZjH14KohHFaUuEdozTsAn+PYWZEWIi+4zszEUkJYJX/XKzQzISXBvCOej5fqZbTzCYwXrIubXQxYTe2KBnVVpqxn1LOPVAc4h5Vj64Zc2NWmweKO1KEgY3cFjshl3njPSFfLAyH6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+ZYnHzO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+ZYnHzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A74C2BCF5;
	Wed, 13 May 2026 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778632983;
	bh=Aq1/kDc8hxCGfp2GZazqOmojbr6hzdKgMPLJN3H6UGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=s+ZYnHzODonjrtA8/vy/hKYnplXVrQl40HSdND3JwLM0bjwiAtie+ic65aK8Kjm5e
	 ehdoEC+rPHEDvzur5ay1cMVzfL01fWSQfbxnG7ZVr3x34T90Pm0/TZtVEaw8yilM42
	 3J4Ai17whkleeqwWZ2SDh0Mj31riuuhL8bNvCmL+om6nF7DoWSUvHPY2XU6pKtLUba
	 MBsFfUqY629MD3aCPwqeImbQd3NQK2zV4TRn0nctUMK2O8SsO4/1Z1HW+SezOXP/VC
	 fwB42+VbuYKUbHkU0NAg1k38Xi0Mkte4MISMulzYeEUku2TuxiSXPIO+0tP4BNNfHQ
	 KaLdemcDXgP5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/9] arm64: dts: agilex5: add Cadence SD6HC
 controller and SOCDK enablement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511202132.5597-4-tanmay.kathpalia@altera.com>
References: <20260511202132.5597-4-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:43:02 +0000
Message-Id: <20260513004303.51A74C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Board-specific regulators are incorrectly defined in the generic=
 SoC .dtsi file and placed inside a simple-bus.
- [Low] The Cadence SD6HC node includes an undocumented and unsupported `fi=
fo-depth` property.
--

commit cd8114ca6cbb7c0bc2b1d26651ea445b3eef24ec
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

arm64: dts: agilex5: add Cadence SD6HC controller and SOCDK enablement

This commit adds an SD/MMC controller node backed by the Cadence SD6HC
to the Agilex5 SoC device tree. It also enables the controller on the
SOCDK board with high-speed and UHS-I modes.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
[ ... ]
> @@ -300,6 +300,44 @@ portb: gpio-controller@0 {
>  			};
>  		};
> =20
> +		sd_emmc_power: regulator-fixed-3p3v {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "card-power";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		sd_io_1v8_reg: regulator-1p8v {
> +			compatible =3D "regulator-gpio";
> +			regulator-name =3D "sd-bus-io-power";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			states =3D	<1800000 0x1>,
> +					<3300000 0x0>;
> +		};

Should these board-specific regulators be defined in the generic SoC
dtsi file instead of the board dts file?

Placing them here forces these external board-level circuitry
definitions onto all future boards using this SoC.

Additionally, because they are placed inside a simple-bus without a reg
property, it looks like they will trigger simple_bus_reg compiler
warnings. The sd_io_1v8_reg node is also missing the mandatory gpios
property in the dtsi, which might cause dtbs_check schema validation
failures for any board that does not explicitly provide one.

> +
> +		emmc: mmc@10808000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "altr,agilex5-sd6hc", "cdns,sd6hc";
> +			reg =3D <0x10808000 0x1000>;
> +			interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			fifo-depth =3D <0x800>;

Is the fifo-depth property supported by the Cadence SDHC binding?

The Cadence SDHC binding specifies unevaluatedProperties: false and
does not appear to define or support fifo-depth, which seems to be a
leftover from Synopsys DesignWare MMC bindings.

While the driver will ignore it, its presence might cause a dtbs_check
schema validation failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511202132.5597=
-1-tanmay.kathpalia@altera.com?part=3D3
