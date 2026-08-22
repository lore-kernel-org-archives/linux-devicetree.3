Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5FB25B083
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386054; cv=none; b=UZaQJLVbnVLSAhgKyRhW/etZkbDD5dTJmzRTiBPd9+Ap1yhP/3Np6TxI366w3Hcy/zQd30f1payyfZqZ9OwWgeZ/tYzW+ulJCQLhhEoU9TgsvpqYZQ0hFkpFIJRgdKgAXa9WDrbhFupKWmbDup1TjrKiFTeCFi+Go71LW/1iLX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386054; c=relaxed/simple;
	bh=7wR2HFlMqSxzBqflBwdxFCettv7DohJW8GIftAVOiqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YV7AZ7u8R6wxP/ggTPnZWkNoE5QgzIFBorFAJoDOCxqlLK16671JISDm/W8YqDUpFOLQBOBPc9UA7gy0uO+kwc+yUHYJVWOIqs7jQq5ZIp6vOB/a1rrRSEkYG4QU5EsObpXqp1Vgo1bywN4tLkcVzEvC2YeKjikbvymVnPg1KSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDdYVWqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDdYVWqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638D31F000E9;
	Sat, 22 Aug 2026 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787386051;
	bh=wS0a+0IO6gtkkzaxgSn4a/yg01wvo51TIr/LCzO0YDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDdYVWqIMW8pZZ+IhGuqbQkL11YJ127Sk0xteSpdpJiHgWezW+MYwOu50xDbO4LT7
	 toGJLaeG8KhzaNFsrdXtPcCzNm6HtnvngDauXgsqQMEO7SpuGGsPwCzbtr7tNkfcen
	 PS+jPiwIJw5y5IvvCrISdBJq4SPfU2iRwaIZBnWTL/1pTWw3vEDHT/OI/Q7lDYS9Az
	 W8524AJB5JMDNNUTNrgJ9Jtog/P57oJaEtSqiy69rN2L3arG1N3ZTntStYmJs3Cu2K
	 TYC9ylQkFM4t/PUYdfXzAORFXQdfYV3mGhZNP1s5rHrebM4kpdn6XLR1C4oxleBjSI
	 p2W8TmVcUJnnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] arm64: dts: st: Add USB nodes on stm32mp231
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260822074816.548662-9-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-9-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 08:07:30 +0000
Message-Id: <20260822080731.638D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `ranges` property in the `simple-mfd` `syscfg` node caus=
es a kernel WARN_ON during boot.
--

--- Patch [8]: [PATCH v3 8/9] arm64: dts: st: Add USB nodes on stm32mp231 -=
--
commit b21748ed09e5c154d11bfc7972df50b9735bfab9
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: st: Add USB nodes on stm32mp231

This commit adds USB controller and PHY nodes to the stm32mp231 device tree.
It also converts the syscfg node into a simple-mfd to contain the new PHY
subnodes.

> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts=
/st/stm32mp231.dtsi
> index 9e1d240888ff2..db66777a8c9a0 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi

[ ... ]

>  		syscfg: syscon@44230000 {
> -			compatible =3D "st,stm32mp23-syscfg", "syscon";
> +			compatible =3D "st,stm32mp23-syscfg", "syscon", "simple-mfd";
>  			reg =3D <0x44230000 0x10000>;
>  			#clock-cells =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[Severity: Medium]
Is there a missing ranges property here?

Since the syscfg node is now a simple-mfd bus with children that have reg
properties (usb2_phy1 and usb2_phy2), omitting the ranges property causes
address translation to fail.

During boot, when of_platform_populate() tries to instantiate the children,
of_address_to_resource() will fail to translate the child addresses. This
triggers a WARN_ON() in drivers/of/platform.c:of_device_alloc() for each
child device, which pollutes the boot log and could cause boot failures if
panic_on_warn is enabled.

> +
> +			usb2_phy1: phy@2400 {
> +				compatible =3D "st,stm32mp25-usb2phy1";
> +				reg =3D <0x2400 0x24>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822074816.5486=
62-1-marex@nabladev.com?part=3D8
