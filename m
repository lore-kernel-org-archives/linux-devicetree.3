Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C9311C15
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217945; cv=none; b=a/zI7s2DVDgXfzvTqNOO+QOyjxpeaqSoprn+vzQEgqCv+0w/UIaALrRdEHKmxQ0SIMa8N7PxP13ari/YSKU0kNBjlTnnxutfhiC+wRle81Q4F6ROCaWvQ7OqFKE0mZTwro2rJhoKwmbRIN3mdCWE++rmieTSj/N4mQvZCMzCGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217945; c=relaxed/simple;
	bh=vbsT9qzmslt8RWHyL6ZNey1Co9uobITEPp1+lzrVwJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cQv2dck2jaiSLLsvIBC+hzOgtWBrCBAtdvRZDo/qJ0PhxOYQ1y5GB8PuMG5La+UcrDtrW+pHCwaXJy5aZgMDtxNnHDs5jf59d36rv0PKd4tjFEyM33AARp8CQdT61JOnsgIKlHXtOVluF0DicCL4jkqCUkGv5iu5X/mpo162TSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqkV+Dz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqkV+Dz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B28F1F000E9;
	Thu, 20 Aug 2026 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787217934;
	bh=cUtL3u/uUl6DjSrJxBzHA+y8UhZygRGx/b25XIsQU8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqkV+Dz+ludYK9AKNceRZ/G7Ga6rTR6Nnd2WGqIyWFsobUEnFDicfyhdSYNwGmtEy
	 XB/DfhAlbM9t+owaYngB+xAbvfyjvVQJpKeJiDXQ5+AZ4yJGsJkn8i6MCrC3mEu61y
	 zx14sX27EFAQxALklFLaaW85f3YuOVT3hdMgmS7ZbP34Ikz+8LY+rgFY+Owyb1jrmk
	 V4//Tw4YQfFcsDfLjVb470lQheDAIay7uqAxxp8iHNvkJopZSg+Gu/igHwP2BuayOs
	 csjagn+wGB0Pzkd/MJdNVm3Y8HaRKfPZlwPo2dnzueyAbx5Sl4zTTL1fLquVn66W8Y
	 kUHYypPzfyVIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 15/16] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257D-RMM board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260820091652.43541-16-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
 <20260820091652.43541-16-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:25:34 +0000
Message-Id: <20260820092534.8B28F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GPIO LED nodes ('led-0', 'led-1') lack 'color' and 'function=
' properties, which are required for correct sysfs directory naming by user=
-space LED managers.
--

--- Patch [15]: [PATCH v8 15/16] arm64: dts: st: support Engicam MicroGEA-S=
TM32MP257D-RMM board ---
commit 8abcb6fbdc6467a93764ff0fd12f19a18a0215bf
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board

This commit adds device tree support for the Engicam MicroGEA-STM32MP257D-R=
MM
board. It enables various peripherals including LEDs, CAN, a touchscreen pa=
nel,
and audio components.

> diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts =
b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
> new file mode 100644
> index 0000000000000..f5af0913bf1b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			gpios =3D <&gpioh 2 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			status =3D "okay";
> +		};

[Severity: Medium]
Should this node include color and function properties?=20

Modern user-space LED managers rely on these properties to create standard=
=20
sysfs directories named <color>:<function>. Without them, the LED will be=20
exported with the non-standard name led-0, which can prevent user-space fro=
m=20
correctly identifying its hardware role.

> +
> +		led-1 {
> +			gpios =3D <&gpioh 6 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			status =3D "okay";
> +		};

[Severity: Medium]
Similarly, does this node also need color and function properties instead of
relying on the led-1 node name for sysfs directory creation?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820091652.4354=
1-1-dario.binacchi@amarulasolutions.com?part=3D15
