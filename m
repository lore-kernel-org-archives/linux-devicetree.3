Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE136A344
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082913; cv=none; b=JbM7eenGnYIXUjvxI4lzwAAwONNNsr62YtvcucTsBeO6n2f+/vzSm5y7mfWBtklhOP8J20s6mFLGeyPC25QnjHwUpai3NTdF1NdXXWInLQ+BaWgDng429MuDcT16rqMMEYsfBdW4/wkJyfH5BshmfkH7JbqcUxLac97oNjZnwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082913; c=relaxed/simple;
	bh=W3VjTOkIrTH//0ee1DK/e21h2HizM11G0K72FHtMsjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qdDe/1m3rnWF/6GPQG24pxMg/KMhSCjXigqhOpUwXzmVaA4BmNYrk16RJesBNdzEsrxyJRHdx1c7hbVwd1c+2qoRmsSxnF2AecOB3BYYahswZRSypKPoCZBEuXJrfu9YVHoeEzutBS6QNZ4Q1MduMfy47luRbpIblnuWXd9MEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WejaMT7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WejaMT7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCC41F000E9;
	Sun, 26 Jul 2026 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785082912;
	bh=gT10HBre5lFTRsXiHyP1cgq+8/LSStSQ5jq7IxWQzkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WejaMT7sjNGO6qK1fva1McBE6qJvPAWfRX8JduDlYmA4TY0733OWflC3MFwoHxGBj
	 N56bOX59W/YtbQFxRkou8KMwW92/X0bra3wMWR/tWtk8lBZcMpHES7BECzWuiFvpCw
	 3UXML+L49lcyM+++YMoVzffy0iSKx4VcpnhETUELURkJwTFyXzfL42q+vcsiPL0snj
	 NzDWjHgwX3WmprETHYUatNUdnNLHZlfBYBQB6MfrQDjpx32NQ5wvxHdNeZnrSB5wsF
	 JIO1yA45OidYZtSxSxPZmyequMFZl/x8ZPOMNVmmKBBmNDHo6/7iW/oGxdNOrOZcsP
	 1Bjr65V/mBIkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add STM32H7R7 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <MN0PR19MB6091A851B810B5876AEB5123ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
 <MN0PR19MB6091A851B810B5876AEB5123ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:21:49 +0000
Message-Id: <20260726162150.EBCC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The unit-addresses of the GPIO child nodes within the pinctrl block=
 do not match their `reg` properties.
--

--- Patch [7]: [PATCH 7/9] ARM: dts: stm32: add STM32H7R7 SoC ---
commit 1a7b22190cc58150c29992f6135b131116e8634f
Author: Liu Changjie <liucj1228@outlook.com>

ARM: dts: stm32: add STM32H7R7 SoC

This commit adds the device tree include file for the STM32H7R7 SoC.
It describes the Cortex-M7 CPU, various clocks, EXTI, system configuration
controller, and GPIO banks available on these devices.

> diff --git a/arch/arm/boot/dts/st/stm32h7r7.dtsi b/arch/arm/boot/dts/st/s=
tm32h7r7.dtsi
> new file mode 100644
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
The pinctrl parent node maps child nodes to a relative, zero-based local
address space via the ranges property, so the reg property is correctly set
to 0x0.

Should the unit-address in the node name match the first address in the
reg property (e.g., gpio@0 instead of gpio@58020000) to avoid dtc validation
warnings about unit_address_vs_reg? This same pattern appears to affect the
other GPIO banks in this block as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785080950.gi=
t.liucj1228@outlook.com?part=3D7
