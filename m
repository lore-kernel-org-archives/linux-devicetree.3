Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9903CB574
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083202; cv=none; b=eqqULL9sbeTnEmerDE14hM+XNHPVsp2tBttpP+4f8auY1iOarHnvogVn1EDiF5qV9ZHBpeISc9VzN8n+PLad4z66gjSnT/5NYjd6eIkxzdDbCVGrOHYVnH1oK4Apm3FwMzorXIBpqnRFR+C8LeaZiHkIwsfTxw6m7bRqDIKF3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083202; c=relaxed/simple;
	bh=8TX68IzQ7Q1ETHelj5qfCyCMz9RtUl2Izi4HhEA39uw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DjLqcvLAse754rV7Wm6NDnShQ/qIynl1R9YiWxcfLEuvsCwAVo16BEZmELzYomPgP7OYFW3g8gIbM7W0dDV2ayrO0k61cf5fPOJuG1D31wqHZGEPElsO4wXDmRRKaS4LUn9O6huFK0Bo0WWdzmgg+bk3Kxh0qruDHEvkmNkCDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHh1ztFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHh1ztFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6442E1F000E9;
	Sun, 26 Jul 2026 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083200;
	bh=xoPHRmyz3pkVRKAU3ZtvZtwwa1bQeGqe/5XVIVSh6yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YHh1ztFVEBgheY6trjEeuf16WsiHp8TI9uMJbXLfSQ+IsCwTq80YF7F8dgswVC20m
	 6GNfCq04tbxIDjt10rgjz/hT5B8Q7AqA8Y57S+WB4HFnHqmBrtQy5tPR5y8BLv2cYg
	 Gvf3lrmH3Zw+Gdybx0mx1j7SuItJG0FcDPnPBRNDMOAl81O4BzdfYzbQNC+7ToKJ+2
	 wcEysGlROLl5UQBPPP1Y/bnPoHpMtAHZ2HYCuZeTjTFRMD5Dm0ng8msBqeXIyaXWPs
	 TascGmZ84y5XpiW+Y+o8uA1xW8eB4Mtvjpt7ezGSz1cdOKQwiY7jKcDRQiHYg/ho37
	 s8a3LeOM5NqHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 7/9] ARM: dts: stm32: add STM32H7R7 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <MN0PR19MB609159EC2888184313D616F8ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB609159EC2888184313D616F8ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:26:39 +0000
Message-Id: <20260726162640.6442E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between unit-address and `reg` property in GPIO bank nodes=
 within the `pinctrl` block.
--

--- Patch [7]: [PATCH RESEND 7/9] ARM: dts: stm32: add STM32H7R7 SoC ---
commit e7124a5b13abf93e1321e7a33e469a82c2e13c42
Author: Liu Changjie <liucj1228@outlook.com>

ARM: dts: stm32: add STM32H7R7 SoC

This commit adds the device tree include file for the STM32H7R7 SoC. It
describes the CPU, clocks, timers, UART, SDMMC, and various GPIO banks with=
in
the pinctrl block.

> diff --git a/arch/arm/boot/dts/st/stm32h7r7.dtsi b/arch/arm/boot/dts/st/s=
tm32h7r7.dtsi
> new file mode 100644
> index 0000000000000..ad25dddbe6ed8
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32h7r7.dtsi

[ ... ]

> +		pinctrl: pinctrl@58020000 {
> +			compatible =3D "st,stm32h7rs-pinctrl";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0 0x58020000 0x4000>;
> +			interrupt-parent =3D <&exti>;
> +			st,syscfg =3D <&syscfg 0x130>;
> +
> +			gpioa: gpio@58020000 {
> +				reg =3D <0x0 0x400>;

[Severity: Low]
Should the unit-address match the first address specified in the reg
property? Because the parent pinctrl node sets ranges =3D <0 0x58020000 0x4=
000>,
the child nodes' reg properties are relative to 0. Would it be better to use
gpio@0 instead of gpio@58020000 to avoid dtc -Wunit_address_vs_reg warnings?

This pattern appears to repeat for the subsequent GPIO banks as well, such =
as
gpiob: gpio@58020400 having reg =3D <0x400 0x400>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MN0PR19MB60912FA1E7=
5E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com?part=3D7
