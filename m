Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84342BC29
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061740; cv=none; b=byASdEOGiGjJ5Wm74FlNoZJNGnCCetHmMSgF0VKPtOgpfzBuoaZxmlqhN2Umpy6naiQq96lYTOgkIDXLSa0ByRi87hmzp6On0WDtvlgewF8jHtgQBXEtcDE8yEiVbl/HPvBSAcq/kJ7ii65EOVh03co/vcgYJojAT0vAIeansRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061740; c=relaxed/simple;
	bh=fRzfpnejs3Cg40wARhIZvGtfkbSMGM8ZlUKl+RdTvfo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6uVhews+Z2bWFieujHD5K9k6E44cBHxAKC2EmJW6GjYXuYOMWEPwTXEyFwoZTuiCi8/uAynOFCFNtVUkknQaZ5sD0tOpFlDDrWqK+q01Pf0iVquzIkwY/noz+uQkQl0y7mpB7vmOoVgb0Of3n7KrGphLqRQfLRFnlnKiJMCOyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsNQIeW9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsNQIeW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717BA1F000E9;
	Tue, 14 Jul 2026 20:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784061738;
	bh=pCXb3BFN2d8LrQ9qH6L7KpuL+SH3Am5BaEWEloNWpG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VsNQIeW9naVbPPFCGg0hilecuFcWGc+g4QvfYzsVs1MNsWkGj3OJe/YhSER9HL5fO
	 8oHylymbtoH1MbdThQ7Ozlmmr0sUTGnhC9JACjd5oeaqYRNYikaUp9XW9zsgYSzrHR
	 H+ilWj1KWX7mn0hmccYJ7nYjeau/aGIE3zhLzc6P9LpDYTpCgaSw8sjD5eREESOrOZ
	 XCwHb0CPGTpSBM/tBoZW6RP6Q7NUpJl32DTFrBAJ9P38WTatxJ9DOvXScVsqS0zoFc
	 RyWUM4XGOnmcd1JPBv8mqsIlreAUD7V+9hOt0teB/2/yoDmmEJc90khXu9ykO11CTg
	 d5RiicDU3bo8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] ARM: dts: rockchip: Add support for RV1106 and
 RV1103
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714193656.2196447-5-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-5-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:42:17 +0000
Message-Id: <20260714204218.717BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The DT defines distributed IOC blocks for each GPIO bank via `rock=
chip,grf` properties, which violates the upstream dt-binding schema and cau=
ses register corruption due to driver mismatch.
- [Medium] The device tree relies on the 'rockchip,rv1106-pinctrl' compatib=
le string, which is entirely unsupported by the upstream pinctrl-rockchip d=
river and violates the dt-binding schema.
--

--- Patch [4]: [PATCH v2 4/6] ARM: dts: rockchip: Add support for RV1106 an=
d RV1103 ---
commit e0d1bbbfe5826e8f7c17c9a0008a5c218538f589
Author: Simon Glass <sjg@chromium.org>

ARM: dts: rockchip: Add support for RV1106 and RV1103

Add the devicetree files for the Rockchip RV1106 and its RV1103 package
variant. The pinctrl data comes from the vendor kernel in the Luckfox Pico
SDK.

Link: https://github.com/LuckfoxTECH/luckfox-pico

> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/r=
ockchip/rv1106.dtsi
> new file mode 100644
> index 0000000000000..7b2e6142a103f
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -0,0 +1,321 @@
[ ... ]
> +	pinctrl: pinctrl {
> +		compatible =3D "rockchip,rv1106-pinctrl";

[Severity: Medium]
Does this compatible string have accompanying dt-binding schema and driver
support? The 'rockchip,rv1106-pinctrl' string appears to be missing from the
upstream device tree schema and pinctrl driver, which could cause dtbs_check
validation failures and prevent the driver from probing.

> +		rockchip,grf =3D <&gpio1_ioc>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		gpio0: gpio@ff380000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0xff380000 0x100>;
> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&pinctrl 0 0 32>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			rockchip,grf =3D <&gpio0_ioc>;

[Severity: High]
Will the upstream pinctrl-rockchip driver parse these bank-specific syscons
properly? The upstream driver typically only parses the parent pinctrl node=
's
rockchip,grf property.

Could this cause register corruption when configuring pins? Since the parent
pinctrl node points to gpio1_ioc, the driver might use gpio1_ioc for all
banks. This would silently overwrite gpio1_ioc registers when attempting to
configure pins for other banks like gpio0 or gpio2.

Also, does adding the rockchip,grf property to the gpio-bank child nodes
violate the rockchip,gpio-bank.yaml schema which forbids additional
properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714193656.2196=
447-1-sjg@chromium.org?part=3D4
