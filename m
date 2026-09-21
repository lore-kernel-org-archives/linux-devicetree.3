Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC76E4EF147
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015698; cv=none; b=rX97GWn+z0r+JtaR+vjkT0C5gKtAqksVhOJt4vg9BLRLUnrMVmze1F9jahro2ikffntofSS1Px/EzzlwDyB+RWwJs1Cdi6Xy9BBefauWofVGs7ZFfFdg2Ej30x2FQWkGG5XB3I0iIVlT7xaFWUIq8QzdjjGcn5mpRevMtne3Jws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015698; c=relaxed/simple;
	bh=+GZlDF00SXYCakcOLp8qI8tNmj5yaM4Qr10T5COr4m8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HIAx6WTFBaRR9t1uj9TuLpDCHCbZtshkE2axUEPxA+00nL45/l+qDPd6EZ+jdes6gS/2+W6vAV6Zu46fsG5Pm5N8y3vbZhMiLm8Yz2Pj+iOXIDjc/6niTaEh2ptTM/Bw5TBE9aIudbGBC5/w4fJTZqWVPMSOE52l0UkVj+1L7o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyVld43t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyVld43t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247A81F000FF;
	Mon, 21 Sep 2026 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790015696;
	bh=om0Bsp+qGZwrmQu63vKRb8lV7OQRx70hiohcMMFLYgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WyVld43t8j6VJJW/GtGT8CXAJVJSOvgFrQnVYywlEiVcKmvG30hSsC2BJK62X5BIu
	 btJW6aLKMF4SbgdlqVnPmSlC184280ZsckDofMgkI64N0FsgzGk1fdMsmKorBU9Q2M
	 2XofhWR1NtXhjAM4eU5/FaO4QT+lRafR0a563LYNhpzwpIhXFB5LVyEp9iMdKyD8kq
	 UT1RRitWY3YaqatMgRvLuK1chKB7SPVMAbYVPzBpu7vk7JlHYc8cq84C1Tw3qVi2H4
	 ye2LswhuxCUkefbkRFOQxCOzNEigdsG/Nd7XyBWihMRDIysu0+b0hjxd5nuGW1Z4Sk
	 6gauIMg1aBgLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] arm: dts: sunplus: add PWM, watchdog and MMC
 nodes to SP7021 DTSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921182620.17597-4-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
 <20260921182620.17597-4-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 18:34:55 +0000
Message-Id: <20260921183456.247A81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: board-specific MMC properties hardcoded in SoC-level .dtsi
--

commit 17776a65b44f3bc151f243f012bdb8edd8912aba
Author: Andrew Gaylard <ag@ffroot.co.za>

arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI

This commit adds device nodes for the PWM controller, Watchdog controller,
and eMMC controller to the SP7021 generic SoC device tree include file.
It also adds a label to the gpio-leds node to allow overrides by board file=
s.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boo=
t/dts/sunplus/sunplus-sp7021.dtsi
> index ae9bbe0320b8d..17185238e7ba7 100644
> --- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
[ ... ]
> +		mmc0: mmc@3b00 {
> +			compatible =3D "sunplus,sp7021-mmc";
> +			reg =3D <0x3b00 0x180>;
> +			interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clkc CLK_CARD_CTL0>;
> +			resets =3D <&rstc RST_CARD_CTL0>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&emmc_pins>;
> +			bus-width =3D <8>;
> +			max-frequency =3D <52000000>;
> +			non-removable;
> +			disable-wp;
> +			cap-mmc-highspeed;
> +			mmc-ddr-3_3v;
> +			no-sdio;
> +			no-sd;

[Severity: Low]
Are these board-specific form-factor and electronic configurations appropri=
ate
for the generic SoC-level dtsi file?

Hardcoding properties like non-removable, bus-width =3D <8>, no-sd, and no-=
sdio
in the generic SoC definition violates Device Tree design principles. If a
future board based on this SoC routes the mmc0 controller differently, such
as to a removable SD card slot, it will inherit these inappropriate propert=
ies.

Does this mean developers would have to use cumbersome /delete-property/
directives in their board dts files to undo the SoC-level configuration just
to make an SD card work?

> +			status =3D "disabled";
> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921182620.1759=
7-1-ag@ffroot.co.za?part=3D3
