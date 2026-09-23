Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADF5304D4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177610; cv=none; b=fBf1mDXZce8NebPu/bkggOGvgtHeevTJ+UECRD+bF0wLWD+BHiAq8xVgsA8+YW+SETq2r039yPk0QFdNeQDSMOMZVOxIa4cuTQo+tcDSy15sGhz/Q9Y3K5L5V+jHd4HaMCXm4Ipg8V6GRbl8uhacaXdz44A6eCtx0tzz64kPcV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177610; c=relaxed/simple;
	bh=vwyuFcIhQf8W2x5NMXHldpKfnpDIrzDaAKmc6VSam7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V0sRaTiCU5eRU8ophGYvfmXKZG0w9ysF3Oq02IhS/cjMdoiCbh0oWBBvAVeeGywO14tY0OYtSL+Y7chzJMYQJiXcPVai7ehfSpMjUrSWTMaLH9u4xLxfsgINySDtqB84sJi33VmUjENtPkE9f/7x6KkgzYrsYSeZCKBgylIM0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJ7s27Ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJ7s27Ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFEB1F000FF;
	Wed, 23 Sep 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790177604;
	bh=J9aPqPhhEIfnbJsicIItkgSLJB1677zUhdKNJQqqd7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJ7s27Ox4cUKHIMQExaq0yCLlpQov6t+jPTXNq7X/WveQi0MxoTAxa0zW1jThTdwF
	 +QGRae2JBYPEWvEjzsiWcdoJ4bSElJgZpvb1FkLJzspdMXApsMTOZiCjyIVC2sf+HS
	 Yh5Wh63AsihB0NsIBtUdDKEzcBCA2giq8jYCt12OnKGXJnjbhJhuM/o+SA6+BeWTmu
	 nc2vqw+CZi/wNvk2HrOJviU9C4zmJrvySpkzwHNAclWwpy2gWc1PbPOLC+fZ+ynfsi
	 g0Ppov4X0EnwRh0t7LDPFdqju5hVSTGexOTkbZUMblylroKEGxDWW+dEHoeK0hEfUw
	 359Izj5xsyrqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: st: move Engicam
 MicroGEA-STM32MP257D-RMM display to an overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923152435.563925-2-dario.binacchi@amarulasolutions.com>
References: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
 <20260923152435.563925-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 15:33:24 +0000
Message-Id: <20260923153324.8EFEB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: brittle overlay redefining unrelated SPI CS pins
--

commit c7c6310b15d9d720d97a1d231991f453b51ab1cf
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay

This commit moves the RK050HR345-CT106A RGB panel and its touchscreen
configuration from the base device tree to a separate overlay. It leaves
common board elements intact to support multiple display variants.

> diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-over=
lay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-mic=
rogea-rmm-overlay-rk050hr345-ct106a.dtso
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk0=
50hr345-ct106a.dtso
[ ... ]
> +&spi1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	cs-gpios =3D <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Since this overlay redefines the entire cs-gpios array, including the
unrelated CS1 pin (<&gpioh 3 GPIO_ACTIVE_HIGH>), could this silently revert
and break the CS1 device if the base board's CS1 wiring changes in the
future?

> +
> +	display@0 {
[ ... ]
> diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts =
b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
> --- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
[ ... ]
> @@ -257,23 +228,9 @@ &spi1 {
>  	pinctrl-1 =3D <&spi1_sleep_pins_a>;
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> -	cs-gpios =3D <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
> +	/* CS0 is reserved for the display fitted through overlay */
> +	cs-gpios =3D <0>, <&gpioh 3 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does setting the base board's CS0 pin to a <0> placeholder force the overlay
to redefine the entire cs-gpios array? Would it be safer to let the base
board define the full physical cs-gpios array here (including CS0), allowing
the overlay to only append the SPI device node?

>  	status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923152435.5639=
25-1-dario.binacchi@amarulasolutions.com?part=3D1
