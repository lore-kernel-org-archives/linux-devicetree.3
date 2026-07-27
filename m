Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03C1E8342
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156264; cv=none; b=PcBK6spxe+AQCDpDxuoBRohx2bfXqy5N1dCtpAb/QMMDwDCMsbqh6tvYAeKn0kOEuIOBiZOlEHij4zuSOMIJk7J5RCyzqeUm+7YQ3rIIrPYoeJCcYGr92J/tO3Ems6tbYueCUfE2Gbf9NwA/65WD2jPPu5D4YfQoIhOkNUhA18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156264; c=relaxed/simple;
	bh=Z2UaCMeOCQK1/cC/RWFPhB9Z9j/K/7uwWtHEBq0P2SM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OcHLeLSCONy35mnEMrc0iFfQ7CUqlthV289T0x1IU4EUyHfwFGAKqCY8KUhBqKA4GjNfmS3XG/fO8hiSX+Kx7og4ppJnE4nKEV00arZAYd0JQ/b+bRjm87+F5mbLzvCHBslwhR7o6+6fyaiDzKi+7nzHEQVBkUHYMlAy2p6g7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hswdVj12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hswdVj12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B995C1F000E9;
	Mon, 27 Jul 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156263;
	bh=4fPeIQFMCQB4DKKJP6D2X/FpHHWDsgaRSpCiptiQlZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hswdVj12/gFEUnVCqIZhx9aoSm641t1YV3XkAz7vbrGv1cevvGz4FmtqtguDUX4Kt
	 I7cFG61CTOUF6hhdnVT7Xd1Md8oaTC3PMDyDdoxopiC7UcUxOKL0ehOrPpZRAhTtV3
	 qXVJkb6vOYknQqo8gONGfW89KG36EKomzYDmc5CN5UFEK0PwwBDLNttmmw+eXV/awy
	 x8SGnBk+OWj54UbUzVFWfLix03FygOctgmuQrSxiauRakBm5wQJXIHzNVtnRrdLWXZ
	 nGN/XMrc0CAXtdaoIdVtMD+Uc/KHUQf6vlxaK8hiIWuJHSvJRSUgNQw1l25kaL3ud6
	 yX0q/415XOX2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/16] ARM: dts: microchip: sama7d65: add otpc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727122633.117435-14-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-14-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:44:22 +0000
Message-Id: <20260727124422.B995C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added `temperature_calib` NVMEM cell is not referenced=
 by the `adc` node, causing the ADC driver to silently skip temperature sen=
sor initialization.
- [Low] The `<dt-bindings/nvmem/microchip,sama7g5-otpc.h>` header is includ=
ed but completely unused.
--

--- Patch [13]: [PATCH v4 13/16] ARM: dts: microchip: sama7d65: add otpc no=
de ---
commit dd1db22ae5d7132965b472e571b6275cf5176e96
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add otpc node
   =20
Add OTPC node along with temperature calibration cell.

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
This isn't a bug, but should this header be included? It doesn't appear
to be used in this file, as the calibration cell uses a TAG-based NVMEM
access instead of the OTP_PKT() macro provided by this header.

> =20
>  / {
>  	model =3D "Microchip SAMA7D65 family SoC";
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
Should the adc@e1000000 node be updated to reference this newly added cell?
Without 'nvmem-cells =3D <&temperature_calib>;' and
'nvmem-cell-names =3D "temperature_calib";' properties in the adc node, the=
 ADC
driver will silently skip temperature sensor initialization when it receives
-ENOENT from nvmem_cell_get().

> +			};
> +		};
> +
>  		gic: interrupt-controller@e8c11000 {
>  			compatible =3D "arm,cortex-a7-gic";
>  			reg =3D <0xe8c11000 0x1000>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D13
