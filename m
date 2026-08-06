Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C53EEAC2
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008218; cv=none; b=gQimVLEn6+tahB8Zmitv6JsG+qAQgZ4+IRsFJ95lOOigCVCS++ulOgfk+0LVm3EwhcGok2Z88bSlwVhpu1ZiMTSznNsdHYZ9wEzfpsgFSxn7K5C/nVEWgAn4DNE/6uAOTMbhpe0dZ+SaAmDpVjOQ5QJnPWvcIQcEcOWmhw8+EHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008218; c=relaxed/simple;
	bh=AESytNUizgGxpRjVnxhOin9qUUoSDsXeKoY93IMJNBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AdZg+enNHFoW6oPDbqP/TvbYK7EMO25p3eikFX+ZkO0UtNU3uaqF8PrKnRUN0alE3YT07je0AySnvJEIUca2e3AATXLPrnS+WSgrnl9yn/jU6Bbevm1Cm5A0SG2ftuGKbIT4cERn7JR//J0YAWk77CBs8rAMM1BQ9VzU+MRyBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWuHe5fM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWuHe5fM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0A91F000E9;
	Thu,  6 Aug 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008217;
	bh=8jVDrVajaf3Q6ojKRQKvsGo0JTZIg7xIbONaFgu9klc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWuHe5fMovB8OQqFLoFNpDogd83eEBQ2ng+Nhiwcj1Gba4X5CMqOe/vv/nvxu6Nvf
	 vandKfOC24yC/l4Jto5chRFfeB9HO4RkIUsfkvO1IQ5MSqC3uQi/4a3/fiG7ADA5FD
	 +VACWtZ7HDmQ2eqOCvpbLp6qiINUObppYp/Z0hJAZv2TOC7Lg8vmha9tsJAWVdXnUL
	 FNeIuo7bCQfDeCbnOmlKtuGH2UfiWnCAAZMnV/R9vhFLx1JsQLqnp6frSqIdVCTUGf
	 l10xFhUy4bYsa8rw+xmy89HHv3TzhtvZ73juhFUOjwcLeWcAQlaeiJ2swKIIqQGrNm
	 ATqmWJOFPQxAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/17] ARM: dts: microchip: sama7d65: add otpc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806074024.531259-15-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:23:36 +0000
Message-Id: <20260806092336.DD0A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The temperature calibration cell is defined but not linked to th=
e ADC node, leaving the temperature sensor feature disabled.
- [Low] The patch includes the `microchip,sama7g5-otpc.h` header but does n=
ot use its macros.
--

--- Patch [14]: [PATCH v6 14/17] ARM: dts: microchip: sama7d65: add otpc no=
de ---
commit 82cd7693b0c9ba34b6386bb02bb96ebcefa462e6
Author: Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: ARM: dts: microchip: sama7d65: add otpc node

This commit adds the OTPC (One Time Programmable Controller) node to the
SAMA7D65 device tree. It also includes the nvmem layout and the definition
for the temperature calibration cell.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index c35f27615bc49..aac2e22d96cb3 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/mfd/at91-usart.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

[Severity: Low]
Is this dt-bindings header inclusion necessary?=20

The macros defined in this header do not appear to be used, as the newly
added otpc node relies exclusively on direct hex values for its registers
rather than using the macros.

[ ... ]

> @@ -1111,6 +1112,21 @@ ddr3phy: ddr3phy@e3804000 {
>  			reg =3D <0xe3804000 0x1000>;
>  		};
> =20
> +		otpc: efuse@e8c00000 {
> +			compatible =3D "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "=
syscon";
> +			reg =3D <0xe8c00000 0x100>;
> +
> +			nvmem-layout {
> +				compatible =3D "fixed-layout";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +
> +				temperature_calib: calib@41435354 {
> +					reg =3D <0x41435354 0x2c>;	/* Temp calib data packet TAG */
> +				};

[Severity: Medium]
Should the existing ADC node be updated to reference this new temperature
calibration cell?

Without linking this new cell to the ADC node (adc@e1000000) using the
nvmem-cells and nvmem-cell-names properties, the ADC driver
at91-sama5d2_adc.c will return -ENOENT when attempting to call
nvmem_cell_get().

This causes the driver to silently skip registering the temperature channel
during probe, leaving the sensor disabled and this new calibration data
unreferenced.

> +			};
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D14
