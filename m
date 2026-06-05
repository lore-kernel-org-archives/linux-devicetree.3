Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D0381AE3
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662688; cv=none; b=FnjKuRqpASZCq8lnozpbicCrMK1Sr6+Z+aj4Y3jtY3jAX1khzSWfZasu0Kup9JVb8Zhb33rTbVf+bpINveVD0hEtqWdU0jkPoRcFehCaguws4Bpyx3Abx1AVUU1S8wdAAMuo/tXATzefsj8zl/fhtkw4+pkCTkj92juOgEDM+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662688; c=relaxed/simple;
	bh=FDfGFaKWm0Wmagrfj12M7Sg0KxRO931/smyqhSx2wPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jVjTcW4AKlw7+CuOtYAQaOegl5iUMy0dr3B23hX0KQNdyya8lfvjJs3ALR7ugySVqv8ZMEn6lHfFc+CzbCNt/ErlAv/pQkArGClxx42kDLMFV9hCdcb8nsLe3kxC66qTR9NQwMG4NMaLpVMoeEGXiyXzSx/zNhCZx3I4fH2gUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mimuyVjT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mimuyVjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A181F00893;
	Fri,  5 Jun 2026 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662687;
	bh=WsjGpE34lVlDwNdOUdRZe+qUXXtq5eop+7nebHRtvVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mimuyVjTclAj/XbmJc8W8kTTxq7W7v6/3IdbBHChATo1lqY/PBz40ePZTzyCG+X5j
	 SsJmAb4rOjL+9biTBQ4pYxsjh0Y+qlmCm2kY5cCUzV6Nqkz2wU8pKVXV3hYiV13owM
	 Q+oM99JVZbij8301atB3eb85MdURdMpOim1b5MeQzVvirEL3cMIpWubf7ctWyaE1aP
	 Z+bRm9fqtiDbxorMCtdfOkhqJx0aEpvbZPyYbHZhETDAyXzGXHSN+ej5le9ag7f1g5
	 /j2BiicSGrNX4frtoUBw0VApqTYh5XCo9sMg9Z0hZn2V3id0pXYlu6we3ZpDPq2cMm
	 sRSY0dozmRA3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/14] arm64: dts: st: add SDMMC2 support on
 stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605121957.78409-3-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 12:31:26 +0000
Message-Id: <20260605123127.27A181F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `sdmmc1` node is missing the `power-domains =3D <&CLUSTER_PD>;=
` property.
--

commit c335b379d3b92c5ba6ea39f1676b98852d4b2ebe
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add SDMMC2 support on stm32mp25

This commit adds support for the SDMMC2 controller on the stm32mp25
platform. The controller supports SD cards, eMMC memories, and SDIO
devices.

> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts=
/st/stm32mp251.dtsi
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1667,6 +1667,22 @@ sdmmc1: mmc@48220000 {
>  				status =3D "disabled";
>  			};

[Severity: High]
This is a pre-existing issue, but I noticed that the sdmmc1 node in the
context block above lacks a power-domains property.

Does the sdmmc1 controller also depend on the CLUSTER_PD power domain,
similar to the newly added sdmmc2 node?

Without the power-domains property, the kernel's power management framework
will not ensure that the domain is powered on when sdmmc1 is active, nor
will it handle suspend/resume power transitions for the controller. If
sdmmc1 is accessed while the bus is unpowered, it might trigger
asynchronous external aborts or bus faults leading to a kernel panic.

If sdmmc1 is used as primary storage, could this make the system unusable
or fail to resume properly?

> =20
> +			sdmmc2: mmc@48230000 {
> +				compatible =3D "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
> +				arm,primecell-periphid =3D <0x00353180>;
> +				reg =3D <0x48230000 0x400>, <0x44230800 0x8>;
> +				interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&rcc CK_KER_SDMMC2>;
> +				clock-names =3D "apb_pclk";
> +				resets =3D <&rcc SDMMC2_R>;
> +				cap-sd-highspeed;
> +				cap-mmc-highspeed;
> +				max-frequency =3D <120000000>;
> +				access-controllers =3D <&rifsc 77>;
> +				power-domains =3D <&CLUSTER_PD>;
> +				status =3D "disabled";
> +			};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121957.7840=
9-1-dario.binacchi@amarulasolutions.com?part=3D2
